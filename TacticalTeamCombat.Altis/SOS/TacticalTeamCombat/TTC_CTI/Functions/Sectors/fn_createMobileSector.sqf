/*
	Created by Lux0r
*/


private ["_sector","_pos","_dir","_side","_vehType","_speedLimit","_veh"];

_sector		= [_this, 0] call BIS_fnc_param;
_pos		= [_this, 2, _sector getVariable ["TTC_CTI_sector_position", [0,0]], [[]], [2, 3]] call BIS_fnc_param;
_dir		= [_this, 3, _sector getVariable ["TTC_CTI_sector_direction", 0], [0]] call BIS_fnc_param;
_side		= [_this, 4, _sector getVariable ["TTC_CTI_sector_side", sideUnknown], [sideUnknown]] call BIS_fnc_param;
_vehType	= [_this, 5, "O_Truck_03_device_F", [""]] call BIS_fnc_param;
_speedLimit	= [_this, 6, 30, [0]] call BIS_fnc_param;

/*[_sector, "TTC_CTI_fnc_createMobileSector",
	[["_pos = %1", _pos], ["_dir = %1", _dir], ["_side = %1", _side], ["_vehType = %1", _vehType], ["_speedLimit = %1", _speedLimit]]
] call TTC_CTI_fnc_logSector;*/


// Create vehicle.
_veh = _vehType createVehicle _pos;
_veh setDir _dir;
_veh lock true;
_veh allowDamage false;
_veh setVariable ["TTC_sector", _sector];

// Limit speed of the vehicle.
[_veh, _speedLimit] spawn TTC_CORE_fnc_speedLimit;

// Add an event handler to the vehicle.
_veh addEventHandler ["GetIn", TTC_CTI_fnc_getInMobileSector];

// Save vehicle for the mobile sector.
_sector setVariable ["TTC_CTI_sector_vehicle", _veh];