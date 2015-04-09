/*
	Script changes time of day by using the defined values from the mission parameters.

	Created by Lux0r
*/


private ["_paramValue","_timeOfDay"];


// Run this script only on server-side.
if (isServer) then {
	_paramValue = ["TimeOfDay", -2] call BIS_fnc_getParamValue;

	_timeOfDay = switch (_paramValue) do {
		case -1: {	// Night [6pm-5am]
			(([6, 17] call BIS_fnc_randomInt) + 12) mod 24;
		};
		case -2: {	// Day [6am-5pm]
			[6, 17] call BIS_fnc_randomInt;
		};
		case -3: {	// Random [0am-11pm]
			[0, 23] call BIS_fnc_randomInt;
		};
		default {	// Use time of day chosen in the mission parameter.
			_paramValue;
		};
	};

	diag_log format["TIME: _paramValue = %1, _timeOfDay = %2", _paramValue, _timeOfDay];
	setDate [2025, 7, 6, _timeOfDay, 0];
};