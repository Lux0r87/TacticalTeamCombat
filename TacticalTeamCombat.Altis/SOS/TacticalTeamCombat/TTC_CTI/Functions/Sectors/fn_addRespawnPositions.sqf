/*
	Created by Lux0r
*/

#include "dominanceVariables.hpp"
#include "sectorVariables.hpp"

private ["_side","_dominance","_mrk"];


// Iterate over all sectors
{
	_side		= _x select TTC_CTI_sector_side;
	_dominance	= _x select TTC_CTI_sector_dominance;
	_mrk		= _x select TTC_CTI_sector_marker;

	// Add respawn position, if dominance is high enough.
	if (_dominance > TTC_CTI_dominanceSpawn) then {
		_respawnPos = [_side, _mrk] call BIS_fnc_addRespawnPosition;
		_x set [TTC_CTI_sector_respawnPos, _respawnPos];
	};
} forEach TTC_CTI_sectors;