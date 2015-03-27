/*
	Defines the neighbours of all sectors for the following concept:
	https://cloud.githubusercontent.com/assets/11304010/6790532/8435d574-d1a8-11e4-840e-be4ac179693c.jpg

	- The numbers for the neighbours represent the index in the TTC_CTI_sectors array.
	- A string is used for each base: "base" + <side>, e.g.: "baseWEST"

	Created by Lux0r
*/


#define TTC_CTI_sectorPattern "9 sectors pattern (default)"

#define TTC_CTI_neighbours_sector1 ["baseWEST", 1, 2]
#define TTC_CTI_neighbours_sector2 [0, 3, 4]
#define TTC_CTI_neighbours_sector3 [0, 4, 5]
#define TTC_CTI_neighbours_sector4 [1, 4, 6]
#define TTC_CTI_neighbours_sector5 [1, 2, 3, 5, 6, 7]
#define TTC_CTI_neighbours_sector6 [2, 4, 7]
#define TTC_CTI_neighbours_sector7 [3, 4, 8]
#define TTC_CTI_neighbours_sector8 [4, 5, 8]
#define TTC_CTI_neighbours_sector9 [6, 7, "baseGUER"]