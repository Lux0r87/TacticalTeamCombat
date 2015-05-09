/*
	Created by Lux0r
*/

#include "dominanceVariables.inc"
#include "sectorVariables.inc"

private ["_side","_dominance","_mrk"];


// Iterate over all sectors
{
	_side		= TTC_CTI_sectorVariable_side(_x);
	_dominance	= TTC_CTI_sectorVariable_dominance(_x);
	_mrk		= TTC_CTI_sectorVariable_marker(_x);

	// Add respawn position, if dominance is high enough.
	if (_dominance > TTC_CTI_dominanceSpawn) then {
		_respawnPos = [_side, _mrk] call BIS_fnc_addRespawnPosition;
		_x setVariable ["TTC_CTI_sector_respawnPos", _respawnPos];
	};
} forEach TTC_CTI_sectors;