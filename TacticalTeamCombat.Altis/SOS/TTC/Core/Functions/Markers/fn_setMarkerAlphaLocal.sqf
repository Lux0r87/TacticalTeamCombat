/*
	Function to broadcast setMarkerAlphaLocal to everyone (called by bis_fnc_MP).

	Created by Lux0r
*/


private ["_mrk","_alpha"];

_mrk	= [_this, 0] call BIS_fnc_param;
_alpha	= [_this, 1] call BIS_fnc_param;

/*[
	["Function: %1", "TTC_CORE_fnc_setMarkerAlphaLocal"], ["_mrk = %1", _mrk], ["_alpha = %1", _alpha]
] call TTC_CORE_fnc_log;*/


_mrk setMarkerAlphaLocal _alpha;