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
	<respawnDir>,	// Array:	Respawn directions for the different teams. Must be the same order as 'TTC_CTI_sides'!
	<type>,			// Integer:	Select the type of the sector: 0 = station, 1 = outpost, 2 = bag bunker, 3 = mobile.
	<objectDir>,	// Integer:	Direction to spawn the vehicle or the station/outpost/bunker (depending on chosen type).
	<patrolTypes>	// Array:	Patrol types for the different teams (0 = None, 1 = 5 men, 2 = 8 men). Must be the same order as 'TTC_CTI_sides'!
]*/

TTC_CTI_sectorDefinitions = [
	["A",			[20675,16203],	0,	40,	40,	false, west,		100, TTC_CTI_neighbours_sectorA, [30, 210],		2,	30,		[2, 0]],
	["B",			[20872,16891],	0,	30,	30,	false, east,		100, TTC_CTI_neighbours_sectorB, [80, 200],		0,	90,		[1, 1]],
	["C",			[21229,16346],	0,	25,	25,	false, east,		100, TTC_CTI_neighbours_sectorC, [60, 260],		0,	145,	[1, 1]],
	["D",			[20633,17235],	0,	50,	50,	false, east,		100, TTC_CTI_neighbours_sectorD, [110, 150],	0,	90,		[1, 1]],
	["E - Mobile",	[21204,16661],	0,	75,	75,	false, east,		100, TTC_CTI_neighbours_sectorE, [40, 220],		3,	305,	[1, 1]],
	["F",			[21423,16211],	0,	15,	15,	false, east,		100, TTC_CTI_neighbours_sectorF, [20, 170],		0,	130,	[1, 1]],
	["G",			[20999,17046],	0,	30,	30,	false, east,		100, TTC_CTI_neighbours_sectorG, [40, 220],		0,	30,		[1, 1]],
	["H",			[21462,16435],	0,	25,	25,	false, east,		100, TTC_CTI_neighbours_sectorH, [20, 230],		0,	40,		[1, 1]],
	["I",			[22027,17147],	0,	40,	40,	false, resistance,	100, TTC_CTI_neighbours_sectorI, [50, 230],		2,	230,	[0, 2]]
];
