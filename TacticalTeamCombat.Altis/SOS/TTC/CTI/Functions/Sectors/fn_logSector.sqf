/*
	Function to write all variables of the sector into the log file.

	Created by Lux0r
*/


#define UNDEFINED "UNDEFINED"

private [
	"_sector","_fncName","_messages","_name","_pos","_dir","_xrad","_yrad","_rectangle","_marker","_markerArea","_side","_dominance",
	"_respawnPos","_respawnDir","_type","_objectDir","_flag","_patrol","_vehicle","_neighbours","_isConnected","_visibility","_task"
];

_sector		= [_this, 0] call BIS_fnc_param;
_fncName	= [_this, 1, "", [""]] call BIS_fnc_param;
_messages	= [_this, 2, [], [[]]] call BIS_fnc_param;

_name			= _sector getVariable ["TTC_CTI_sector_name", UNDEFINED];
_pos			= getPos _sector;
_dir			= getDir _sector;
_xrad			= _sector getVariable ["TTC_CTI_sector_axisA", UNDEFINED];
_yrad			= _sector getVariable ["TTC_CTI_sector_axisB", UNDEFINED];
_rectangle		= _sector getVariable ["TTC_CTI_sector_rectangle", UNDEFINED];
_marker			= _sector getVariable ["TTC_CTI_sector_marker", UNDEFINED];
_markerArea		= _sector getVariable ["TTC_CTI_sector_markerArea", UNDEFINED];
_side			= _sector getVariable ["TTC_CTI_sector_side", UNDEFINED];
_dominance		= _sector getVariable ["TTC_CTI_sector_dominance", UNDEFINED];
_respawnPos		= _sector getVariable ["TTC_CTI_sector_respawnPos", UNDEFINED];
_respawnDir		= _sector getVariable ["TTC_CTI_sector_respawnDir", UNDEFINED];
_type			= _sector getVariable ["TTC_CTI_sector_type", UNDEFINED];
_objectDir		= _sector getVariable ["TTC_CTI_sector_objectDir", UNDEFINED];
_flag			= _sector getVariable ["TTC_CTI_sector_flag", UNDEFINED];
_patrol			= _sector getVariable ["TTC_CTI_sector_patrol", UNDEFINED];
_vehicle		= _sector getVariable ["TTC_CTI_sector_vehicle", UNDEFINED];
_neighbours		= _sector getVariable ["TTC_CTI_sector_neighbours", UNDEFINED];
_isConnected	= _sector getVariable ["TTC_CTI_sector_isConnectedToBase", UNDEFINED];
_visibility		= _sector getVariable ["TTC_CTI_sector_visibility", UNDEFINED];
_task			= _sector getVariable ["TTC_CTI_sector_task", UNDEFINED];

_sectorMessage	= [
	["---------- Sector ----------"], ["--> _name = %1", _name], ["--> _pos = %1", _pos], ["--> _dir = %1", _dir], ["--> _xrad = %1", _xrad],
	["--> _yrad = %1", _yrad], ["--> _rectangle = %1", _rectangle], ["--> _marker = %1", _marker], ["--> _markerArea = %1", _markerArea],
	["--> _side = %1", _side], ["--> _dominance = %1", _dominance],	["--> _respawnPos = %1", _respawnPos], ["--> _respawnDir = %1", _respawnDir],
	["--> _type = %1", _type], ["--> _objectDir = %1", _objectDir], ["--> _flag = %1", _flag], ["--> _patrol = %1", _patrol], ["--> _vehicle = %1", _vehicle],
	["--> _neighbours = %1", _neighbours], ["--> _isConnected = %1", _isConnected], ["--> _visibility = %1", _visibility], ["--> _task = %1", _task],
	["----------------------------"]
];

([["Function: %1", _fncName]] + _sectorMessage + _messages) call TTC_CORE_fnc_log;