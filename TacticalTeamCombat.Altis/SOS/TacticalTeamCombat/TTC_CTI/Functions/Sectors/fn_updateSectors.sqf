/*
	Created by Lux0r
*/

#include "dominanceVariables.hpp"

private ["_target","_recalculate"];

_recalculate	= [_this, 0, false, [false]] call BIS_fnc_param;
_target 		= [_this, 1, ObjNull, [ObjNull]] call BIS_fnc_param;

{
	// Update the sector markers.
	[_x, TTC_CTI_dominanceMax, _recalculate, _target] call TTC_CTI_fnc_updateSectorMarkers;
} forEach TTC_CTI_sectors;