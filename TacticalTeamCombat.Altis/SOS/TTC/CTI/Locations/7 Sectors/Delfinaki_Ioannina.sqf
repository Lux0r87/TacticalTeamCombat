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
	["A",	[23027,19396],	0,	40,	40,	false,	west,		100, TTC_CTI_neighbours_sectorA, [40, 220],		2,	40,		[2, 0]],
	["B",	[23230,19931],	0,	50,	50,	false,	east,		100, TTC_CTI_neighbours_sectorB, [50, 230],		0,	50,		[1, 1]],
	["C",	[23911,19610],	0,	75,	75,	false,	east,		100, TTC_CTI_neighbours_sectorC, [50, 285],		1,	100,	[1, 1]],
	["D",	[23541,19936],	53,	45,	45,	true,	east,		100, TTC_CTI_neighbours_sectorD, [55, 235],		0,	145,	[1, 1]],
	["E",	[23528,20539],	0,	75,	75,	false,	east,		100, TTC_CTI_neighbours_sectorE, [150, 245],	1,	265,	[1, 1]],
	["F",	[23964,20165],	0,	50,	50,	false,	east,		100, TTC_CTI_neighbours_sectorF, [50, 230],		0,	230,	[1, 1]],
	["G",	[24390,20550],	0,	50,	50,	false,	resistance,	100, TTC_CTI_neighbours_sectorG, [65, 245],		2,	245,	[0, 2]]
];
