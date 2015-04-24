/*
	Created by Lux0r
*/


private ["_sector","_sectorID","_name","_axisA","_axisB","_side","_dominance","_dir","_mrkShape","_mrkName","_mrkColor","_mrk"];

_sector		= [_this, 0] call BIS_fnc_param;
_sectorID	= [_this, 1] call BIS_fnc_param;
_name		= [_this, 2, _sector getVariable ["TTC_CTI_sector_name", ""], [""]] call BIS_fnc_param;
_axisA		= [_this, 3, _sector getVariable ["TTC_CTI_sector_axisA", 50], [0]] call BIS_fnc_param;
_axisB		= [_this, 4, _sector getVariable ["TTC_CTI_sector_axisB", 50], [0]] call BIS_fnc_param;
_side		= [_this, 5, _sector getVariable ["TTC_CTI_sector_side", sideUnknown], [sideUnknown]] call BIS_fnc_param;
_dominance	= [_this, 6, _sector getVariable ["TTC_CTI_sector_dominance", 100], [0]] call BIS_fnc_param;
_dir		= [_this, 7, getDir _sector, [0]] call BIS_fnc_param;
_mrkShape	= [_this, 8, "RECTANGLE", [""]] call BIS_fnc_param;	// "ICON", "RECTANGLE" or "ELLIPSE"

/*[_sector, "TTC_CTI_fnc_createSectorAreaMarker",
	[["_sectorID = %1", _sectorID], ["_name = %1", _name], ["_axisA = %1", _axisA], ["_axisB = %1", _axisB],
	["_side = %1", _side], ["_dominance = %1", _dominance], ["_dir = %1", _dir], ["_mrkShape = %1", _mrkShape]]
] call TTC_CTI_fnc_logSector;*/


_mrkName	= format ["mrk_SectorArea%1", _sectorID];
_mrkColor	= [_side, true] call BIS_fnc_sideColor;
_mrk		= [_mrkName, getPos _sector, _name, _mrkColor, _axisA, _axisB, _dir, _mrkShape, "Empty", 0, "SolidBorder"] call TTC_CORE_fnc_createMarker;
_sector setVariable ["TTC_CTI_sector_markerArea", _mrk];

_mrk