/*
	Defines the neighbours for all sectors, according to the following concept:

	- The numbers for the neighbours represent the index in the TTC_CTI_sectors array.
	- A string is used for each base: "base" + <side>, e.g.: "baseWEST"

	Created by Lux0r
*/


#define TTC_CTI_sectorPattern "7 sectors pattern"

#define TTC_CTI_neighbours_sectorA ["baseWEST", 1, 2]	// Index: 0
#define TTC_CTI_neighbours_sectorB [0, 3, 4]			// Index: 1
#define TTC_CTI_neighbours_sectorC [0, 3, 5]			// Index: 2
#define TTC_CTI_neighbours_sectorD [1, 2, 4, 5]			// Index: 3
#define TTC_CTI_neighbours_sectorE [1, 3, 6]			// Index: 4
#define TTC_CTI_neighbours_sectorF [2, 3, 6]			// Index: 5
#define TTC_CTI_neighbours_sectorG [4, 5, "baseGUER"]	// Index: 6