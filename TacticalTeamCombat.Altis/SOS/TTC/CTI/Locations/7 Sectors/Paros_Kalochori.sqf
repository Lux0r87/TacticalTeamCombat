/*
	Defines all variables/attributes of the sectors at this location.

	Created by Lux0r
*/

#ifndef TTC_CTI_sectorPattern
	#include "sectorPattern.hpp"
#endif

TTC_CTI_sides = [west, resistance];

// Sector: [<name>, <position>, <axisA>, <axisB>, <direction>, <isRectangle>, <side>, <dominance>, <neighbours>, <spawnDir>, <isMobile>]
TTC_CTI_sectorDefinitions = [
	["A",			[20681,16202], 40,	40,	0,		false, west,		100, TTC_CTI_neighbours_sectorA, 25, false],
	["B",			[20887,16894], 30,	30,	0,		false, east,		100, TTC_CTI_neighbours_sectorB, 90, false],
	["C",			[21225,16358], 25,	25,	0,		false, east,		100, TTC_CTI_neighbours_sectorC, 65, false],
	["D - Mobile",	[21204,16661], 75,	75,	305,	false, east,		100, TTC_CTI_neighbours_sectorD, 320, true],
	["E",			[20992,17049], 30,	30,	0,		false, east,		100, TTC_CTI_neighbours_sectorE, 220, false],
	["F",			[21466,16424], 25,	25,	0,		false, east,		100, TTC_CTI_neighbours_sectorF, 245, false],
	["G",			[22031,17138], 40,	40,	0,		false, resistance,	100, TTC_CTI_neighbours_sectorG, 230, false]
];