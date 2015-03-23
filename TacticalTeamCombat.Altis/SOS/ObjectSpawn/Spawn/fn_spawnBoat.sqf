/*
	Use this script to allow specific classes to spawn boats.

	Created by Lux0r
*/


_caller			= _this select 1;
_arguments		= _this select 3;
_vehicleType	= _arguments select 0;
_spawn			= _arguments select 1;
_whitelisted	= _arguments select 2;
_texture		= _arguments select 3;
_spawnDelay		= 60;


// Check if players class is allowed to spawn a boat. Everyone is allowed to spawn an assault boat.
if (((typeOf _caller) in OS_allowBoatSpawnWest) || (_vehicleType == "B_Boat_Transport_01_F")) then {
	if (OS_spawnDelay > 60) then {
		hintSilent format["Please try again in about %1 seconds.", OS_spawnDelay];
		playSound "warning1";
	} else {
		// Create the vehicle
		_spawnPos = getPos _spawn;
		_veh = _vehicleType createVehicle _spawnPos;
		_veh setDir (getDir _spawn);

		if (OS_disableThermal == 1) then {
			_veh disableTIEquipment true;
		};

		OS_spawnDelay = OS_spawnDelay + _spawnDelay;
		playSound "confirm1";
	};
} else {
	hintSilent "You can't spawn this boat, if you are not a leader!";
	playSound "warning1";
};