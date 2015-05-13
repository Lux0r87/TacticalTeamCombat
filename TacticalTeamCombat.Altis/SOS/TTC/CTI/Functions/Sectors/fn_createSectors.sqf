/*
	Created by Lux0r
*/


#define TTC_CTI_sector_statements ["this", "[thisTrigger] spawn TTC_CTI_fnc_createSectorDisplay;", "1004 cutFadeOut 0.5"]

private ["_sectors","_name","_pos","_dir","_xrad","_yrad","_rectangle","_side","_dominance","_neighbours","_respawnDir","_type","_objectDir","_patrolTypes","_sector"];


_sectors = [];

// Iterate over all sector definitions:
{
	_name			= _x select 0;
	_pos			= _x select 1;
	_dir			= _x select 2;
	_xrad			= _x select 3;
	_yrad			= _x select 4;
	_rectangle		= _x select 5;
	_side			= _x select 6;
	_dominance		= _x select 7;
	_neighbours		= _x select 8;
	_respawnDir		= _x select 9;
	_type			= _x select 10;
	_objectDir		= _x select 11;
	_patrolTypes	= _x select 12;

	// Create a trigger, which represents the sector.
	_sector = [_name, _pos, _xrad, _yrad, _dir, _rectangle, TTC_CTI_sector_statements] call TTC_CORE_fnc_createTrigger;
	_sectors pushBack _sector;

	// Initialize all sector variables.
	_sector setVariable ["TTC_CTI_sector_name",			_name,			true];	// Broadcast sector name to all clients.
	_sector setVariable ["TTC_CTI_sector_axisA",		_xrad];
	_sector setVariable ["TTC_CTI_sector_axisB",		_yrad];
	_sector setVariable ["TTC_CTI_sector_rectangle",	_rectangle];
	_sector setVariable ["TTC_CTI_sector_side",			_side,			true];	// Broadcast sector side to all clients.
	_sector setVariable ["TTC_CTI_sector_dominance",	_dominance,		true];	// Broadcast sector dominance to all clients.
	_sector setVariable ["TTC_CTI_sector_neighbours",	_neighbours];
	_sector setVariable ["TTC_CTI_sector_respawnDir",	_respawnDir,	true];	// Broadcast respawn positions to all clients.
	_sector setVariable ["TTC_CTI_sector_type",			_type];
	_sector setVariable ["TTC_CTI_sector_objectDir",	_objectDir];
	_sector setVariable ["TTC_CTI_sector_patrolTypes",	_patrolTypes];

	//[_sector, "TTC_CTI_fnc_createSectors"] call TTC_CTI_fnc_logSector;
} forEach TTC_CTI_sectorDefinitions;

_sectors
