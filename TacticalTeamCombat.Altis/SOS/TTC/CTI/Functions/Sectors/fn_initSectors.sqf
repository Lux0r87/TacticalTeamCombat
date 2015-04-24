/*
	Created by Lux0r
*/


#include "Functions\Sectors\sectorVariables.hpp"

private ["_sectors","_neighbours","_neighbour","_sector","_name","_xrad","_yrad","_rectangle","_side","_dominance","_respawnDir","_isMobile","_shape","_mrk","_patrol","_visibility","_canSee"];


_sectors = [_this, 0] call BIS_fnc_param;

[
	["Function: %1", "TTC_CTI_initSectors"], ["_sectors = %1", _sectors]
] call TTC_CORE_fnc_log;


/*
	Iterate over all sectors.
	IMPORTANT: Replace neighbour IDs with sector objects (triggers) first!
*/
{
	_neighbours	= _x getVariable ["TTC_CTI_sector_neighbours", []];

	// Replace neighbour IDs with sector objects (triggers).
	{
		if (typeName _x == "SCALAR") then {
			_neighbour = _sectors select _x;
			_neighbours set [_forEachIndex, _neighbour];
		};
	} forEach _neighbours;

	_x setVariable ["TTC_CTI_sector_neighbours", _neighbours];
} forEach _sectors;

// Iterate over all sectors:
{
	_sector		= _x;
	_name		= TTC_CTI_sectorVariable_name;
	_xrad		= TTC_CTI_sectorVariable_axisA;
	_yrad		= TTC_CTI_sectorVariable_axisB;
	_rectangle	= TTC_CTI_sectorVariable_rectangle;
	_side		= TTC_CTI_sectorVariable_side;
	_dominance	= TTC_CTI_sectorVariable_dominance;
	_respawnDir	= TTC_CTI_sectorVariable_respawnDir;
	_isMobile	= TTC_CTI_sectorVariable_isMobile;

	// Create area marker
	_shape = if (_rectangle) then {"RECTANGLE";} else {"ELLIPSE";};
	_mrk = [_sector, _forEachIndex, _name, _xrad, _yrad, _side, _dominance, getDir _sector, _shape] call TTC_CTI_fnc_createSectorAreaMarker;

	// Create marker
	_mrk = [_sector, _forEachIndex, _name, _side, _dominance, _respawnDir, TTC_CTI_dominanceMax] call TTC_CTI_fnc_createSectorMarker;

	// Create sector patrol.
	_patrol = [_sector, _xrad, _yrad, _side, grpNull] call TTC_CTI_fnc_createSectorPatrol;

	// Create vehicle for mobile sector(s).
	if (_isMobile) then {
		[_sector, _side] call TTC_CTI_fnc_createMobileSector;
	};

	// Set the visibility of the sector for each side.
	_visibility	= [];

	{
		_canSee = [_sector, _x, _side] call TTC_CTI_fnc_canSeeSector;
		_visibility pushBack _canSee;
	} forEach TTC_CTI_sides;

	_sector setVariable ["TTC_CTI_sector_visibility", _visibility, true];
} forEach _sectors;
