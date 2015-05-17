/*
	Created by Lux0r
*/


#define TTC_CORE_penalty_teamkillAI		-500
#define TTC_CORE_penalty_teamkillPlayer	-1000
#define TTC_CORE_penalty_baseRape		-2000

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
				[["Team Kill", TTC_CORE_penalty_teamkillPlayer], "TTC_BTC_fnc_addBalanceChange", _killer, false] call BIS_fnc_MP;
			} else {
				[["Team Kill (AI)", TTC_CORE_penalty_teamkillAI], "TTC_BTC_fnc_addBalanceChange", _killer, false] call BIS_fnc_MP;
			};
		};
	} else {
		_side = switch (faction _unit) do {
			case "BLU_F";
			case "BLU_G_F": {
				"WEST";
			};
			case "OPF_F";
			case "OPF_G_F": {
				"EAST";
			};
			case "IND_F";
			case "IND_G_F": {
				"GUER";
			};
			default {
				"";
			};
		};

		// Get the base position for the side/faction.
		_basePos	= getMarkerPos format ["mrk_Base_%1", _side];

		if (format ["%1", _basePos] != "[0,0,0]") then {
			// Check for base rape.
			if ((_unit distance _basePos) <= TTC_BASE_safetyDistance) then {
				[["Base Rape", TTC_CORE_penalty_baseRape], "TTC_BTC_fnc_addBalanceChange", _killer, false] call BIS_fnc_MP;
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
