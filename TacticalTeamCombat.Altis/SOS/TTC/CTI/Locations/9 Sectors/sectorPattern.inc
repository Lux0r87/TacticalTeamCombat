/*
	Defines the neighbours for all sectors, according to the following concept:
	https://cloud.githubusercontent.com/assets/11304010/7730793/99f70c42-ff1c-11e4-9fa6-293e7080c3c8.png

	- The numbers for the neighbours represent the index in the TTC_CTI_sectorDefinitions array.
	- The side is used to represent the base a team.

	Created by Lux0r
*/


#define TTC_CTI_sectorPattern "9 sectors pattern"

#define TTC_CTI_neighbours_sectorA [west, 1, 2]			// Index: 0		// Neighbours: Base west, B, C
#define TTC_CTI_neighbours_sectorB [0, 2, 3, 4]			// Index: 1		// Neighbours: A, C, D, E
#define TTC_CTI_neighbours_sectorC [0, 1, 4, 5]			// Index: 2		// Neighbours: A, B, E, F
#define TTC_CTI_neighbours_sectorD [1, 4, 6]			// Index: 3		// Neighbours: B, E, G
#define TTC_CTI_neighbours_sectorE [1, 2, 3, 5, 6, 7]	// Index: 4		// Neighbours: B, C, D, F, G, H
#define TTC_CTI_neighbours_sectorF [2, 4, 7]			// Index: 5		// Neighbours: C, E, H
#define TTC_CTI_neighbours_sectorG [3, 4, 7, 8]			// Index: 6		// Neighbours: D, E, H, I
#define TTC_CTI_neighbours_sectorH [4, 5, 6, 8]			// Index: 7		// Neighbours: E, F, G, I
#define TTC_CTI_neighbours_sectorI [6, 7, resistance]	// Index: 8		// Neighbours: G, H, Base guer
