/*
	Created by Lux0r
*/


if (isNil "TTC_CTI_initDone") then {
	TTC_CTI_initDone	= false;
};

if (isNil "TTC_CTI_sectors") then {
	TTC_CTI_sectors		= [];
};

// Client-side scripts:
if (hasInterface) then {
	waitUntil {!isNull player};

	// Initialize the sectors (markers + task) locally.
	[player] spawn TTC_CTI_fnc_initSectorsLocal;

	"TTC_CTI_mobileSector_timeOut" addPublicVariableEventHandler {
		_value = _this select 1;

		if (_value > 0) then {
			hintSilent format ["%1s left to move the mobile sector.", _value];
		} else {
			hintSilent "Mobile sector stopped!";
		};
	};

	// Draw connection between the sectors on the main map, the GPS and the UAV terminal.
	[] call TTC_CTI_fnc_initSectorConnections;
};


// Server-side scripts:
if (isServer) then {
	// ----------------------- Includes -----------------------
	#include "Functions\Sectors\sectorChecks.inc"

	// --------------- Definitions/Declarations ---------------
	#define TTC_CTI_timer 10			// Defines how fast the sector dominance will be updated (in seconds).
	#define TTC_CTI_diffMultiplier 5	// The capture progress (dominance change) for every capturing soldier.
	#define TTC_CTI_allSides [resistance, west, east]
	#define TTC_CTI_respawnTime 600		// Time after dead AI soldiers respawn at the sector (in seconds).

	private [
		"_winner","_location","_sectorPattern","_sector","_patrol","_corpses","_pos","_safePos","_stop","_update","_unit","_list","_guer","_west","_east",
		"_counts","_maxDiff","_max","_find","_sides","_side","_max2","_diff"
	];

	_winner = sideUnknown;

	// -------------------- Initialization --------------------
	// Get location string
	_location = [] call TTC_CORE_fnc_getLocation;

	// Get sector pattern string
	_sectorPattern = [] call TTC_CORE_fnc_getSectorPattern;

	// Compile configuration file and broadcast the sides variable to all clients.
	[] call compile preprocessFileLineNumbers format["SOS\TTC\CTI\Locations\%1\%2.sqf", _sectorPattern, _location];
	publicVariable "TTC_CTI_sides";

	// Create all sectors defined in the location configuration.
	TTC_CTI_sectors = [] call TTC_CTI_fnc_createSectors;

	// Broadcast the sectors to all clients.
	publicVariable "TTC_CTI_sectors";

	// Initialize the sectors.
	[TTC_CTI_sectors] call TTC_CTI_fnc_initSectors;

	/* DEPRECATED: https://github.com/Lux0r87/TacticalTeamCombat/issues/87
	// Add respawn positions to the sectors, after the safety time is over.
	[] spawn {
		waitUntil {
			sleep 1;
			TTC_safetyTime <= 0
		};

		[] call TTC_CTI_fnc_addRespawnPositions;
	};*/

	TTC_CTI_initDone = true;
	publicVariable "TTC_CTI_initDone";

	// ---------------------- Game Loop ----------------------
	while {_winner == sideUnknown} do {
		// Iterate over all sectors.
		{
			_sector	= _x;

			// Respawn dead AI units, if the sector dominance is maximum.
			if (TTC_CTI_isSectorDominanceMax(_sector)) then {
				// Get sector patrol and dead units.
				_patrol		= TTC_CTI_sectorVariable_patrol(_sector);
				_corpses	= TTC_CTI_sectorVariable_corpses(_sector);

				// Find a safe position to spawn the AI.
				_pos		= getPos _sector;
				_safePos	= [_pos, 0, 15, 1, 0, 1000, 0, [], [_pos, _pos]] call BIS_fnc_findSafePos;

				// Helper variables.
				_stop	= false;
				_update	= false;

				// Iterate over all corpses.
				for [{_c = 0},{_c < (count _corpses) && !_stop},{_c = _c + 1}] do {
					_corpse	= _corpses select _c;

					// Check if it's time to respawn the unit.
					if (time > ((_corpse select 0) + TTC_CTI_respawnTime)) then {
						_update	= true;
						_unit	= _patrol createUnit [(_corpse select 1), _safePos, [], 0, "NONE"];
						_unit addEventHandler ["killed", TTC_CTI_fnc_killed];	// EH to respawn dead AI.
						_unit addEventHandler ["killed", TTC_BTC_fnc_killed];	// EH to detect team kills and remove the gear from dead AI.
						_unit setVariable ["TTC_isLocked", true, true];
						_unit setVariable ["TTC_CTI_sector", _sector];

						// Clear the entry (set to empty array), to delete it afterwards.
						_corpses set [_c, []];
					} else {
						_stop	= true;
					};
				};

				if (_update) then {
					// Remove empty entries from the array.
					_corpses = _corpses - [[]];

					// Update the corpse variable.
					_sector setVariable ["TTC_CTI_sector_corpses", _corpses];
				};
			};

			// Copy list of units that would activate the trigger.
			_list = +(list _sector);

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
							["Function: %1", "TTC_CTI_init"],
							["_counts = %1", _counts], ["_maxDiff = %1", _maxDiff], ["_max = %1", _max], ["_find = %1", _find],
							["_sides = %1", _sides], ["_side = %1", _side], ["_max2 = %1", _max2], ["_diff = %1", _diff]
						] call TTC_CORE_fnc_log;*/

						// Update the capture progress
						if (_diff > 0) then {
							[_sector, _side, _diff*TTC_CTI_diffMultiplier, _list] call TTC_CTI_fnc_updateDominance;
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
	[TTC_CTI_sides, _winner] call TTC_CORE_fnc_endMissionAll;
};