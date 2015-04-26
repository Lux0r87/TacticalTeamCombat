/*
	Created by Lux0r
*/


private ["_update_position","_update_isConnected","_update_canSee","_update_teleportUI","_target"];

_update_position	= [_this, 0, false, [false]] call BIS_fnc_param;		// Update the marker positions.
_update_isConnected	= [_this, 1, false, [false]] call BIS_fnc_param;		// Recalculate "isConnectedToBase".
_update_canSee		= [_this, 2, false, [false]] call BIS_fnc_param;		// Recalculate "canSee", otherwise use stored value.
_update_teleportUI	= [_this, 3, false, [false]] call BIS_fnc_param;		// Refresh the teleport UI, if it's open.
_target 			= [_this, 4, ObjNull, [ObjNull]] call BIS_fnc_param;

/*[
	["Function: %1", "TTC_CTI_fnc_updateSectors"],
	["_update_position = %1", _update_position], ["_update_isConnected = %1", _update_isConnected], ["_update_canSee = %1", _update_canSee],
	["_update_teleportUI = %1", _update_teleportUI], ["_target = %1", _target]
] call TTC_CORE_fnc_log;*/


// Safety measure: Wait until the initialization of the sectors is done.
waitUntil {TTC_CTI_initDone};

{
	// Update the sector.
	[_x, _update_position, _update_isConnected, _update_canSee, _update_teleportUI, _target] call TTC_CTI_fnc_updateSector;
} forEach TTC_CTI_sectors;