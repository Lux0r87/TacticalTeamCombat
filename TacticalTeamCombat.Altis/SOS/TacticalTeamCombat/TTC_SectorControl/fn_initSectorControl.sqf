/*
	Created by Lux0r
*/


// --------------- Definitions/Declarations ---------------
#include "Functions\Sectors\dominanceVariables.hpp"

#define TTC_SC_timer 10
#define TTC_SC_sides [resistance, west, east]

TTC_SC_sectorNo		= 0;
TTC_SC_sectorAreaNo	= 0;

private [
	"_winner","_location","_trigger","_list","_guer","_west","_east","_guerCount","_westCount","_eastCount","_counts","_maxDiff","_max",
	"_find","_sides","_side","_max2","_diff"
];

_winner = false;

// -------------------- Initialization --------------------
// Get location string
_location = [] call TTC_CORE_fnc_getLocation;

// Compile configuration file
[] call compile preprocessFileLineNumbers format["SOS\TacticalTeamCombat\TTC_SectorControl\Locations\%1.sqf", _location];

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
	_mrk = [_x, _xrad, _yrad, _dir, _shape] call TTC_SC_fnc_createSectorAreaMarker;

	// Create marker
	_mrk = [_x] call TTC_SC_fnc_createSectorMarker;

	// Create respawn position, if dominance is high enough.
	if (_dominance > TTC_SC_dominanceSpawn) then {
		_respawnPos = [_side, _mrk] call BIS_fnc_addRespawnPosition;
		_x set [12, _respawnPos];
	};
} forEach TTC_SC_sectors;

// ---------------------- Game Loop ----------------------
while {!_winner} do {
	// Iterate over all sectors
	{
		_trigger = _x select 8;
		diag_log format ["-------------------- %1 --------------------", triggerText _trigger];

		// Copy list of units that would activate the trigger.
		_list = +(list _trigger);

		if (!isNil "_list") then {
			diag_log format ["TTC_SC - startSectorContol: _list = %1", _list];

			// Is sector not empty?
			if (count _list > 0) then {
				// Get units for each side
				_guer = [];
				_west = [];
				_east = [];

				//_guer	= [_list, {side _x == resistance}] call BIS_fnc_conditionalSelect;
				//_west	= [_list, {side _x == west}] call BIS_fnc_conditionalSelect;
				//_east	= [_list, {side _x == east}] call BIS_fnc_conditionalSelect;

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

				diag_log format ["TTC_SC - startSectorContol: _guer (%1) = %2", _guerCount, _guer];
				diag_log format ["TTC_SC - startSectorContol: _west (%1) = %2", _westCount, _west];
				diag_log format ["TTC_SC - startSectorContol: _east (%1) = %2", _eastCount, _east];

				// Is one side dominant in this sector?
				_maxDiff	= [_counts] call BIS_fnc_maxDiffArray;
				diag_log format ["TTC_SC - startSectorContol: _maxDiff = %1", _maxDiff];

				if (_maxDiff > 0) then {
					// Find maximum units count and associated index.
					_max	= [_counts, 1] call BIS_fnc_findExtreme;
					_find	= [_counts, _max] call BIS_fnc_arrayFindDeep;
					diag_log format ["TTC_SC - startSectorContol: _max = %1, _find = %2", _max, _find];

					// Find the side that is currently dominating the sector.
					_sides	= +TTC_SC_sides;
					_side	= _sides select (_find select 0);
					diag_log format ["TTC_SC - startSectorContol: _side = %1", _side];

					// Remove values from array.
					_counts	= _counts - [_max];
					_sides	= _sides - [_side];

					// Find 2nd maximum
					_max2	= [_counts, 1] call BIS_fnc_findExtreme;
					_diff	= abs (_max - _max2);
					diag_log format ["TTC_SC - startSectorContol: _max2 = %1, _diff = %2", _max2, _diff];

					// Update the capture progress
					[_x, _side, _diff*20] call TTC_SC_fnc_updateDominance;	// Lux0r: remove *20. test purpose only!
				};
			};
		};
	} forEach TTC_SC_sectors;

	// Check if one side wins the mission
	//_winner = [] call TTC_SC_fnc_;

	sleep TTC_SC_timer;
};

// ------------------------- End -------------------------


// Show message
//[] call TTC_SC_fnc_;

// End the mission
//[] call TTC_SC_fnc_;