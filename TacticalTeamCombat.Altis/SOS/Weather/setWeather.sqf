/*
	Script changes overcast, fog and rain by using the defined values from the mission parameters.

	Created by Lux0r
*/

#define OVERCAST_MIN 0
#define OVERCAST_MAX 70
#define FOG_MIN 0
#define FOG_MAX 30
#define RAIN_MIN 0
#define RAIN_MAX 50

private ["_overcast","_fog","_rain"];


_WEATHER_fnc_getParamValue = {
	private ["_class","_min","_max","_param"];

	_class	= _this select 0;
	_min	= _this select 1;
	_max	= _this select 2;
	_param	= [_class, -1] call BIS_fnc_getParamValue;

	if (_param == -1) then {
		_param = [_min, _max] call BIS_fnc_randomInt;
	};

	_param;
};

// Run this script only on server-side.
if (isServer) then {
	_overcast	= ["Weather_Overcast", OVERCAST_MIN, OVERCAST_MAX] call _WEATHER_fnc_getParamValue;
	_fog		= ["Weather_Fog", FOG_MIN, FOG_MAX] call _WEATHER_fnc_getParamValue;
	_rain		= ["Weather_Rain", RAIN_MIN, RAIN_MAX] call _WEATHER_fnc_getParamValue;
	//diag_log format["WEATER: _overcast = %1, _fog = %2, _rain = %3", _overcast, _fog, _rain];

	0 setOvercast (_overcast / 100);
	0 setFog (_fog / 100);
	0 setRain (_rain / 100);
	forceWeatherChange;
};