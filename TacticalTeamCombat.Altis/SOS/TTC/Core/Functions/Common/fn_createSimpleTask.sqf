/*
	Created by Lux0r
*/


private ["_unit","_taskName","_taskParent","_taskState","_taskPos","_taskDesc","_taskTitle","_taskWpDesc","_task"];

_unit		= [_this, 0] call BIS_fnc_param;
_taskName	= [_this, 1, "", [""]] call BIS_fnc_param;
_taskParent	= [_this, 2, taskNull, [taskNull]] call BIS_fnc_param;
_taskState	= [_this, 3, "Assigned", [""]] call BIS_fnc_param;
_taskPos	= [_this, 4, [0, 0], [[]], [2, 3]] call BIS_fnc_param;
_taskDesc	= [_this, 5, "", [""]] call BIS_fnc_param;
_taskTitle	= [_this, 6, "", [""]] call BIS_fnc_param;
_taskWpDesc	= [_this, 7, "", [""]] call BIS_fnc_param;

/*[
	["Function: %1", "TTC_CORE_createSimpleTask"], ["_unit = %1", _unit], ["_taskName = %1", _taskName], ["_taskParent = %1", _taskParent], ["_taskState = %1", _taskState],
	["_taskPos = %1", _taskPos], ["_taskDesc = %1", _taskDesc], ["_taskTitle = %1", _taskTitle], ["_taskWpDesc = %1", _taskWpDesc]
] call TTC_CORE_fnc_log;*/


_task = _unit createSimpleTask [_taskName, _taskParent];
_task setTaskState _taskState;
_task setSimpleTaskDestination _taskPos;
_task setSimpleTaskDescription  [_taskDesc, _taskTitle, _taskWpDesc];

_task