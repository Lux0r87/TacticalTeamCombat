/*
	Created by Lux0r
*/

#include "dominanceVariables.hpp"


{
	// Update the sector markers.
	[_x, TTC_CTI_dominanceMax] call TTC_CTI_fnc_updateSectorMarkers;
} forEach TTC_CTI_sectors;