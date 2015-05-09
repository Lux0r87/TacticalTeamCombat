/*
	Created by Lux0r
*/


#include "sectorChecks.inc"

private ["_unit","_sector","_taskState"];

_unit	= [_this, 0] call BIS_fnc_param;
_sector	= [_this, 1] call BIS_fnc_param;

/*[_sector, "TTC_CTI_fnc_getTaskState",
	[["_unit = %1", _unit]]
] call TTC_CTI_fnc_logSector;*/


_taskState = if (TTC_CTI_unitDominatesSector(_sector, _unit)) then {
	"Succeeded";
} else {
	"Created";
};

_taskState