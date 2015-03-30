/*
	Defines the neighbours for all sectors, according to the following concept:
	https://cloud.githubusercontent.com/assets/11304010/6850334/d47d7bea-d3d8-11e4-8bf8-be4ce7c07343.png

	- The numbers for the neighbours represent the index in the TTC_CTI_sectors array.
	- A string is used for each base: "base" + <side>, e.g.: "baseWEST"

	Created by Lux0r
*/


#define TTC_CTI_sectorPattern "9 sectors pattern"

#define TTC_CTI_neighbours_sectorA ["baseWEST", 1, 2]	// Index: 0
#define TTC_CTI_neighbours_sectorB [0, 3, 4]			// Index: 1
#define TTC_CTI_neighbours_sectorC [0, 4, 5]			// Index: 2
#define TTC_CTI_neighbours_sectorD [1, 4, 6]			// Index: 3
#define TTC_CTI_neighbours_sectorE [1, 2, 3, 5, 6, 7]	// Index: 4
#define TTC_CTI_neighbours_sectorF [2, 4, 7]			// Index: 5
#define TTC_CTI_neighbours_sectorG [3, 4, 8]			// Index: 6
#define TTC_CTI_neighbours_sectorH [4, 5, 8]			// Index: 7
#define TTC_CTI_neighbours_sectorI [6, 7, "baseGUER"]	// Index: 8