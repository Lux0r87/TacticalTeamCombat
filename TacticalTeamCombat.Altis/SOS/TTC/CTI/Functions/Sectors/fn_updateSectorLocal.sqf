/*
	Created by Lux0r
*/


#include "dominanceVariables.hpp"
#include "sectorVariables.hpp"

private ["_sector","_canSee","_mrkArea","_mrk","_task","_taskState","_taskDesc","_taskTitle"];

_sector			= [_this, 0] call BIS_fnc_param;
_canSee			= [_this, 1, false, [false]] call BIS_fnc_param;
_mrkArea		= [_this, 2, TTC_CTI_sectorVariable_markerArea, [""]] call BIS_fnc_param;
_mrk			= [_this, 3, TTC_CTI_sectorVariable_marker, [""]] call BIS_fnc_param;
_task			= [_this, 4, TTC_CTI_sectorVariable_task, [taskNull]] call BIS_fnc_param;

/*[_sector, "TTC_CTI_fnc_updateSectorLocal",
	[["_canSee = %1", _canSee], ["_mrkArea = %1", _mrkArea], ["_mrk = %1", _mrk], ["_task = %1", _task]]
] call TTC_CTI_fnc_logSector;*/


if (_canSee) then {
	[_sector, TTC_CTI_dominanceMax, _mrkArea, _mrk] call TTC_CTI_fnc_updateSectorMarkersLocal;

	// Safety measure: Create a task, if none exists.
	if (isNull _task) then {
		_task = [player, _sector] call TTC_CTI_fnc_createSimpleTask;
		_sector setVariable ["TTC_CTI_sector_task", _task];
	};

	// Update the task.
	_taskState	= [player, _sector] call TTC_CTI_fnc_getTaskState;
	_task setTaskState _taskState;
	_taskDesc	= [player, _sector] call TTC_CTI_fnc_getTaskDescription;
	_taskTitle	= [_sector] call TTC_CTI_fnc_getSectorText;
	_task setSimpleTaskDescription [_taskDesc, _taskTitle, ""];
} else {
	// Hide the sector markers.
	_mrkArea setMarkerAlphaLocal 0;
	_mrk setMarkerAlphaLocal 0;

	// Remove the task
	if (!isNull _task) then {
		player removeSimpleTask _task;
		_sector setVariable ["TTC_CTI_sector_task", taskNull];
	};
};