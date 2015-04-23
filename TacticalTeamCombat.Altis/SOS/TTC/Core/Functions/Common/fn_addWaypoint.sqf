/*
	Created by Lux0r
*/

private ["_grp","_wpPos","_wpType","_wpBehaviour","_wpCombatMode","_wpSpeed","_wpFormation","_wpPlacementRadius","_wpCompletionRadius"];

_grp				= [_this, 0] call BIS_fnc_param;
_wpPos				= [_this, 1] call BIS_fnc_param;
_wpType				= [_this, 2, "MOVE", [""]] call BIS_fnc_param;		// "MOVE", "SAD", "HOLD", "SENTRY", "GUARD", "TALK", "SCRIPTED", "LOITER", ...
_wpBehaviour		= [_this, 3, "UNCHANGED", [""]] call BIS_fnc_param;	// "UNCHANGED", "CARELESS", "SAFE", "AWARE", "COMBAT", "STEALTH"
_wpCombatMode		= [_this, 4, "NO CHANGE", [""]] call BIS_fnc_param; // "NO CHANGE", "BLUE", "GREEN", "WHITE", "YELLOW", "RED"
_wpSpeed			= [_this, 5, "UNCHANGED", [""]] call BIS_fnc_param;	// "NO CHANGE", "LIMITED", "NORMAL", "FULL"
_wpFormation		= [_this, 6, "NO CHANGE", [""]] call BIS_fnc_param;	// "NO CHANGE", "COLUMN", "STAG COLUMN", "WEDGE", "LINE", ...
_wpPlacementRadius	= [_this, 7, 0, [0]] call BIS_fnc_param;
_wpCompletionRadius	= [_this, 8, 5, [0]] call BIS_fnc_param;

/*[
	["Function: %1", "TTC_Core_addWaypoint"], ["_grp = %1", _grp], ["_wpPos = %1", _wpPos], ["_wpType = %1", _wpType], ["_wpBehaviour = %1", _wpBehaviour],
	["_wpCombatMode = %1", _wpCombatMode], ["_wpSpeed = %1", _wpSpeed], ["_wpFormation = %1", _wpFormation], ["_wpPlacementRadius = %1", _wpPlacementRadius],
	["_wpCompletionRadius = %1", _wpCompletionRadius]
] call TTC_CORE_fnc_log;*/


_wp = _grp addWaypoint [_wpPos, _wpPlacementRadius];
_wp setWaypointType _wpType;
_wp setWaypointBehaviour _wpBehaviour;
_wp setWaypointCombatMode _wpCombatMode;
_wp setWaypointSpeed _wpSpeed;
_wp setWaypointFormation _wpFormation;
_wp setWaypointCompletionRadius _wpCompletionRadius;

_wp