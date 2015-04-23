/*
	Created by Lux0r
*/


#include "sectorVariables.hpp"

private ["_sector","_axisA","_axisB","_side","_patrol","_unitTypes","_radius","_pos","_safePos","_grp","_prefix","_unitType","_unit"];

_sector		= [_this, 0] call BIS_fnc_param;
_axisA		= [_this, 1, TTC_CTI_sectorVariable_axisA, [0]] call BIS_fnc_param;
_axisB		= [_this, 2, TTC_CTI_sectorVariable_axisB, [0]] call BIS_fnc_param;
_side		= [_this, 3, TTC_CTI_sectorVariable_side, [sideUnknown]] call BIS_fnc_param;
_patrol		= [_this, 4, TTC_CTI_sectorVariable_patrol, [grpNull]] call BIS_fnc_param;
_unitTypes	= [_this, 5, ["_Soldier_SL_F","_Soldier_AR_F","_Soldier_LAT_F","_soldier_M_F","_medic_F"], [[]]] call BIS_fnc_param;

_pos		= getPos _sector;
_radius		= _axisA min _axisB;
_safePos	= [_pos, 0, _radius, 0, 0, 1000, 0] call BIS_fnc_findSafePos;

/*[_sector, "TTC_CTI_fnc_createSectorPatrol",
	[["_pos = %1", _pos], ["_axisA = %1", _axisA], ["_axisB = %1", _axisB], ["_side = %1", _side], ["_patrol = %1", _patrol],
	["_unitTypes = %1", _unitTypes], ["_radius = %1", _radius], ["_safePos = %1", _safePos]]
] call TTC_CTI_fnc_logSector;*/


// Delete old patrol
/*{
	if (alive _x) then {
		deleteVehicle _x;
	};
} forEach units _patrol;*/

if (count units _patrol <= 0) then {
	deleteGroup _patrol;
};

// Create new group and units.
_grp = createGroup _side;
_sector setVariable ["TTC_CTI_sector_patrol", _grp];

{
	_prefix = [_side] call TTC_CORE_fnc_getPrefix;
	_unitType = _prefix + _x;
	_unit = _grp createUnit [_unitType, _safePos, [], 0, "NONE"];
	_unit addEventHandler ["killed", TTC_BTC_fnc_killed];
	_unit setVariable ["TTC_isLocked", true, true];
} forEach _unitTypes;

// Start patrolling.
[_grp, _pos, _radius] call TTC_CORE_fnc_taskPatrol;

_grp