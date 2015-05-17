/*
	Created by Lux0r
*/


// Server-side:
if (isServer) then {
	private ["_location"];

	// Compile configuration file
	_location = [] call TTC_CORE_fnc_getLocation;
	[] call compile preprocessFileLineNumbers format["SOS\TTC\Base\Locations\%1.sqf", _location];

	// Spawn a base for each side that is present in the current game.
	{
		// Broadcast the vehicle/helicopter spawn position and direction to all players (including JIP).
		publicVariable format["TTC_BASE_%1_VehSpawnPos", _x];
		publicVariable format["TTC_BASE_%1_VehSpawnDir", _x];
		publicVariable format["TTC_BASE_%1_HeliSpawnPos", _x];
		publicVariable format["TTC_BASE_%1_HeliSpawnDir", _x];

		[_x] spawn TTC_BASE_fnc_spawnBase;
	} forEach [west, east, resistance];

	// Broadcast the safety distance to all players (including JIP).
	publicVariable "TTC_BASE_safetyDistance";
};

// Client-side:
if (hasInterface) then {	
	// Firing in base protection.
	[] call TTC_BASE_fnc_noFireZone;
};
