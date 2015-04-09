/*
	Created by Lux0r
*/


#include "Functions\Sectors\dominanceVariables.hpp"
#include "Functions\Sectors\sectorVariables.hpp"


// Client-side scripts:
if (hasInterface) then {
	waitUntil {!isNull player};

	// Update all markers locally.
	[[false, player], "TTC_CTI_fnc_updateSectors", false, false] call BIS_fnc_MP;

	"TTC_CTI_mobileSector_timeOut" addPublicVariableEventHandler {
		_value = _this select 1;

		if (_value > 0) then {
			hintSilent format ["%1s left to move the mobile sector.", _value];
		} else {
			hintSilent "Mobile sector stopped!";
		};
	};
};


// Server-side scripts:
if (isServer) then {
	// --------------- Definitions/Declarations ---------------
	#define TTC_CTI_timer 10
	#define TTC_CTI_allSides [resistance, west, east]

	TTC_CTI_sectorNo		= 0;
	TTC_CTI_sectorAreaNo	= 0;

	private ["_winner","_location","_sectorPattern","_trigger","_list","_guer","_west","_east","_counts","_maxDiff","_max","_find","_sides","_side","_max2","_diff"];

	_winner = sideUnknown;

	// -------------------- Initialization --------------------
	// Get location string
	_location = [] call TTC_CORE_fnc_getLocation;

	// Get sector pattern string
	_sectorPattern = [] call TTC_CORE_fnc_getSectorPattern;

	// Compile configuration file
	[] call compile preprocessFileLineNumbers format["SOS\TacticalTeamCombat\TTC_CTI\Locations\%1\%2.sqf", _sectorPattern, _location];

	// Initialize the sectors (create triggers, markers, patrols)
	{
		private ["_name","_pos","_xrad","_yrad","_dir","_rectangle","_visibility","_trigger","_shape","_mrk","_patrol","_canSee"];
		_sector		= _x;
		_name		= _sector select TTC_CTI_sector_name;
		_pos		= _sector select TTC_CTI_sector_position;
		_xrad		= _sector select TTC_CTI_sector_axisA;
		_yrad		= _sector select TTC_CTI_sector_axisB;
		_dir		= _sector select TTC_CTI_sector_direction;
		_rectangle	= _sector select TTC_CTI_sector_rectangle;
		_visibility	= _sector select TTC_CTI_sector_visibility;

		// Create trigger
		_trigger = [_name, _pos, _xrad, _yrad, _dir, _rectangle] call TTC_CORE_fnc_createTrigger;
		_sector set [TTC_CTI_sector_trigger, _trigger];

		// Create area marker
		_shape = if (_rectangle) then {"RECTANGLE";} else {"ELLIPSE";};
		_mrk = [_sector, _xrad, _yrad, _dir, _shape] call TTC_CTI_fnc_createSectorAreaMarker;

		// Create marker
		_mrk = [_sector, TTC_CTI_dominanceMax] call TTC_CTI_fnc_createSectorMarker;

		// Create sector patrol.
		_patrol = [_sector] call TTC_CTI_fnc_createSectorPatrol;

		// Create vehicle for mobile sector(s).
		if (count _sector >= 17) then {
			[_sector, _forEachIndex] call TTC_CTI_fnc_createMobileSector;
		};

		// Set the visibility of this sector for each side.
		{
			_canSee = [_sector, _x] call TTC_CTI_fnc_canSee;
			_visibility set [_forEachIndex, _canSee];
			_sector set [TTC_CTI_sector_visibility, _visibility];
		} forEach TTC_CTI_Sides;
	} forEach TTC_CTI_sectors;

	// Add respawn positions to the sectors, after the safety time is over.
	[] spawn {
		waitUntil {
			sleep 1;
			TTC_safetyTime <= 0
		};

		[] call TTC_CTI_fnc_addRespawnPositions;
	};

	// ---------------------- Game Loop ----------------------
	while {_winner == sideUnknown} do {
		// Iterate over all sectors
		{
			// Copy list of units that would activate the trigger.
			_trigger = _x select TTC_CTI_sector_trigger;
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

					// Is one side dominant in this sector?
					_counts		= [count _guer, count _west, count _east];
					_maxDiff	= [_counts] call BIS_fnc_maxDiffArray;

					if (_maxDiff > 0) then {
						// Find maximum units count and associated index.
						_max	= [_counts, 1] call BIS_fnc_findExtreme;
						_find	= ([_counts, _max] call BIS_fnc_arrayFindDeep) select 0;

						// Find the side that is currently dominating the sector.
						_sides	= +TTC_CTI_allSides;
						_side	= _sides select _find;

						// Remove values from the arrays.
						_counts set [_find, -1];
						_counts	= _counts - [-1];
						_sides	= _sides - [_side];

						// Find 2nd maximum
						_max2	= [_counts, 1] call BIS_fnc_findExtreme;
						_diff	= abs (_max - _max2);

						/*[
							["TTC_CTI: initCTI:"], ["_counts = %1", _counts], ["_maxDiff = %1", _maxDiff], ["_max = %1", _max], ["_find = %1", _find],
							["_sides = %1", _sides], ["_side = %1", _side], ["_max2 = %1", _max2], ["_diff = %1", _diff]
						] call TTC_CORE_fnc_log;*/

						// Update the capture progress
						if (_diff > 0) then {
							[_x, _side, _diff*20] call TTC_CTI_fnc_updateDominance;	// Lux0r: remove *20. test purpose only!
						};
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
};