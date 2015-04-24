/*
	Created by Lux0r
*/


private ["_sector","_sectorID","_name","_side","_dominance","_respawnDir","_dominanceMax","_mrkName","_mrkText","_mrkColor","_mrk"];

_sector			= [_this, 0] call BIS_fnc_param;
_sectorID		= [_this, 1] call BIS_fnc_param;
_name			= [_this, 2, _sector getVariable ["TTC_CTI_sector_name", ""], [""]] call BIS_fnc_param;
_side			= [_this, 3, _sector getVariable ["TTC_CTI_sector_side", sideUnknown], [sideUnknown]] call BIS_fnc_param;
_dominance		= [_this, 4, _sector getVariable ["TTC_CTI_sector_dominance", 100], [0]] call BIS_fnc_param;
_respawnDir		= [_this, 5, _sector getVariable ["TTC_CTI_sector_respawnDir", 0], [0]] call BIS_fnc_param;
_dominanceMax	= [_this, 6, 100, [0]] call BIS_fnc_param;

/*[_sector, "TTC_CTI_fnc_createSectorMarker",
	[["_sectorID = %1", _sectorID], ["_name = %1", _name], ["_side = %1", _side], ["_dominance = %1", _dominance],
	["_respawnDir = %1", _respawnDir], ["_dominanceMax = %1", _dominanceMax]]
] call TTC_CTI_fnc_logSector;*/


_mrkName	= format ["mrk_Sector%1", _sectorID];
_mrkText	= [_sector, _name, _dominance] call TTC_CTI_fnc_getSectorText;
_mrkColor	= [_side, true] call BIS_fnc_sideColor;
_mrk		= [_mrkName, getPos _sector, _mrkText, _mrkColor, 0.8, 0.8, _respawnDir, "ICON", "selector_selectedMission", 0] call TTC_CORE_fnc_createMarker;
_sector setVariable ["TTC_CTI_sector_marker", _mrk];

_mrk