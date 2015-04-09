/*
	Created by Lux0r
*/


#include "sectorVariables.hpp"

// Don't add "_sector" to private variables. This function modifies the original variable.
private ["_sectorID","_vehType","_speedLimit","_pos","_dir","_side","_veh"];

_sector		= [_this, 0] call BIS_fnc_param;
_sectorID	= [_this, 1] call BIS_fnc_param;
_vehType	= [_this, 2, "O_Truck_03_device_F", [""]] call BIS_fnc_param;
_speedLimit	= [_this, 3, 30, [0]] call BIS_fnc_param;

_pos	= _sector select TTC_CTI_sector_position;
_dir	= _sector select TTC_CTI_sector_direction;
_side	= _sector select TTC_CTI_sector_side;

/*[
	["TTC_CTI: createMobileSector:"], ["_sector = %1", _sector], ["_sectorID = %1", _sectorID], ["_vehType = %1", _vehType], ["_speedLimit = %1", _speedLimit],
	["_pos = %1", _pos], ["_dir = %1", _dir], ["_side = %1", _side]
] call TTC_CORE_fnc_log;*/


// Create vehicle.
_veh = _vehType createVehicle _pos;
_veh setDir _dir;
_veh lock true;
_veh allowDamage false;
_veh setVariable ["TTC_sectorID", _sectorID];

// Limit speed of the vehicle.
[_veh, _speedLimit] spawn TTC_CORE_fnc_speedLimit;

// Add an event handler to the vehicle.
_veh addEventHandler ["GetIn", TTC_CTI_fnc_getInMobileSector];

// Save vehicle for the mobile sector.
_sector set [TTC_CTI_sector_vehicle, _veh];