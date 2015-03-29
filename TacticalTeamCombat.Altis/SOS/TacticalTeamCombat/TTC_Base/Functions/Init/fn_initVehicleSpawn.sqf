/*
	Initialization script for vehicle spawn.
	Created by BauerMitFackel
*/


private ["_sign","_side"];

_sign = [_this, 0] call BIS_fnc_param;
_side = [_this, 1] call BIS_fnc_param;


// Client-side scripts:
[] call compile preprocessFileLineNumbers format["SOS\TacticalTeamCombat\TTC_Base\Configurations\vehicleSpawn%1.sqf", _side];

// Iterate over every vehicle in the TTC_Vehicles array and add the corresponding action to the sign
{
	_label			= _x select 0;
	_vehicleType	= _x select 1;
	_texture		= _x select 2;
	_null = _sign addAction [_label, OS_fnc_spawnVehicle, [_vehicleType, TTC_VehicleSpawnLocation, false, _texture], 7, false, true]; 
} forEach TTC_Vehicles;

_sign allowDamage false; 
_sign setObjectTexture [0, TTC_VehicleSignTexture];