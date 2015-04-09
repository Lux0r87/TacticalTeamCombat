/*
	Created by Lux0r
*/


#include "dominanceVariables.hpp"
#include "sectorVariables.hpp"

private ["_veh","_unit","_sector","_sectorSide","_marker","_respawnPos","_removed","_pos"];

_veh	= [_this, 0] call BIS_fnc_param;
_unit	= [_this, 1] call BIS_fnc_param;
_sector	= [_this, 2] call BIS_fnc_param;

_sectorSide	= _sector select TTC_CTI_sector_side;
_marker		= _sector select TTC_CTI_sector_marker;
_respawnPos	= _sector select TTC_CTI_sector_respawnPos;

/*[
	["TTC_CTI: mobileSectorIsMoving:"], ["_veh = %1", _veh], ["_unit = %1", _unit], ["_sector = %1", _sector], ["_sectorSide = %1", _sectorSide],
	["_marker = %1", _marker], ["_respawnPos = %1", _respawnPos]
] call TTC_CORE_fnc_log;*/


_veh setVariable ["TTC_isMoving", true];

// Remove respawn position.
_removed	= _respawnPos call BIS_fnc_removeRespawnPosition;
_sector set [TTC_CTI_sector_respawnPos, []];

// TimeOut
while {TTC_CTI_mobileSector_timeOut > 0} do {
	TTC_CTI_mobileSector_timeOut = TTC_CTI_mobileSector_timeOut - 1;
	publicVariable "TTC_CTI_mobileSector_timeOut";

	// Update markers
	_pos = getPos _veh;
	_sector set [TTC_CTI_sector_position, _pos];
	[_sector, TTC_CTI_dominanceMax] call TTC_CTI_fnc_updateSectorMarkers;

	sleep 1;
};

// Move all passengers out of the vehicle.
{
	if (alive _x) then {
		_unit action ["engineOff", _veh];
		moveOut _unit;
	}
} forEach units _veh;

// Recreate respawn position.
_respawnPos = [_sectorSide, _marker] call BIS_fnc_addRespawnPosition;
_sector set [TTC_CTI_sector_respawnPos, _respawnPos];

_veh lock true;
_veh setVariable ["TTC_isMoving", false];