/*
	Created by Lux0r
*/

private ["_mrkName","_mrkPos","_mrkText","_mrkColor","_axisA","_axisB","_dir","_mrkShape","_mrkType","_mrkAlpha","_mrkBrush","_mrk"];

_mrkName	= [_this, 0] call BIS_fnc_param;
_mrkPos		= [_this, 1] call BIS_fnc_param;
_mrkText	= [_this, 2, "", [""]] call BIS_fnc_param;
_mrkColor	= [_this, 3, "ColorRed", [""]] call BIS_fnc_param;
_axisA		= [_this, 4, 20, [0]] call BIS_fnc_param;
_axisB		= [_this, 5, 20, [0]] call BIS_fnc_param;
_dir		= [_this, 6, 0, [0]] call BIS_fnc_param;
_mrkShape	= [_this, 7, "RECTANGLE", [""]] call BIS_fnc_param;	// "ICON", "RECTANGLE" or "ELLIPSE"
_mrkType	= [_this, 8, "Empty", [""]] call BIS_fnc_param;
_mrkAlpha	= [_this, 9, 1, [0.0]] call BIS_fnc_param;
_mrkBrush	= [_this, 10, "Solid", [""]] call BIS_fnc_param;

/*[
	["Function: %1", "TTC_CTI_createMarker:"], ["_mrkName = %1", _mrkName], ["_mrkPos = %1", _mrkPos], ["_mrkText = %1", _mrkText], ["_mrkColor = %1", _mrkColor],
	["_axisA = %1", _axisA], ["_axisB = %1", _axisB], ["_dir = %1", _dir], ["_mrkShape = %1", _mrkShape], ["_mrkType = %1", _mrkType],
	["_mrkAlpha = %1", _mrkAlpha], ["_mrkBrush = %1", _mrkBrush]
] call TTC_CORE_fnc_log;*/


_mrk = createMarker [_mrkName, _mrkPos];
_mrk setMarkerText _mrkText;
_mrk setMarkerColor _mrkColor;
_mrk setMarkerSize [_axisA, _axisB];
_mrk setMarkerDir _dir;
_mrk setMarkerShape _mrkShape;
_mrk setMarkerType _mrkType;
_mrk setMarkerAlpha _mrkAlpha;
_mrk setMarkerBrush _mrkBrush;

_mrk