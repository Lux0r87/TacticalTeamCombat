/*
	Created by Lux0r
*/


#define TTC_CORE_penalty_teamkillAI -500
#define TTC_CORE_penalty_teamkillPlayer -1000

private ["_unit","_killer"];

_unit	= [_this, 0] call BIS_fnc_param;
_killer	= [_this, 1] call BIS_fnc_param;

/*[
	["Function: %1", "TTC_BTC_killed"], ["_unit = %1", _unit], ["_killer = %1", _killer]
] call TTC_CORE_fnc_log;*/


// Check if killer is a human player.
if ((isPlayer _killer) && (_unit != _killer)) then {
	// Workaround: Use factions instead of sides. Side for dead unit is always CIV!
	_factionUnit	= [faction _unit, 0, 2] call BIS_fnc_trimString;
	_factionKiller	= [faction _killer, 0, 2] call BIS_fnc_trimString;

	// Check for team kill.
	if (_factionUnit == _factionKiller) then {
		// Penalty for the player.
		if (isPlayer _unit) then {
			[["Team Kill", TTC_CORE_penalty_teamkillPlayer], "TTC_BTC_fnc_addBalanceChange", _killer, false] call BIS_fnc_MP;
		} else {
			[["Team Kill (AI)", TTC_CORE_penalty_teamkillAI], "TTC_BTC_fnc_addBalanceChange", _killer, false] call BIS_fnc_MP;
			[_unit] call TTC_BTC_fnc_removeGear;
		};
	};
};