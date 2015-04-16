/*
	Created by Lux0r
*/


#include "dominanceVariables.hpp"

private ["_veh","_unit","_sector","_sectorSide","_marker","_respawnPos","_removed","_pos"];

_veh		= [_this, 0] call BIS_fnc_param;
_unit		= [_this, 1] call BIS_fnc_param;
_sector		= [_this, 2] call BIS_fnc_param;
_sectorSide	= [_this, 3, _sector getVariable ["TTC_CTI_sector_side", sideUnknown], [sideUnknown]] call BIS_fnc_param;
_marker		= [_this, 4, _sector getVariable ["TTC_CTI_sector_marker", ""], [""]] call BIS_fnc_param;
_respawnPos	= [_this, 5, _sector getVariable ["TTC_CTI_sector_respawnPos", [0,0]], [[]], [2, 3]] call BIS_fnc_param;

//[_sector, "TTC_CTI_fnc_mobileSectorIsMoving", [["_veh = %1", _veh], ["_unit = %1", _unit]]] call TTC_CTI_fnc_logSector;


_veh setVariable ["TTC_isMoving", true];

// Remove respawn position.
_removed	= _respawnPos call BIS_fnc_removeRespawnPosition;
_sector setVariable ["TTC_CTI_sector_respawnPos", []];

// TimeOut
while {TTC_CTI_mobileSector_timeOut > 0} do {
	TTC_CTI_mobileSector_timeOut = TTC_CTI_mobileSector_timeOut - 1;
	publicVariable "TTC_CTI_mobileSector_timeOut";

	// Update markers
	_pos = getPos _veh;
	_sector setVariable ["TTC_CTI_sector_position", _pos];;
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
_sector setVariable ["TTC_CTI_sector_respawnPos", _respawnPos];

_veh lock true;
_veh setVariable ["TTC_isMoving", false];