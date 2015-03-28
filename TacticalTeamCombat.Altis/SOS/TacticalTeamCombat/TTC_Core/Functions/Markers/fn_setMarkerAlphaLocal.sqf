/*
	Function to broadcast setMarkerAlphaLocal to everyone (called by bis_fnc_MP).

	Created by Lux0r
*/


private ["_mkr","_alpha"];

_mkr	= [_this, 0] call BIS_fnc_param;
_alpha	= [_this, 1] call BIS_fnc_param;

//diag_log format["TTC_CORE: setMarkerAlphaLocal: _mkr = %1, _alpha = %2", _mkr, _alpha];
_mkr setMarkerAlphaLocal _alpha;