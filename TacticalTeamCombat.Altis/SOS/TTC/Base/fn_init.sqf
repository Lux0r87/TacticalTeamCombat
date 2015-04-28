/*
	Created by Lux0r
*/


// Server-side:
if (isServer) then {
	// Spawn a base for each side that is present in the current game.
	{
		[_x] spawn TTC_BASE_fnc_spawnBase;
	} forEach [west, east, resistance];
};

// Client-side:
if (hasInterface) then {	
	// Firing in base protection.
	[] call TTC_BASE_fnc_noFireZone;
};
