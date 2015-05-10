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
	<spawnDir>,		// Array:	Respawn directions for the different teams. Must be the same order as 'TTC_CTI_sides'!
	<type>,			// Integer:	Select the type of the sector: 0 = sandbags, 1 = bag bunker, 2 = mobile
	<objectDir>		// Integer:	Direction to spawn the vehicle or the bunker/sandbags (depending on chosen type).
]*/

TTC_CTI_sectorDefinitions = [
	["A",	[4736,11701],	0,	40,	40,	false, west,		100, TTC_CTI_neighbours_sectorA, [155, 310],	1,	155],
	["B",	[5001,11380],	0,	40,	40,	false, west,		100, TTC_CTI_neighbours_sectorB, [125, 310],	0,	125],
	["C",	[4889,11317],	0,	40,	40,	false, west,		100, TTC_CTI_neighbours_sectorC, [130, 0],		0,	120],
	["D",	[5151,11331],	0,	50,	50,	false, west,		100, TTC_CTI_neighbours_sectorD, [200, 270],	0,	250],
	["E",	[5074,11245],	0,	50,	50,	false, west,		100, TTC_CTI_neighbours_sectorE, [150, 330],	0,	0],
	["F",	[4882,11120],	0,	70,	70,	false, west,		100, TTC_CTI_neighbours_sectorF, [80, 40],		0,	80],
	["G",	[5068,11086],	0,	40,	40,	false, west,		100, TTC_CTI_neighbours_sectorG, [120, 330],	0,	330],
	["H",	[5192,11140],	0,	40,	40,	false, west,		100, TTC_CTI_neighbours_sectorH, [150, 305],	0,	305],
	["I",	[5388,10917],	0,	40,	40,	false, resistance,	100, TTC_CTI_neighbours_sectorI, [100, 300],	1,	285]
];
