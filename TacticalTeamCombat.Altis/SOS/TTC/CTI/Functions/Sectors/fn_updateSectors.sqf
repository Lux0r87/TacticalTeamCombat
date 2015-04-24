/*
	Created by Lux0r
*/


private ["_update_position","_update_isConnected","_update_canSee","_target"];

_update_position	= [_this, 0, false, [false]] call BIS_fnc_param;		// Reset the position of the sector.
_update_isConnected	= [_this, 1, false, [false]] call BIS_fnc_param;		// Recalculate "isConnectedToBase".
_update_canSee		= [_this, 2, false, [false]] call BIS_fnc_param;		// Recalculate "canSee", otherwise use stored value.
_target 			= [_this, 3, ObjNull, [ObjNull]] call BIS_fnc_param;

/*[
	["Function: %1", "TTC_CTI_fnc_updateSectors"],
	["_update_position = %1", _update_position], ["_update_isConnected = %1", _update_isConnected], ["_update_canSee = %1", _update_canSee], ["_target = %1", _target]
] call TTC_CORE_fnc_log;*/


// Safety measure: Wait until the initialization of the sectors is done.
waitUntil {TTC_CTI_initDone};

{
	// Update the sector.
	[_x, _update_position, _update_isConnected, _update_canSee, _target] call TTC_CTI_fnc_updateSector;
} forEach TTC_CTI_sectors;