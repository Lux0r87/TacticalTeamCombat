/*
	Created by Lux0r
*/


#include "penalty.inc"

private ["_unit","_killer","_unitIsPlayer","_killerIsPlayer","_factionUnit","_factionKiller","_side"];

_unit			= [_this, 0] call BIS_fnc_param;
_killer			= [_this, 1] call BIS_fnc_param;
_unitIsPlayer	= isPlayer _unit;
_killerIsPlayer	= isPlayer _killer;

/*[
	["Function: %1", "TTC_BTC_fnc_killed"], ["_unit = %1", _unit], ["_killer = %1", _killer], ["_unitIsPlayer = %1", _unitIsPlayer], ["_killerIsPlayer = %1", _killerIsPlayer]
] call TTC_CORE_fnc_log;*/


// Check if killer is a human player.
if (_killerIsPlayer && (_unit != _killer)) then {
	// Workaround: Use factions instead of sides. Side for dead unit is always CIV!
	_factionUnit	= [faction _unit, 0, 2] call BIS_fnc_trimString;
	_factionKiller	= [faction _killer, 0, 2] call BIS_fnc_trimString;

	// Check for team kill.
	if (_factionUnit == _factionKiller) then {
		// Skip if both are in the same vehicle, to avoid penalty for crashes (e.g. with helicopter).
		if (vehicle _unit != vehicle _killer) then {
			// Penalty for the player.
			if (_unitIsPlayer) then {
				[[], "TTC_BTC_fnc_punishForTeamkill", _killer, false] call BIS_fnc_MP;
			} else {
				[["Team Kill (AI)", TTC_BTC_PENALTY_TEAMKILL_AI], "TTC_BTC_fnc_addBalanceChange", _killer, false] call BIS_fnc_MP;
			};
		};
	} else {
		// Get the base position for the side/faction.
		_side		= [faction _unit] call TTC_CORE_fnc_getSideForFaction;
		_basePos	= getMarkerPos format ["mrk_Base_%1", _side];

		if (format ["%1", _basePos] != "[0,0,0]") then {
			// Check for base rape.
			if ((_unit distance _basePos) <= TTC_BASE_safetyDistance) then {
				[["Base Rape", TTC_BTC_PENALTY_BASERAPE], "TTC_BTC_fnc_addBalanceChange", _killer, false] call BIS_fnc_MP;
				[format["%1 got punished for base raping!", name _killer], "TTC_CORE_fnc_systemChat", true, false] call BIS_fnc_MP;
				_killer setDamage 1;
			};
		};
	};
};

// Remove the gear from dead AI soldiers.
if (!_unitIsPlayer) then {
	[_unit] call TTC_BTC_fnc_removeGear;
};
