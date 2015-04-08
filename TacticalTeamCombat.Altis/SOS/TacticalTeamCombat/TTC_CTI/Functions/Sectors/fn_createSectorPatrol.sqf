/*
	Created by Lux0r
*/


#include "sectorVariables.hpp"

private ["_sector","_unitTypes","_pos","_axisA","_axisB","_side","_patrol","_radius","_safePos","_grp","_prefix","_unitType","_unit"];

_sector		= [_this, 0] call BIS_fnc_param;
_unitTypes	= [_this, 1, ["_Soldier_SL_F","_Soldier_AR_F","_Soldier_LAT_F","_soldier_M_F","_medic_F"], [[]]] call BIS_fnc_param;

_pos		= _sector select TTC_CTI_sector_position;
_axisA		= _sector select TTC_CTI_sector_axisA;
_axisB		= _sector select TTC_CTI_sector_axisB;
_side		= _sector select TTC_CTI_sector_side;
_patrol		= _sector select TTC_CTI_sector_patrol;

_radius		= _axisA min _axisB;
_safePos	= [_pos, 0, _radius, 0, 0, 1000, 0] call BIS_fnc_findSafePos;

/*[
	["TTC_CTI: createSectorPatrol:"], ["_sector = %1", _sector], ["_unitTypes = %1", _unitTypes], ["_pos = %1", _pos], ["_axisA = %1", _axisA], ["_axisB = %1", _axisB],
	["_side = %1", _side], ["_patrol = %1", _patrol], ["_radius = %1", _radius], ["_safePos = %1", _safePos]
] call TTC_CORE_fnc_log;*/


// Delete old patrol
{
	if (alive _x) then {
		deleteVehicle _x;
	};
} forEach units _patrol;

if (count units _patrol <= 0) then {
	deleteGroup _patrol;
};

// Create new group and units.
_grp = createGroup _side;
_sector set [TTC_CTI_sector_patrol, _grp];

{
	_prefix = [_side] call TTC_CORE_fnc_getPrefix;
	_unitType = _prefix + _x;
	_unit = _grp createUnit [_unitType, _safePos, [], 0, "NONE"];
} forEach _unitTypes;

// Start patrolling.
[_grp, _pos, _radius] call TTC_CORE_fnc_taskPatrol;

_grp