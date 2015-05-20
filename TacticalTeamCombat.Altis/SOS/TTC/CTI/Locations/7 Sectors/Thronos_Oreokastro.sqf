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
	["A",	[4411,20819],	0,	100,	100,	false, west,		100, TTC_CTI_neighbours_sectorA, [340, 130],	2,	340,	[2, 0]],
	["B",	[3784,21494],	0,	100,	100,	false, east,		100, TTC_CTI_neighbours_sectorB, [85, 85],		0,	85,		[1, 1]],
	["C",	[4583,21403],	0,	110,	110,	false, east,		100, TTC_CTI_neighbours_sectorC, [315, 315],	0,	315,	[1, 1]],
	["D",	[4420,21867],	0,	75,		75,		false, east,		100, TTC_CTI_neighbours_sectorD, [80, 140],		0,	110,	[1, 1]],
	["E",	[4662,22316],	0,	100,	100,	false, east,		100, TTC_CTI_neighbours_sectorE, [210, 210],	0,	210,	[1, 1]],
	["F",	[4870,21931],	0,	110,	110,	false, east,		100, TTC_CTI_neighbours_sectorF, [110, 210],	0,	210,	[1, 1]],
	["G",	[5520,21759],	0,	100,	100,	false, resistance,	100, TTC_CTI_neighbours_sectorG, [85, 275],		2,	275,	[0, 2]]
];
