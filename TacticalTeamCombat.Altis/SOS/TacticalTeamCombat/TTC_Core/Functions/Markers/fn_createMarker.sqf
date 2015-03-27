/*
	Created by Lux0r
*/

private ["_mkrName","_mkrPos","_mkrText","_mkrColor","_axisA","_axisB","_dir","_mkrShape","_mkrType","_mkrAlpha","_mkrBrush","_mrk"];

_mkrName	= [_this, 0] call BIS_fnc_param;
_mkrPos		= [_this, 1] call BIS_fnc_param;
_mkrText	= [_this, 2, "", [""]] call BIS_fnc_param;
_mkrColor	= [_this, 3, "ColorRed", [""]] call BIS_fnc_param;
_axisA		= [_this, 4, 20, [0]] call BIS_fnc_param;
_axisB		= [_this, 5, 20, [0]] call BIS_fnc_param;
_dir		= [_this, 6, 0, [0]] call BIS_fnc_param;
_mkrShape	= [_this, 7, "RECTANGLE", [""]] call BIS_fnc_param;	// "ICON", "RECTANGLE" or "ELLIPSE"
_mkrType	= [_this, 8, "Empty", [""]] call BIS_fnc_param;
_mkrAlpha	= [_this, 9, 1, [0.0]] call BIS_fnc_param;
_mkrBrush	= [_this, 10, "Solid", [""]] call BIS_fnc_param;

/*diag_log format [
	"TTC_CORE - createMarker: _mkrName = %1, _mkrPos = %2, _mkrText = %3, _mkrColor = %4, _axisA = %5, _axisB = %6, _dir = %7, _mkrShape = %8, _mkrType = %9,
	_mkrAlpha = %10, _mkrBrush = %11", _mkrName, _mkrPos, _mkrText, _mkrColor, _axisA, _axisB, _dir, _mkrShape, _mkrType, _mkrAlpha, _mkrBrush
];*/


_mrk = createMarker [_mkrName, _mkrPos];
_mrk setMarkerText _mkrText;
_mrk setMarkerColor _mkrColor;
_mrk setMarkerSize [_axisA, _axisB];
_mrk setMarkerDir _dir;
_mrk setMarkerShape _mkrShape;
_mrk setMarkerType _mkrType;
_mrk setMarkerAlpha _mkrAlpha;
_mrk setMarkerBrush _mkrBrush;

_mrk