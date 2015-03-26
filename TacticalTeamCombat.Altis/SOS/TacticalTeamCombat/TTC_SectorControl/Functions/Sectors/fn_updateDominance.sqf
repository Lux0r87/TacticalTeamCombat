/*
	Created by Lux0r
*/

#include "dominanceVariables.hpp"

// Don't add "_sector" to private variables. This function modifies the original variable.
private ["_side","_diff","_sectorSide","_dominance","_sectorName","_marker","_message","_respawnPos"];

_sector	= [_this, 0] call BIS_fnc_param;
_side	= [_this, 1, east, [east]] call BIS_fnc_param;
_diff	= [_this, 2, 0, [0]] call BIS_fnc_param;

_sectorSide	= _sector select 6;
_dominance	= _sector select 7;


// The attacking side is capturing the sector:
if (_sectorSide != _side) then {
	_dominance = ((_dominance - _diff) max TTC_SC_dominanceMin);

	// Remove respawn position, if dominance is too low.
	if (_dominance < TTC_SC_dominanceSpawn) then {
		_respawnPos	= _sector select 12;
		_respawnPos call BIS_fnc_removeRespawnPosition;
	};

	// Sector captured by attacking side:
	if (_dominance == TTC_SC_dominanceMin) then {
		_sectorName	= _sector select 0;
		_marker		= _sector select 10;
		_respawnPos	= _sector select 12;

		// Set dominance to maximum + change side of sector.
		_dominance = TTC_SC_dominanceMax;
		_sector set [6, _side];

		// Create respawn position, for the team that captured the sector.
		_respawnPos = [_side, _marker] call BIS_fnc_addRespawnPosition;
		_sector set [12, _respawnPos];

		// Show message for everyone.
		_message = parseText format ["<t align='center' size='2'>Sector Control</t><br/>
		<t align='center' size='1.5'>%1</t><br/><br/>
		The sector was captured by %2.", _sectorName, _side];

		[_message,"TTC_CORE_fnc_hint"] call BIS_fnc_MP;
	};
} else {	// The current side is defending the sector:
	_dominance = ((_dominance + _diff) min TTC_SC_dominanceMax);

	// (Re)create respawn position for defenders, if dominance is high enough.
	if (_dominance >= TTC_SC_dominanceSpawn) then {
		_marker		= _sector select 10;
		_respawnPos = [_sectorSide, _marker] call BIS_fnc_addRespawnPosition;
		_sector set [12, _respawnPos];
	};
};

// Update the dominance variable.
_sector set [7, _dominance];

// Update the sector markers.
[_sector] call TTC_SC_fnc_updateSectorMarkers;