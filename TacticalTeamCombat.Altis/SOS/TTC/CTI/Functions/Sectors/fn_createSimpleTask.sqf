/*
	Created by Lux0r
*/


#include "sectorChecks.inc"

private ["_unit","_sector","_taskParent","_pos","_taskState","_taskName","_taskDesc","_task"];

_unit		= [_this, 0] call BIS_fnc_param;
_sector		= [_this, 1] call BIS_fnc_param;
_taskParent	= [_this, 2, taskNull, [taskNull]] call BIS_fnc_param;

_pos		= getPos _sector;

/*[_sector, "TTC_CTI_fnc_createSimpleTask",
	[["_unit = %1", _unit], ["_taskParent = %1", _taskParent]]
] call TTC_CTI_fnc_logSector;*/


_taskState	= [_unit, _sector] call TTC_CTI_fnc_getTaskState;
_taskName	= [_sector] call TTC_CTI_fnc_getSectorText;
_taskDesc	= [_unit, _sector] call TTC_CTI_fnc_getTaskDescription;
_task		= [_unit, _taskName, _taskParent, _taskState, _pos, _taskDesc, _taskName] call TTC_CORE_fnc_createSimpleTask;

_task