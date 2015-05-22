/*
	Created by Lux0r
*/


#include "sectorVariables.inc"

private ["_veh","_sector","_sectorSide","_marker","_respawnPos","_removed"];

_veh		= [_this, 0] call BIS_fnc_param;
_sector		= [_this, 1] call BIS_fnc_param;
_sectorSide	= [_this, 2, TTC_CTI_sectorVariable_side(_sector), [sideUnknown]] call BIS_fnc_param;
_marker		= [_this, 3, TTC_CTI_sectorVariable_marker(_sector), [""]] call BIS_fnc_param;
//_respawnPos	= [_this, 4, _sector getVariable ["TTC_CTI_sector_respawnPos", [0,0]], [[]], [2, 3]] call BIS_fnc_param;

/*[_sector, "TTC_CTI_fnc_mobileSectorIsMoving",
	[["_veh = %1", _veh], ["_sectorSide = %1", _sectorSide], ["_marker = %1", _marker]]
] call TTC_CTI_fnc_logSector;*/


_veh setVariable ["TTC_isMoving", true];

/* DEPRECATED: https://github.com/Lux0r87/TacticalTeamCombat/issues/87
// Remove respawn position.
_removed	= _respawnPos call BIS_fnc_removeRespawnPosition;
_sector setVariable ["TTC_CTI_sector_respawnPos", []];*/

// TimeOut
while {TTC_CTI_mobileSector_timeOut > 0} do {
	TTC_CTI_mobileSector_timeOut = TTC_CTI_mobileSector_timeOut - 1;
	publicVariable "TTC_CTI_mobileSector_timeOut";

	// Update the sector (trigger) position.
	_sector setPos (getPos _veh);

	// Update sector: marker position and teleport UI.
	[_sector, true, false, false, true] call TTC_CTI_fnc_updateSector;

	sleep 1;
};

// Stop the vehicle.
_veh setVelocity [0, 0, 0];
sleep 0.1;

// Move all passengers out of the vehicle.
{
	if (alive _x) then {
		_x action ["engineOff", _veh];
		moveOut _x;
	}
} forEach units _veh;

/* DEPRECATED: https://github.com/Lux0r87/TacticalTeamCombat/issues/87
// Recreate respawn position.
_respawnPos = [_sectorSide, _marker] call BIS_fnc_addRespawnPosition;
_sector setVariable ["TTC_CTI_sector_respawnPos", _respawnPos];*/

[[_veh, true], "TTC_CORE_fnc_lock", _veh, false] call BIS_fnc_MP;
_veh setVariable ["TTC_isMoving", false];
