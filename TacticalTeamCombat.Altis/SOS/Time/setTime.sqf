/*
	Script changes time of day by using the defined values from the mission parameters.

	Created by Lux0r
*/


private ["_timeOfDay"];


// Run this script only on server-side.
if (isServer) then {
	// Initialize time of day (chosen in the mission parameters). Default: Day [6am-5pm]
	_timeOfDay = ["TimeOfDay", -2] call BIS_fnc_getParamValue;
	diag_log format["TIME: _timeOfDay = %1", _timeOfDay];

	if (_timeOfDay < 0) then {
		// Day [6am-5pm]
		_timeOfDay = [6, 17] call BIS_fnc_randomInt;

		// Night [6pm-5am]
		if (_timeOfDay == -1) then {
			_timeOfDay = (_timeOfDay + 12) mod 24;
		};
	};

	diag_log format["TIME: _timeOfDay = %1", _timeOfDay];
	setDate [2025, 7, 6, _timeOfDay, 0];
};