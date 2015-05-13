/*
	Created by Lux0r
*/


#include "sectorVariables.inc"

#define TTC_CTI_patrol_5men ["_Soldier_SL_F","_Soldier_AR_F","_Soldier_LAT_F","_soldier_M_F","_medic_F"]
#define TTC_CTI_patrol_8men ["_Soldier_SL_F","_Soldier_AR_F","_Soldier_LAT_F","_soldier_M_F","_medic_F","_Soldier_AR_F","_Soldier_LAT_F","_soldier_M_F"]

private ["_sector","_side","_axisA","_axisB","_patrol","_patrolTypes","_grp","_find","_patrolType","_pos","_radius","_safePos","_unitTypes","_prefix","_unitType","_unit"];

_sector			= [_this, 0] call BIS_fnc_param;
_side			= [_this, 1, TTC_CTI_sectorVariable_side(_sector), [sideUnknown]] call BIS_fnc_param;
_axisA			= [_this, 2, TTC_CTI_sectorVariable_axisA(_sector), [0]] call BIS_fnc_param;
_axisB			= [_this, 3, TTC_CTI_sectorVariable_axisB(_sector), [0]] call BIS_fnc_param;
_patrol			= [_this, 4, TTC_CTI_sectorVariable_patrol(_sector), [grpNull]] call BIS_fnc_param;
_patrolTypes	= [_this, 5, TTC_CTI_sectorVariable_patrolTypes(_sector), [[]]] call BIS_fnc_param;

/*[_sector, "TTC_CTI_fnc_createSectorPatrol",
	[["_side = %1", _side], ["_axisA = %1", _axisA], ["_axisB = %1", _axisB], ["_patrol = %1", _patrol]
] call TTC_CTI_fnc_logSector;*/

_grp = grpNull;

// Delete old patrol
/*{
	if (alive _x) then {
		deleteVehicle _x;
	};
} forEach units _patrol;*/

if (count units _patrol <= 0) then {
	deleteGroup _patrol;
};

// Find the patrol type.
_find		= ([TTC_CTI_sides, _side] call BIS_fnc_arrayFindDeep);
_patrolType = if (typeName _find == "ARRAY") then {_patrolTypes select (_find select 0);} else {1};

if (_patrolType > 0) then {
	_pos		= getPos _sector;
	_radius		= _axisA min _axisB;
	_safePos	= [_pos, 0, _radius, 0, 0, 1000, 0] call BIS_fnc_findSafePos;

	// Get unit types, according to the patrol type.
	_unitTypes = switch (_patrolType) do {
		case 1: {
			TTC_CTI_patrol_5men;
		};
		case 2: {
			TTC_CTI_patrol_8men;
		};
		default {
			[];
		};
	};

	// Create new group and units.
	_grp = createGroup _side;

	{
		_prefix = [_side] call TTC_CORE_fnc_getPrefix;
		_unitType = _prefix + _x;
		_unit = _grp createUnit [_unitType, _safePos, [], 0, "NONE"];
		_unit addEventHandler ["killed", TTC_BTC_fnc_killed];
		_unit setVariable ["TTC_isLocked", true, true];
	} forEach _unitTypes;

	// Start patrolling.
	[_grp, _pos, _radius] call TTC_CORE_fnc_taskPatrol;
};

_sector setVariable ["TTC_CTI_sector_patrol", _grp];
_grp
