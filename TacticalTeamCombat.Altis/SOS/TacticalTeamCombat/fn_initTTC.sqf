/*
	Created by Lux0r
*/


if (isNil "TTC_safetyTime") then {
	TTC_safetyTime = ["TTC_CORE_safetyTime", 300] call BIS_fnc_getParamValue;
};

TTC_disableThermal = ["DisableThermal", 1] call BIS_fnc_getParamValue;

[] call TTC_BTC_fnc_initBTC;

[] spawn TTC_CTI_fnc_initCTI;

// Server-side:
if (isServer) then {
	// Spawn a base for each side that is present in the current game.
	{
		[_x] spawn TTC_BASE_fnc_spawnBase;
	} forEach [west, east, resistance];

	[] spawn TTC_CORE_fnc_runTimer;
};

// Client-side:
if (hasInterface) then {
	// Add the respawn inventory.
	[] spawn TTC_CORE_fnc_addRespawnInventory;

	// Handle the fatigue.
	[player] call TTC_CORE_fnc_handleFatigue;

	// Initialize nametags.
	[] call TTC_CORE_fnc_initNametags;

	// Show unit markers.
	[] spawn TTC_MAP_fnc_showMarkerForUnits;

	// Add eventHandler to detect team kills.
	player addEventHandler ["killed", TTC_BTC_fnc_killed];

	"TTC_safetyTime" addPublicVariableEventHandler {
		_value = _this select 1;

		if (_value > 0) then {
			hintSilent format ["The mission starts in: %1s", _value];
		} else {
			hintSilent "Mission started!";
		};
	};
};