/*
	Created by Lux0r
*/


#include "dominanceVariables.inc"
#include "sectorVariables.inc"

private ["_sector","_canSee","_mrkArea","_mrk","_update_position","_update_teleportUI","_task","_side","_color","_brush","_text","_taskState","_taskDesc","_taskTitle"];

_sector				= [_this, 0] call BIS_fnc_param;
_canSee				= [_this, 1, false, [false]] call BIS_fnc_param;
_mrkArea			= [_this, 2, TTC_CTI_sectorVariable_markerArea(_sector), [""]] call BIS_fnc_param;
_mrk				= [_this, 3, TTC_CTI_sectorVariable_marker(_sector), [""]] call BIS_fnc_param;
_update_position	= [_this, 4, false, [false]] call BIS_fnc_param;		// Update the task position.
_update_teleportUI	= [_this, 5, false, [false]] call BIS_fnc_param;		// Refresh the teleport UI, if it's open.
_task				= [_this, 6, TTC_CTI_sectorVariable_task(_sector), [taskNull]] call BIS_fnc_param;

/*[_sector, "TTC_CTI_fnc_updateSectorLocal",
	[["_canSee = %1", _canSee], ["_mrkArea = %1", _mrkArea], ["_mrk = %1", _mrk], ["_update_teleportUI = %1", _update_teleportUI], ["_task = %1", _task]]
] call TTC_CTI_fnc_logSector;*/


// Update the sector list in the teleport UI.
if (_update_teleportUI && {!isNil "TTC_CTI_sectors"}) then {
	TTC_CTI_sectors spawn TTC_TP_UI_fnc_updateSectorList;
};

if (_canSee) then {
	_side	= _sector getVariable ["TTC_CTI_sector_side", sideUnknown];
	_color	= [_side, true] call BIS_fnc_sideColor;
	_brush	= "Solid";
	_text	= [_sector] call TTC_CTI_fnc_getSectorText;

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

	// Update the task position.
	if (_update_position) then {
		_task setSimpleTaskDestination (getPos _sector);
	};
} else {
	_color	= "ColorUNKNOWN";
	_brush	= "DiagGrid";
	_text	= _sector getVariable ["TTC_CTI_sector_name", ""];

	// Remove the task
	if (!isNull _task) then {
		player removeSimpleTask _task;
		_sector setVariable ["TTC_CTI_sector_task", taskNull];
	};
};

// Update the sector markers.
[_sector, TTC_CTI_dominanceMax, _mrkArea, _mrk, _color, _brush, (" " + _text)] call TTC_CTI_fnc_updateSectorMarkersLocal;