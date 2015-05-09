/*
	Defines all variables/attributes of the sectors at this location.

	Created by Lux0r
*/

#ifndef TTC_CTI_sectorPattern
	#include "sectorPattern.inc"
#endif

TTC_CTI_sides = [west, resistance];

// Sector: [<name>, <position>, <axisA>, <axisB>, <direction>, <isRectangle>, <side>, <dominance>, <neighbours>, <spawnDir>, <isMobile>]
TTC_CTI_sectorDefinitions = [
	["A",	[4764,11699], 40,	40,	0,	false, west,		100, TTC_CTI_neighbours_sectorA, 25, false],
	["B",	[4999,11378], 40,	40,	0,	false, west,		100, TTC_CTI_neighbours_sectorB, 90, false],
	["C",	[4895,11314], 40,	40,	0,	false, west,		100, TTC_CTI_neighbours_sectorC, 65, false],
	["D",	[5152,11337], 50,	50,	0,	false, west,		100, TTC_CTI_neighbours_sectorD, 270, false],
	["E",	[5074,11245], 50,	50,	0,	false, west,		100, TTC_CTI_neighbours_sectorE, 320, false],
	["F",	[4878,11124], 70,	70,	0,	false, west,		100, TTC_CTI_neighbours_sectorF, 140, false],
	["G",	[5070,11085], 40,	40,	0,	false, east,		100, TTC_CTI_neighbours_sectorG, 220, false],
	["H",	[5189,11139], 40,	40,	0,	false, east,		100, TTC_CTI_neighbours_sectorH, 245, false],
	["I",	[5388,10917], 40,	40,	0,	false, resistance,	100, TTC_CTI_neighbours_sectorI, 230, false]
];