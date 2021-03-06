/*
	Created by Lux0r
*/


// Get the mission parameters.
if (isNil "TTC_safetyTime") then {
	TTC_safetyTime = ["TTC_CORE_safetyTime", 300] call BIS_fnc_getParamValue;
};

TTC_disableThermal = ["DisableThermal", 1] call BIS_fnc_getParamValue;


// Initialize TTC Base module.
[] call TTC_BASE_fnc_init;

// Initialize TTC BTC (Bitcoin) module.
[] call TTC_BTC_fnc_init;

// Initialize TTC CTI (Capture the Island) module.
[] spawn TTC_CTI_fnc_init;

// Server-side:
if (isServer) then {
	[] spawn TTC_CORE_fnc_runTimer;

	[] spawn TTC_CORE_fnc_clearVehicleWrecks;
};


// Client-side:
if (hasInterface) then {
	// Show the welcome message.
	[] spawn TTC_CORE_fnc_showWelcomeMessage;

	// Array to store all vehicles/helicopters, which the player owns.
	TTC_CORE_vehicles = [];

	// Handle the fatigue.
	[player] call TTC_CORE_fnc_handleFatigue;

	// Initialize nametags.
	[] call TTC_CORE_fnc_initNametags;

	// Show unit markers.
	[] spawn TTC_MAP_fnc_showMarkerForUnits;
	
	// Initialize TTC Shop module.
	[] spawn TTC_SHOP_fnc_init;

	// Add eventHandler to detect team kills.
	player addEventHandler ["killed", TTC_BTC_fnc_killed];

	// Add eventHandler to protect the inventory.
	player addEventHandler ["InventoryOpened", TTC_CORE_fnc_inventoryOpened];

	// Add variableEventHandler to show the remaining safety time.
	"TTC_safetyTime" addPublicVariableEventHandler {
		[_this select 1] spawn TTC_CORE_fnc_showTimerDisplay;
	};
};
