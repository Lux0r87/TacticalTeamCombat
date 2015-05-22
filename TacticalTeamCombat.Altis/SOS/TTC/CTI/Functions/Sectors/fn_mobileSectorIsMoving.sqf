/*
	Created by Lux0r
*/


#include "sectorVariables.inc"

#define TTC_CTI_speedLimit 30

private ["_veh","_sector","_timeOut","_sectorSide","_message","_script","_marker","_respawnPos","_sectorName","_removed"];

_veh		= [_this, 0] call BIS_fnc_param;
_sector		= [_this, 1] call BIS_fnc_param;
_timeOut	= [_this, 2] call BIS_fnc_param;
_sectorSide	= [_this, 3, TTC_CTI_sectorVariable_side(_sector), [sideUnknown]] call BIS_fnc_param;
//_marker		= [_this, 4, TTC_CTI_sectorVariable_marker(_sector), [""]] call BIS_fnc_param;
//_respawnPos	= [_this, 5, _sector getVariable ["TTC_CTI_sector_respawnPos", [0,0]], [[]], [2, 3]] call BIS_fnc_param;

_sectorName	= TTC_CTI_sectorVariable_name(_sector);

//[_sector, "TTC_CTI_fnc_mobileSectorIsMoving", [["_veh = %1", _veh], ["_sectorSide = %1", _sectorSide], ["_sectorName = %1", _sectorName]]] call TTC_CTI_fnc_logSector;


_veh setVariable ["TTC_isMoving", true];

/* DEPRECATED: https://github.com/Lux0r87/TacticalTeamCombat/issues/87
// Remove respawn position.
_removed	= _respawnPos call BIS_fnc_removeRespawnPosition;
_sector setVariable ["TTC_CTI_sector_respawnPos", []];*/

// Show message for the team.
_message = parseText format ["<t align='center' size='1.5'>Mobile Sector</t><br/><br/>
Your team has %1 seconds to move '%2'. Try to find a strategic location for it.", _timeOut, _sectorName];

[_message, "TTC_CORE_fnc_hint", _sectorSide, false] call BIS_fnc_MP;

// Limit speed of the vehicle.
_script = [_veh, TTC_CTI_speedLimit] spawn TTC_CORE_fnc_speedLimit;

// TimeOut
while {_timeOut > 0} do {
	// Update the sector (trigger) position.
	_sector setPos (getPos _veh);

	// Update sector: marker position and teleport UI.
	[_sector, true, false, false, true] call TTC_CTI_fnc_updateSector;

	sleep 1;
	_timeOut = _timeOut - 1;
};

// Cancel the speed limit script.
terminate _script;

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
