/*
	Created by Lux0r
*/


if (isNil "TTC_saveTime") then {
	TTC_saveTime = ["TTC_CORE_saveTime", 300] call BIS_fnc_getParamValue;
};

// Server-side.
if (isServer) then {
	// Spawn a base for each side that is present in the current game.
	{
		[_x] spawn TTC_BASE_fnc_spawnBase;
	} forEach [west, east, resistance];

	[] spawn TTC_CORE_fnc_runTimer;

	[] spawn TTC_CTI_fnc_initCTI;
};

// Client-side.
if (hasInterface) then {

	[] spawn TTC_CORE_fnc_initPlayer;

	"TTC_saveTime" addPublicVariableEventHandler {
		_value = _this select 1;

		if (_value > 0) then {
			hintSilent format ["The mission starts in: %1s", _value];
		} else {
			hintSilent "Mission started!";
		};
	};
};