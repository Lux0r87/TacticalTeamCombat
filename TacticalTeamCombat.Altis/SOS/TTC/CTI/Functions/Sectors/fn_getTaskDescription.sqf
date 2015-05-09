/*
	Created by Lux0r
*/


#include "sectorChecks.inc"
#include "taskDescriptions.inc"

private ["_unit","_sector","_taskDesc"];

_unit	= [_this, 0] call BIS_fnc_param;
_sector	= [_this, 1] call BIS_fnc_param;

/*[_sector, "TTC_CTI_fnc_getTaskDescription",
	[["_unit = %1", _unit]]
] call TTC_CTI_fnc_logSector;*/


_taskDesc = switch (true) do {
	case (TTC_CTI_unitDominatesSector(_sector, _unit)): {
		TTC_CTI_taskDescription_unitDominatesSector;
	};
	case (TTC_CTI_unitControlsSector(_sector, _unit)): {
		TTC_CTI_taskDescription_unitControlsSector;
	};
	case (TTC_CTI_enemyControlsSector(_sector, _unit)): {
		TTC_taskDescription_enemyControlsSector;
	};
	default {
		"";
	};
};

_taskDesc