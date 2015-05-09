/*
	Defines all variables/attributes of the sectors at this location.

	Created by Lux0r
*/

#ifndef TTC_CTI_sectorPattern
	#include "sectorPattern.inc"
#endif

TTC_CTI_sides = [west, resistance];

/* Sector: [
	<name>,			// String:	The name of the sector is used for the marker, task and sector display.
	<position>,		// Array:	Position of the sector: can change, if a mobile sector is moving.
	<direction>,	// Integer:	Direction for the markers and the trigger.
	<axisA>,		// Integer:	Axis A for the markers and the trigger.
	<axisB>,		// Integer:	Axis B for the markers and the trigger.
	<isRectangle>,	// Boolean:	True = marker shape "RECTANGLE"; False = marker shape "ELLIPSE".
	<side>,			// Side:	The side which controls the sector at the beginning of the mission.
	<dominance>,	// Integer:	Defines how dominant the current side is at this sector.
	<neighbours>,	// Array:	Predefined array with the neighbour sectors, according to the pattern.
	<spawnDir>,		// Integer:	
	<type>			// Integer:	Select the type of the sector: 0 = sandbags, 1 = bag bunker, 2 = mobile
	<objectDir>		// Integer:	Direction to spawn the vehicle or the bunker/sandbags (depending on chosen type).
]*/

TTC_CTI_sectorDefinitions = [
	["A",			[20675,16203],	0,	40,	40,	false, west,		100, TTC_CTI_neighbours_sectorA, 25,	1,	30],
	["B",			[20872,16891],	0,	30,	30,	false, east,		100, TTC_CTI_neighbours_sectorB, 90,	0,	90],
	["C",			[21229,16346],	0,	25,	25,	false, east,		100, TTC_CTI_neighbours_sectorC, 65,	0,	145],
	["D",			[20633,17235],	0,	50,	50,	false, east,		100, TTC_CTI_neighbours_sectorD, 270,	0,	90],
	["E - Mobile",	[21204,16661],	0,	75,	75,	false, east,		100, TTC_CTI_neighbours_sectorE, 320,	2,	305],
	["F",			[21423,16211],	0,	15,	15,	false, east,		100, TTC_CTI_neighbours_sectorF, 140,	0,	130],
	["G",			[20999,17046],	0,	30,	30,	false, east,		100, TTC_CTI_neighbours_sectorG, 220,	0,	30],
	["H",			[21462,16435],	0,	25,	25,	false, east,		100, TTC_CTI_neighbours_sectorH, 245,	0,	40],
	["I",			[22027,17147],	0,	40,	40,	false, resistance,	100, TTC_CTI_neighbours_sectorI, 230,	1,	230]
];