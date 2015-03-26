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
	["1. Hill 45",				[20681,16202], 40,	35,	0,	true, west,			100, objNull, "", "", TTC_SC_neighbours_sector1, []],
	["2. Paros (west)",			[20886,16899], 30,	30,	10, true, east,			100, objNull, "", "", TTC_SC_neighbours_sector2, []],
	["3. Kalochori (west)",		[21209,16355], 25,	25,	65, true, east,			100, objNull, "", "", TTC_SC_neighbours_sector3, []],
	["4. Paros (north)",		[20818,17057], 20,	20,	23, true, east,			100, objNull, "", "", TTC_SC_neighbours_sector4, []],
	["5. Mobile Sector",		[21204,16661], 50,	50,	0,	false, east,		100, objNull, "", "", TTC_SC_neighbours_sector5, []],
	["6. Kalochori (south)",	[21432,16203], 20,	20,	40,	true, east,			100, objNull, "", "", TTC_SC_neighbours_sector6, []],
	["7. Paros (east)",			[20989,17050], 30,	30,	35,	true, east,			100, objNull, "", "", TTC_SC_neighbours_sector7, []],
	["8. Kalochori (east)",		[21461,16418], 25,	25,	50,	true, east,			100, objNull, "", "", TTC_SC_neighbours_sector8, []],
	["9. Hill 35",				[22031,17138], 40,	35,	0,	true, resistance,	100, objNull, "", "", TTC_SC_neighbours_sector9, []]
];