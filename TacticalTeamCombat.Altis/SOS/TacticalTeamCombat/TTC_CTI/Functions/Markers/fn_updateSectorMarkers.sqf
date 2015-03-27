/*
	Created by Lux0r
*/

private ["_sector","_name","_side","_dominance","_mrkArea","_mrk","_color"];

_sector		= [_this, 0] call BIS_fnc_param;

_name		= _sector select 0;
_side		= _sector select 6;
_dominance	= _sector select 7;
_mrkArea	= _sector select 9;
_mrk		= _sector select 10;
_color		= [_side, true] call BIS_fnc_sideColor;


// Update area marker
if (_mrkArea != "") then {
	_mrkArea setMarkerColor _color;
} else {
	diag_log format ["TTC_CTI - updateSectorMarkers: ERROR = _mrkArea for '%1' is undefined!", _name];
};

// Update marker
if (_mrk != "") then {
	_mrk setMarkerColor _color;
	_mrkText = format["%1 - (%2/100)", _name, _dominance];
	_mrk setMarkerText _mrkText;
} else {
	diag_log format ["TTC_CTI - updateSectorMarkers: ERROR = _mrk for '%1' is undefined!", _name];
};