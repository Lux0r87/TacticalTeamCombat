/*
	Created by Lux0r
*/

#include "dominanceVariables.hpp"

private ["_target","_recalculate"];

_recalculate	= [_this, 0, false, [false]] call BIS_fnc_param;
_target 		= [_this, 1, ObjNull, [ObjNull]] call BIS_fnc_param;

[
	["Function: %1", "TTC_CTI_fnc_updateSectors"], ["_recalculate = %1", _recalculate], ["_target = %1", _target]
] call TTC_CORE_fnc_log;


// Safety measure: Wait until the initialization of the sectors is done.
waitUntil {TTC_CTI_initDone};

{
	// Update the sector markers.
	[_x, TTC_CTI_dominanceMax, _recalculate, _target] call TTC_CTI_fnc_updateSectorMarkers;
} forEach TTC_CTI_sectors;