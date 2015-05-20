/*
	Defines the neighbours for all sectors, according to the following concept:
	https://cloud.githubusercontent.com/assets/11304010/7549441/d7ba052a-f634-11e4-80b5-5357583e83c2.png

	- The numbers for the neighbours represent the index in the TTC_CTI_sectorDefinitions array.
	- The side is used to represent the base a team.

	Created by Lux0r
*/


#define TTC_CTI_sectorPattern "9 sectors pattern"

#define TTC_CTI_neighbours_sectorA [west, 1, 2]			// Index: 0
#define TTC_CTI_neighbours_sectorB [0, 3, 4]			// Index: 1
#define TTC_CTI_neighbours_sectorC [0, 4, 5]			// Index: 2
#define TTC_CTI_neighbours_sectorD [1, 4, 6]			// Index: 3
#define TTC_CTI_neighbours_sectorE [1, 2, 3, 5, 6, 7]	// Index: 4
#define TTC_CTI_neighbours_sectorF [2, 4, 7]			// Index: 5
#define TTC_CTI_neighbours_sectorG [3, 4, 8]			// Index: 6
#define TTC_CTI_neighbours_sectorH [4, 5, 8]			// Index: 7
#define TTC_CTI_neighbours_sectorI [6, 7, resistance]	// Index: 8
