/*
	Created by Lux0r
*/

// Don't add "_sector" to private variables. This function modifies the original variable.
private ["_axisA","_axisB","_name","_pos","_side","_dominance","_mrkName","_mrkText","_mrkColor","_mrk"];

_sector		= [_this, 0] call BIS_fnc_param;
_axisA		= [_this, 1, 0.8, [0]] call BIS_fnc_param;
_axisB		= [_this, 2, 0.8, [0]] call BIS_fnc_param;

_name		= _sector select 0;
_pos		= _sector select 1;
_side		= _sector select 6;
_dominance	= _sector select 7;


TTC_SC_sectorNo = TTC_SC_sectorNo + 1;
_mrkName	= format ["mrk_Sector%1", TTC_SC_sectorNo];
_mrkText	= format["%1 - (%2/100)", _name, _dominance];
_mrkColor	= [_side, true] call BIS_fnc_sideColor;
_mrk = [_mrkName, _pos, _mrkText, _mrkColor, _axisA, _axisB, 0, "ICON", "hd_dot"] call TTC_CORE_fnc_createMarker;
_sector set [10, _mrk];

// Lux0r: remove debug
diag_log format [
	"TTC_SC - createSectorMarker: _sector = %1, _axisA = %2, _axisB = %3, _name = %4, _pos = %5, _side = %6, _dominance = %7, _mrkName = %8, _mrkText = %9,
	_mrkColor = %10, _mrk = %11", _sector, _axisA, _axisB, _name, _pos, _side, _dominance, _mrkName, _mrkText, _mrkColor, _mrk
];

_mrk