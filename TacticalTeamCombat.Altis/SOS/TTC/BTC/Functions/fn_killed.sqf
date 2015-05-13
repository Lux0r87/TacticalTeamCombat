/*
	Created by Lux0r
*/


#define TTC_CORE_penalty_teamkillAI -500
#define TTC_CORE_penalty_teamkillPlayer -1000

private ["_unit","_killer","_unitIsPlayer","_killerIsPlayer","_factionUnit","_factionKiller"];

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
		// Penalty for the player.
		if (_unitIsPlayer) then {
			[["Team Kill", TTC_CORE_penalty_teamkillPlayer], "TTC_BTC_fnc_addBalanceChange", _killer, false] call BIS_fnc_MP;
		} else {
			[["Team Kill (AI)", TTC_CORE_penalty_teamkillAI], "TTC_BTC_fnc_addBalanceChange", _killer, false] call BIS_fnc_MP;
		};
	};
};

// Remove the gear from dead AI soldiers.
if (!_unitIsPlayer) then {
	[_unit] call TTC_BTC_fnc_removeGear;
};
