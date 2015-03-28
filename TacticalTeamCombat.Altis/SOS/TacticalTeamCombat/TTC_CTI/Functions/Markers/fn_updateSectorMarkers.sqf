/*
	Created by Lux0r
*/

private ["_sector","_dominanceMax","_name","_side","_dominance","_mrkArea","_mrk","_color"];

_sector			= [_this, 0] call BIS_fnc_param;
_dominanceMax	= [_this, 1, 100, [0]] call BIS_fnc_param;

_name		= _sector select 0;
_side		= _sector select 6;
_dominance	= _sector select 7;
_mrkArea	= _sector select 9;
_mrk		= _sector select 10;
_color		= [_side, true] call BIS_fnc_sideColor;

/*[
	["TTC_CTI: updateSectorMarkers:"], ["_sector = %1", _sector], ["_dominanceMax = %1", _dominanceMax], ["_name = %1", _name], ["_side = %1", _side],
	["_dominance = %1", _dominance], ["_mrkArea = %1", _mrkArea], ["_mrk = %1", _mrk], ["_color = %1", _color]
] call TTC_CORE_fnc_log;*/


_TTC_CTI_updateSectorClient = {
	private ["_sector","_mrk","_canSee","_alpha"];
	_sector = _this select 0;
	_mrk	= _this select 1;

	{
		_canSee = [_sector, _x] call TTC_CTI_fnc_canSee;
		_alpha	= if (_canSee) then {1;} else {0;};

		// Update the sector markers on the clients.
		[[_mrk, _alpha], "TTC_CORE_fnc_setMarkerAlphaLocal", _x, false] call BIS_fnc_MP;
	} forEach [west, east, resistance];
};

// Update area marker
if (_mrkArea != "") then {
	_mrkArea setMarkerColor _color;

	// Update the sector on the clients.
	[_sector, _mrkArea] call _TTC_CTI_updateSectorClient;
};

// Update marker
if (_mrk != "") then {
	_mrk setMarkerColor _color;
	_mrkText = format[" %1 - %2%3", _name, (_dominance/_dominanceMax)*100, "%"];
	_mrk setMarkerText _mrkText;

	// Update the sector on the clients.
	[_sector, _mrk] call _TTC_CTI_updateSectorClient;
};