class TTC_CTI_Functions {
	tag = "TTC_CTI";

	class Init {
		file = "SOS\TTC\CTI";
		class init{};
	};

	class Markers {
		file = "SOS\TTC\CTI\Functions\Markers";
		class createSectorAreaMarker{};
		class createSectorMarker{};
		class updateSectorMarkersLocal{};
	};

	class Sectors {
		file = "SOS\TTC\CTI\Functions\Sectors";
		class addRespawnPositions{};
		class canCaptureSector{};
		class canSeeSector{};
		class createMobileSector{};
		class createSectorDisplay{};
		class createSectorPatrol{};
		class createSectors{};
		class createSimpleTask{};
		class getInMobileSector{};
		class getSectorText{};
		class getTaskDescription{};
		class getTaskState{};
		class initSectorsLocal{};
		class isSectorConnectedToBase{};
		class logSector{};
		class mobileSectorIsMoving{};
		class sideCapturedAllSectors{};
		class updateDominance{};
		class updateSector{};
		class updateSectorLocal{};
		class updateSectors{};
	};
};