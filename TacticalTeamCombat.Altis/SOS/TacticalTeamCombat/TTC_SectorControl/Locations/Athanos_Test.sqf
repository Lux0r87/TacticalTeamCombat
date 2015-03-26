/*
	Defines the position, direction and size of all sectors (triggers) at this location.
	
	The sectors are defined with the following pattern:
	[<name>, [<posX>,<poY>], <axisA>, <axisB>, <direction>, <rectangle>, <side>, <dominance>, <trigger>, <markerArea>, <marker>, <neighbours>, <respawnPos>]
	
	Created by Lux0r
*/

#ifndef TTC_SC_sectorPattern
	#include "Patterns\9_sectors.hpp"
#endif


TTC_SC_sectors = [
	["1. Sector", [3510,10113], 30, 30, 45,	true, resistance, 100, objNull, "", "", TTC_SC_neighbours_sector1, []],
	["2. Sector", [3532,10274], 20, 20, 0,	true, east, 100, objNull, "", "", TTC_SC_neighbours_sector2, []],
	["3. Sector", [3574,10188], 20, 20, 0,	true, east, 100, objNull, "", "", TTC_SC_neighbours_sector3, []],
	["4. Sector", [3583,10307], 20, 20, 0,	true, east, 100, objNull, "", "", TTC_SC_neighbours_sector4, []],
	["5. Sector", [3607,10239], 30, 30, 0,	false, east, 100, objNull, "", "", TTC_SC_neighbours_sector5, []],
	["6. Sector", [3635,10150], 20, 20, 0,	true, east, 100, objNull, "", "", TTC_SC_neighbours_sector6, []],
	["7. Sector", [3615,10336], 20, 20, 0,	true, east, 100, objNull, "", "", TTC_SC_neighbours_sector7, []],
	["8. Sector", [3694,10264], 20, 20, 0,	true, east, 100, objNull, "", "", TTC_SC_neighbours_sector8, []],
	["9. Sector", [3826,10264], 30, 30, 0,	true, west, 100, objNull, "", "", TTC_SC_neighbours_sector9, []]
];