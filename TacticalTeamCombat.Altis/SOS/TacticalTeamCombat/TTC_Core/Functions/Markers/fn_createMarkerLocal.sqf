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

/*[
	["TTC_CTI: createMarkerLocal:"], ["_mkrName = %1", _mkrName], ["_mkrPos = %1", _mkrPos], ["_mkrText = %1", _mkrText], ["_mkrColor = %1", _mkrColor],
	["_axisA = %1", _axisA], ["_axisB = %1", _axisB], ["_dir = %1", _dir], ["_mkrShape = %1", _mkrShape], ["_mkrType = %1", _mkrType],
	["_mkrAlpha = %1", _mkrAlpha], ["_mkrBrush = %1", _mkrBrush]
] call TTC_CORE_fnc_log;*/


_mrk = createMarkerLocal [_mkrName, _mkrPos];
_mrk setMarkerTextLocal _mkrText;
_mrk setMarkerColorLocal _mkrColor;
_mrk setMarkerSizeLocal [_axisA, _axisB];
_mrk setMarkerDirLocal _dir;
_mrk setMarkerShapeLocal _mkrShape;
_mrk setMarkerTypeLocal _mkrType;
_mrk setMarkerAlphaLocal _mkrAlpha;
_mrk setMarkerBrushLocal _mkrBrush;

_mrk