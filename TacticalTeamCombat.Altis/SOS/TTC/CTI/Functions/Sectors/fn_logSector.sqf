/*
	Function to write all variables of the sector into the log file.

	Created by Lux0r
*/


#define UNDEFINED "UNDEFINED"

private [
	"_sector","_fncName","_messages","_name","_pos","_xrad","_yrad","_dir","_rectangle","_side","_dominance","_neighbours","_respawnPos","_respawnDir","_isMobile",
	"_visibility","_marker","_markerArea","_patrol","_vehicle"
];

_sector		= [_this, 0] call BIS_fnc_param;
_fncName	= [_this, 1, "", [""]] call BIS_fnc_param;
_messages	= [_this, 2, [], [[]]] call BIS_fnc_param;

_name		= _sector getVariable ["TTC_CTI_sector_name", UNDEFINED];
_pos		= _sector getVariable ["TTC_CTI_sector_position", UNDEFINED];
_xrad		= _sector getVariable ["TTC_CTI_sector_axisA", UNDEFINED];
_yrad		= _sector getVariable ["TTC_CTI_sector_axisB", UNDEFINED];
_dir		= _sector getVariable ["TTC_CTI_sector_direction", UNDEFINED];
_rectangle	= _sector getVariable ["TTC_CTI_sector_rectangle", UNDEFINED];
_side		= _sector getVariable ["TTC_CTI_sector_side", UNDEFINED];
_dominance	= _sector getVariable ["TTC_CTI_sector_dominance", UNDEFINED];
_neighbours	= _sector getVariable ["TTC_CTI_sector_neighbours", UNDEFINED];
_respawnPos	= _sector getVariable ["TTC_CTI_sector_respawnPos", UNDEFINED];
_respawnDir	= _sector getVariable ["TTC_CTI_sector_respawnDir", UNDEFINED];
_isMobile	= _sector getVariable ["TTC_CTI_sector_isMobile", UNDEFINED];
_visibility	= _sector getVariable ["TTC_CTI_sector_visibility", UNDEFINED];
_marker		= _sector getVariable ["TTC_CTI_sector_marker", UNDEFINED];
_markerArea	= _sector getVariable ["TTC_CTI_sector_markerArea", UNDEFINED];
_patrol		= _sector getVariable ["TTC_CTI_sector_patrol", UNDEFINED];
_vehicle	= _sector getVariable ["TTC_CTI_sector_vehicle", UNDEFINED];

_sectorMessage = [
	["---------- Sector ----------"], ["--> _name = %1", _name], ["--> _pos = %1", _pos], ["--> _xrad = %1", _xrad], ["--> _yrad = %1", _yrad], ["--> _dir = %1", _dir],
	["--> _rectangle = %1", _rectangle], ["--> _side = %1", _side], ["--> _dominance = %1", _dominance], ["--> _neighbours = %1", _neighbours],
	["--> _respawnPos = %1", _respawnPos], ["--> _respawnDir = %1", _respawnDir], ["--> _isMobile = %1", _isMobile], ["--> _visibility = %1", _visibility],
	["--> _marker = %1", _marker], ["--> _markerArea = %1", _markerArea], ["--> _patrol = %1", _patrol], ["--> _vehicle = %1", _vehicle], ["----------------------------"]
];

([["Function: %1", _fncName]] + _sectorMessage + _messages) call TTC_CORE_fnc_log;