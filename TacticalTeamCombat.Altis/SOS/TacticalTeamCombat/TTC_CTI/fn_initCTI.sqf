/*
	Created by Lux0r
*/


// --------------- Definitions/Declarations ---------------
#include "Functions\Sectors\dominanceVariables.hpp"

#define TTC_CTI_timer 10
#define TTC_CTI_allSides [resistance, west, east]

TTC_CTI_sectorNo		= 0;
TTC_CTI_sectorAreaNo	= 0;

private [
	"_winner","_location","_trigger","_list","_guer","_west","_east","_guerCount","_westCount","_eastCount","_counts","_maxDiff","_max",
	"_find","_sides","_side","_max2","_diff"
];

_winner = sideUnknown;

// -------------------- Initialization --------------------
// Get location string
_location = [] call TTC_CORE_fnc_getLocation;

// Compile configuration file
[] call compile preprocessFileLineNumbers format["SOS\TacticalTeamCombat\TTC_CTI\Locations\%1.sqf", _location];

// create triggers + markers
{
	private ["_name","_pos","_xrad","_yrad","_dir","_rectangle","_side","_dominance","_trigger","_shape","_mrk"];
	_name		= _x select 0;
	_pos		= _x select 1;
	_xrad		= _x select 2;
	_yrad		= _x select 3;
	_dir		= _x select 4;
	_rectangle	= _x select 5;
	_side		= _x select 6;
	_dominance	= _x select 7;

	// Create trigger
	_trigger = [_name, _pos, _xrad, _yrad, _dir, _rectangle] call TTC_CORE_fnc_createTrigger;
	_x set [8, _trigger];

	// Create area marker
	_shape = if (_rectangle) then {"RECTANGLE";} else {"ELLIPSE";};
	_mrk = [_x, _xrad, _yrad, _dir, _shape] call TTC_CTI_fnc_createSectorAreaMarker;

	// Create marker
	_mrk = [_x, TTC_CTI_dominanceMax] call TTC_CTI_fnc_createSectorMarker;

	// Create respawn position, if dominance is high enough.
	if (_dominance > TTC_CTI_dominanceSpawn) then {
		_respawnPos = [_side, _mrk] call BIS_fnc_addRespawnPosition;
		_x set [12, _respawnPos];
	};
} forEach TTC_CTI_sectors;

// Update the sector markers, to set the visibility for the different sides.
[] call TTC_CTI_fnc_updateSectors;

// ---------------------- Game Loop ----------------------
while {_winner == sideUnknown} do {
	// Iterate over all sectors
	{
		// Copy list of units that would activate the trigger.
		_trigger = _x select 8;
		_list = +(list _trigger);

		if (!isNil "_list") then {
			// Is sector not empty?
			if (count _list > 0) then {
				// Get units for each side
				_guer = [];
				_west = [];
				_east = [];

				// Iterate over the list of units in this trigger area.
				{
					switch (side _x) do {
						case resistance: {
							_guer pushBack _x;
						};
						case west: {
							_west pushBack _x;
						};
						case east: {
							_east pushBack _x;
						};
					};
				} forEach _list;

				_guerCount	= count _guer;
				_westCount	= count _west;
				_eastCount	= count _east;
				_counts		= [_guerCount, _westCount, _eastCount];

				// Is one side dominant in this sector?
				_maxDiff	= [_counts] call BIS_fnc_maxDiffArray;

				if (_maxDiff > 0) then {
					// Find maximum units count and associated index.
					_max	= [_counts, 1] call BIS_fnc_findExtreme;
					_find	= [_counts, _max] call BIS_fnc_arrayFindDeep;

					// Find the side that is currently dominating the sector.
					_sides	= +TTC_CTI_allSides;
					_side	= _sides select (_find select 0);

					// Remove values from array.
					_counts	= _counts - [_max];
					_sides	= _sides - [_side];

					// Find 2nd maximum
					_max2	= [_counts, 1] call BIS_fnc_findExtreme;
					_diff	= abs (_max - _max2);

					// Update the capture progress
					[_x, _side, _diff*20] call TTC_CTI_fnc_updateDominance;	// Lux0r: remove *20. test purpose only!
				};
			};
		};
	} forEach TTC_CTI_sectors;

	// Check if one side wins the mission
	_winner = [] call TTC_CTI_fnc_sideCapturedAllSectors;

	sleep TTC_CTI_timer;
};

// ------------------------- End -------------------------


// Show message for everyone.
_message = parseText format ["<t align='center' size='2'>Sector Control</t><br/>
<t align='center' size='1.5'>%1 wins</t><br/><br/>
The mission is over.", _winner];

[_message,"TTC_CORE_fnc_hint"] call BIS_fnc_MP;

// End the mission for all players after 10 seconds.
sleep 10;
[TTC_CTI_Sides, _winner] call TTC_CORE_fnc_endMissionAll;