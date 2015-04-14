/*
	Created by Lux0r
*/


#include "markerVariables.hpp"

private ["_sector","_name","_pos","_side","_dominance","_respawnDir","_dominanceMax","_mrkName","_mrkText","_mrkColor","_mrk"];

_sector			= [_this, 0] call BIS_fnc_param;
_name			= [_this, 1, _sector getVariable ["TTC_CTI_sector_name", ""], [""]] call BIS_fnc_param;
_pos			= [_this, 2, _sector getVariable ["TTC_CTI_sector_position", [0,0]], [[]], [2, 3]] call BIS_fnc_param;
_side			= [_this, 5, _sector getVariable ["TTC_CTI_sector_side", sideUnknown], [sideUnknown]] call BIS_fnc_param;
_dominance		= [_this, 6, _sector getVariable ["TTC_CTI_sector_dominance", 100], [0]] call BIS_fnc_param;
_respawnDir		= [_this, 7, _sector getVariable ["TTC_CTI_sector_respawnDir", 0], [0]] call BIS_fnc_param;
_dominanceMax	= [_this, 8, 100, [0]] call BIS_fnc_param;

/*[
	["TTC_CTI: createSectorMarker:"], ["_sector = %1", _sector], ["_name = %1", _name], ["_pos = %1", _pos], ["_side = %1", _side],
	["_dominance = %1", _dominance], ["_respawnDir = %1", _respawnDir], ["_dominanceMax = %1", _dominanceMax]
] call TTC_CORE_fnc_log;*/


TTC_CTI_sectorNo = TTC_CTI_sectorNo + 1;
_mrkName	= format ["mrk_Sector%1", TTC_CTI_sectorNo];
_mrkText	= format["%1 - %2%3", _name, (_dominance/_dominanceMax)*100, "%"];
_mrkColor	= [_side, true] call BIS_fnc_sideColor;
_mrk		= [_mrkName, _pos, _mrkText, _mrkColor, 0.8, 0.8, _respawnDir, "ICON", "selector_selectedMission", TTC_CTI_sectorMarkerAlpha] call TTC_CORE_fnc_createMarker;
_sector setVariable ["TTC_CTI_sector_marker", _mrk];

_mrk