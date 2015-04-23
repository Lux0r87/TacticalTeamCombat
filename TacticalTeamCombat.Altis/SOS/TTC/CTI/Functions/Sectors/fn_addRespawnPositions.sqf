/*
	Created by Lux0r
*/

#include "dominanceVariables.hpp"
#include "sectorVariables.hpp"

private ["_sector","_side","_dominance","_mrk"];


// Iterate over all sectors
{
	_sector 	= _x;
	_side		= TTC_CTI_sectorVariable_side;
	_dominance	= TTC_CTI_sectorVariable_dominance;
	_mrk		= TTC_CTI_sectorVariable_marker;

	// Add respawn position, if dominance is high enough.
	if (_dominance > TTC_CTI_dominanceSpawn) then {
		_respawnPos = [_side, _mrk] call BIS_fnc_addRespawnPosition;
		_x setVariable ["TTC_CTI_sector_respawnPos", _respawnPos];
	};
} forEach TTC_CTI_sectors;