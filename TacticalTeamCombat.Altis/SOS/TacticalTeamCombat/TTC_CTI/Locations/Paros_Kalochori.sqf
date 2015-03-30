/*
	Defines the position, direction and size of all sectors (triggers) at this location.
	
	The sectors are defined with the following pattern:
	[<name>, [<posX>,<poY>], <axisA>, <axisB>, <direction>, <rectangle>, <side>, <dominance>, <trigger>, <markerArea>, <marker>, <neighbours>, <respawnPos>, <respawnDir>]
	
	Created by Lux0r
*/

#ifndef TTC_CTI_sectorPattern
	#include "Patterns\9_sectors.hpp"
#endif

TTC_CTI_Sides = [west, resistance];

TTC_CTI_sectors = [
	["A",			[20681,16202], 40,	40,	0,	false, west,		100, objNull, "", "", TTC_CTI_neighbours_sector1, [], 25],
	["B",			[20887,16894], 30,	30,	0,	false, east,		100, objNull, "", "", TTC_CTI_neighbours_sector2, [], 90],
	["C",			[21225,16358], 25,	25,	0,	false, east,		100, objNull, "", "", TTC_CTI_neighbours_sector3, [], 65],
	["D",			[20644,17235], 50,	50,	0,	false, east,		100, objNull, "", "", TTC_CTI_neighbours_sector4, [], 270],
	["E - Mobile",	[21204,16661], 75,	75,	0,	false, east,		100, objNull, "", "", TTC_CTI_neighbours_sector5, [], 320],
	["F",			[21430,16209], 15,	15,	0,	false, east,		100, objNull, "", "", TTC_CTI_neighbours_sector6, [], 140],
	["G",			[20992,17049], 30,	30,	0,	false, east,		100, objNull, "", "", TTC_CTI_neighbours_sector7, [], 220],
	["H",			[21466,16424], 25,	25,	0,	false, east,		100, objNull, "", "", TTC_CTI_neighbours_sector8, [], 245],
	["I",			[22031,17138], 40,	40,	0,	false, resistance,	100, objNull, "", "", TTC_CTI_neighbours_sector9, [], 230]
];