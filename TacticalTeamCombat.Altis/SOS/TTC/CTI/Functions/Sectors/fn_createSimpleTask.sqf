/*
	Created by Lux0r
*/


#include "dominanceVariables.hpp"

#define TTC_CTI_isSectorDominanceMax (_dominance == TTC_CTI_dominanceMax)
#define TTC_CTI_unitControlsSector (side _unit == _side)
#define TTC_CTI_enemyControlsSector (side _unit != _side)
#define TTC_CTI_unitDominatesSector (TTC_CTI_unitControlsSector && TTC_CTI_isSectorDominanceMax)

private ["_unit","_sector","_taskParent","_sectorName","_side","_dominance","_pos","_taskState","_taskDesc","_task"];

_unit		= [_this, 0] call BIS_fnc_param;
_sector		= [_this, 1] call BIS_fnc_param;
_taskParent	= [_this, 2, taskNull, [taskNull]] call BIS_fnc_param;

_sectorName	= _sector getVariable ["TTC_CTI_sector_name", ""];
_side		= _sector getVariable "TTC_CTI_sector_side";
_dominance	= _sector getVariable ["TTC_CTI_sector_dominance", 0];
_pos		= getPos _sector;

/*[_sector, "TTC_CTI_fnc_createSimpleTask",
	[["_unit = %1", _unit], ["_taskParent = %1", _taskParent]]
] call TTC_CTI_fnc_logSector;*/


_taskName	= format["%1 - %2%3", _sectorName, (_dominance/TTC_CTI_dominanceMax)*100, "%"];

_taskState = if (TTC_CTI_unitDominatesSector) then {
	"Succeeded";
} else {
	"Assigned";
};

_taskDesc = switch (true) do {
	case (TTC_CTI_unitDominatesSector): {
		"Your team dominates this sector. Protect it against enemy attacks and ensure that the other team doesn't capture it.";
	};
	case (TTC_CTI_unitControlsSector): {
		"This is sector is not completely under your control. Maybe your team needs some help...";
	};
	case (TTC_CTI_enemyControlsSector): {
		"The enemy controls this sector. Your team's task is to attack it and bring it under your control!";
	};
	default {
		"";
	};
};

_task = [_unit, _taskName, _taskParent, _taskState, _pos, _taskDesc, _taskName] call TTC_CORE_fnc_createSimpleTask;

_task