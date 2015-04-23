/*
	Created by Lux0r
*/


#define TTC_CTI_sector_statements ["this", "[thisTrigger] spawn TTC_CTI_fnc_createSectorDisplay;", "1004 cutFadeOut 0.5"]

private ["_name","_pos","_xrad","_yrad","_dir","_rectangle","_side","_dominance","_neighbours","_respawnDir","_isMobile","_sector"];


// Iterate over all sector definitions:
{
	_name		= _x select 0;
	_pos		= _x select 1;
	_xrad		= _x select 2;
	_yrad		= _x select 3;
	_dir		= _x select 4;
	_rectangle	= _x select 5;
	_side		= _x select 6;
	_dominance	= _x select 7;
	_neighbours	= _x select 8;
	_respawnDir	= _x select 9;
	_isMobile	= _x select 10;

	// Create a trigger, which represents the sector.
	_sector = [_name, _pos, _xrad, _yrad, _dir, _rectangle, TTC_CTI_sector_statements] call TTC_CORE_fnc_createTrigger;
	TTC_CTI_sectors pushBack _sector;

	// Initialize all sector variables.
	_sector setVariable ["TTC_CTI_sector_name", _name, true];
	_sector setVariable ["TTC_CTI_sector_axisA", _xrad];
	_sector setVariable ["TTC_CTI_sector_axisB", _yrad];
	_sector setVariable ["TTC_CTI_sector_rectangle", _rectangle];
	_sector setVariable ["TTC_CTI_sector_side", _side, true];
	_sector setVariable ["TTC_CTI_sector_dominance", _dominance, true];
	_sector setVariable ["TTC_CTI_sector_neighbours", _neighbours];
	_sector setVariable ["TTC_CTI_sector_respawnDir", _respawnDir];
	_sector setVariable ["TTC_CTI_sector_isMobile", _isMobile];

	/*[
		["Function: %1", "TTC_CTI_createSectors"], ["_sector = %1", _sector], ["_name = %1", _name], ["_pos = %1", _pos], ["_xrad = %1", _xrad], ["_yrad = %1", _yrad],
		["_dir = %1", _dir], ["_rectangle = %1", _rectangle], ["_side = %1", _side], ["_dominance = %1", _dominance], ["_neighbours = %1", _neighbours],
		["_respawnDir = %1", _respawnDir], ["_isMobile = %1", _isMobile]
	] call TTC_CORE_fnc_log;*/
} forEach TTC_CTI_sectorDefinitions;

// Iterate over all sectors:
{
	_neighbours	= _x getVariable ["TTC_CTI_sector_neighbours", []];

	// Replace neighbour IDs with sector objects (triggers).
	{
		if (typeName _x == "SCALAR") then {
			_neighbour = TTC_CTI_sectors select _x;
			_neighbours set [_forEachIndex, _neighbour];
		};
	} forEach _neighbours;

	_x setVariable ["TTC_CTI_sector_neighbours", _neighbours];
} forEach TTC_CTI_sectors;

// Broadcast the sectors to all clients.
publicVariable "TTC_CTI_sectors";
