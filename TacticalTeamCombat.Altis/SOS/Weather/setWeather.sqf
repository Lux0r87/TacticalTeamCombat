/*
	Script changes overcast, fog and rain by using the defined values from the mission parameters.

	Created by Lux0r
*/

#define OVERCAST_MIN 0
#define OVERCAST_MAX 70
#define FOG_MIN 0
#define FOG_MAX 20
#define FOG_DEFAULT 0
#define FOG_CHANCE 50
#define RAIN_MIN 0
#define RAIN_MAX 50
#define RAIN_DEFAULT 0
#define RAIN_CHANCE 35

private ["_overcast","_fog","_rain"];


_WEATHER_fnc_getParamValue = {
	private ["_class","_min","_max","_chance","_default","_param"];

	_class		= [_this, 0] call BIS_fnc_param;			// String:	Class name of the mission parameter.
	_min		= [_this, 1, 0, [0]] call BIS_fnc_param;	// Integer:	Minimum value for randomization. Only if 'random' is selected!
	_max		= [_this, 2, 100, [0]] call BIS_fnc_param;	// Integer:	Maximum value for randomization. Only if 'random' is selected!
	_chance		= [_this, 3, 0, [0]] call BIS_fnc_param;	// Integer:	Chance to select the default value. Only if 'random' is selected!
	_default	= [_this, 4, 0, [0]] call BIS_fnc_param;	// Integer:	Default value for the parameter. Only if 'random' is selected!
	_param		= [_class, -1] call BIS_fnc_getParamValue;

	if (_param == -1) then {
		if (floor(random 100) < _chance) then {
			_param = _default;
		} else {
			_param = [_min, _max] call BIS_fnc_randomInt;
		};
	};

	_param
};

// Run this script only on server-side.
if (isServer) then {
	_overcast	= ["Weather_Overcast", OVERCAST_MIN, OVERCAST_MAX] call _WEATHER_fnc_getParamValue;
	_fog		= ["Weather_Fog", FOG_MIN, FOG_MAX, FOG_CHANCE, FOG_DEFAULT] call _WEATHER_fnc_getParamValue;
	_rain		= ["Weather_Rain", RAIN_MIN, RAIN_MAX, RAIN_CHANCE, RAIN_DEFAULT] call _WEATHER_fnc_getParamValue;
	diag_log format["WEATER: _overcast = %1, _fog = %2, _rain = %3", _overcast, _fog, _rain];

	0 setOvercast (_overcast / 100);
	0 setFog (_fog / 100);
	0 setRain (_rain / 100);
	forceWeatherChange;
};