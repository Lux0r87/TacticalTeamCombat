/*
	Created by Lux0r
*/

// Don't add "_sector" to private variables. This function modifies the original variable.
private ["_axisA","_axisB","_dir","_mkrShape","_name","_pos","_side","_dominance","_mrkName","_mrkColor","_mrk"];

_sector		= [_this, 0] call BIS_fnc_param;
_axisA		= [_this, 1, 20, [0]] call BIS_fnc_param;
_axisB		= [_this, 2, 20, [0]] call BIS_fnc_param;
_dir		= [_this, 3, 0, [0]] call BIS_fnc_param;
_mkrShape	= [_this, 4, "RECTANGLE", [""]] call BIS_fnc_param;	// "ICON", "RECTANGLE" or "ELLIPSE"

_name		= _sector select 0;
_pos		= _sector select 1;
_side		= _sector select 6;
_dominance	= _sector select 7;

/*[
	["TTC_CTI: createSectorAreaMarker:"], ["_sector = %1", _sector], ["_axisA = %1", _axisA], ["_axisB = %1", _axisB], ["_dir = %1", _dir],
	["_mkrShape = %1", _mkrShape], ["_name = %1", _name], ["_pos = %1", _pos], ["_side = %1", _side], ["_dominance = %1", _dominance]
] call TTC_CORE_fnc_log;*/


TTC_CTI_sectorAreaNo = TTC_CTI_sectorAreaNo + 1;
_mrkName	= format ["mrk_SectorArea%1", TTC_CTI_sectorAreaNo];
_mrkColor	= [_side, true] call BIS_fnc_sideColor;
_mrk		= [_mrkName, _pos, _name, _mrkColor, _axisA, _axisB, _dir, _mkrShape] call TTC_CORE_fnc_createMarker;
_sector set [9, _mrk];

_mrk