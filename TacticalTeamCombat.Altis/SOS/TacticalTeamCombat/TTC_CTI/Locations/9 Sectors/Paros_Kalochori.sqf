/*
	Defines all variables/attributes of the sectors at this location.

	Created by Lux0r
*/

#ifndef TTC_CTI_sectorPattern
	#include "sectorPattern.hpp"
#endif

TTC_CTI_Sides = [west, resistance];

TTC_CTI_sectors = [
	["A",			[20681,16202], 40,	40,	0,	false, west,		100, objNull, "", "", TTC_CTI_neighbours_sectorA, [], 25, []],
	["B",			[20887,16894], 30,	30,	0,	false, east,		100, objNull, "", "", TTC_CTI_neighbours_sectorB, [], 90, []],
	["C",			[21225,16358], 25,	25,	0,	false, east,		100, objNull, "", "", TTC_CTI_neighbours_sectorC, [], 65, []],
	["D",			[20644,17235], 50,	50,	0,	false, east,		100, objNull, "", "", TTC_CTI_neighbours_sectorD, [], 270, []],
	["E - Mobile",	[21204,16661], 75,	75,	0,	false, east,		100, objNull, "", "", TTC_CTI_neighbours_sectorE, [], 320, []],
	["F",			[21430,16209], 15,	15,	0,	false, east,		100, objNull, "", "", TTC_CTI_neighbours_sectorF, [], 140, []],
	["G",			[20992,17049], 30,	30,	0,	false, east,		100, objNull, "", "", TTC_CTI_neighbours_sectorG, [], 220, []],
	["H",			[21466,16424], 25,	25,	0,	false, east,		100, objNull, "", "", TTC_CTI_neighbours_sectorH, [], 245, []],
	["I",			[22031,17138], 40,	40,	0,	false, resistance,	100, objNull, "", "", TTC_CTI_neighbours_sectorI, [], 230, []]
];