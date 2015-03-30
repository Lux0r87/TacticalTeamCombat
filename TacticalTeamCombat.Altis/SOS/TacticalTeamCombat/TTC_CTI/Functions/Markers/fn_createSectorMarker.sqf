/*
	Created by Lux0r
*/

// Don't add "_sector" to private variables. This function modifies the original variable.
private ["_dominanceMax","_axisA","_axisB","_name","_pos","_side","_dominance","_direction","_mrkName","_mrkText","_mrkColor","_mrk"];

_sector			= [_this, 0] call BIS_fnc_param;
_dominanceMax	= [_this, 1, 100, [0]] call BIS_fnc_param;
_axisA			= [_this, 2, 0.8, [0]] call BIS_fnc_param;
_axisB			= [_this, 3, 0.8, [0]] call BIS_fnc_param;

_name		= _sector select 0;
_pos		= _sector select 1;
_side		= _sector select 6;
_dominance	= _sector select 7;
_direction	= _sector select 13;

/*[
	["TTC_CTI: createSectorMarker:"], ["_sector = %1", _sector], ["_axisA = %1", _axisA], ["_axisB = %1", _axisB], ["_dominanceMax = %1", _dominanceMax],
	["_name = %1", _name], ["_pos = %1", _pos], ["_side = %1", _side], ["_dominance = %1", _dominance]
] call TTC_CORE_fnc_log;*/


TTC_CTI_sectorNo = TTC_CTI_sectorNo + 1;
_mrkName	= format ["mrk_Sector%1", TTC_CTI_sectorNo];
_mrkText	= format["%1 - %2%3", _name, (_dominance/_dominanceMax)*100, "%"];
_mrkColor	= [_side, true] call BIS_fnc_sideColor;
_mrk		= [_mrkName, _pos, _mrkText, _mrkColor, _axisA, _axisB, _direction, "ICON", "selector_selectedMission"] call TTC_CORE_fnc_createMarker;
_sector set [10, _mrk];

_mrk