/*
	Defines the neighbours for all sectors, according to the following concept:
	https://cloud.githubusercontent.com/assets/11304010/7549440/c46b5956-f634-11e4-825d-0655790b6f41.png

	- The numbers for the neighbours represent the index in the TTC_CTI_sectorDefinitions array.
	- The side is used to represent the base a team.

	Created by Lux0r
*/


#define TTC_CTI_sectorPattern "7 sectors pattern"

#define TTC_CTI_neighbours_sectorA [west, 1, 2]			// Index: 0		// Neighbours: Base west, B, C
#define TTC_CTI_neighbours_sectorB [0, 2, 3, 4]			// Index: 1		// Neighbours: A, C, D, E
#define TTC_CTI_neighbours_sectorC [0, 1, 3, 5]			// Index: 2		// Neighbours: A, B, D, F
#define TTC_CTI_neighbours_sectorD [1, 2, 4, 5]			// Index: 3		// Neighbours: B, C, E, F
#define TTC_CTI_neighbours_sectorE [1, 3, 5, 6]			// Index: 4		// Neighbours: B, D, F, G
#define TTC_CTI_neighbours_sectorF [2, 3, 4, 6]			// Index: 5		// Neighbours: C, D, E, G
#define TTC_CTI_neighbours_sectorG [4, 5, resistance]	// Index: 6		// Neighbours: E, F, Base guer
