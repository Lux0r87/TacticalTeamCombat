class TTC_CTI_Functions {
	tag = "TTC_CTI";

	class Init {
		file = "SOS\TTC\CTI";
		class init{};
	};

	class EventHandler {
		file = "SOS\TTC\CTI\Functions\EventHandler";
		class killed{};
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
		class drawSectorConnections{};
		class getInMobileSector{};
		class getSectorText{};
		class getTaskDescription{};
		class getTaskState{};
		class initSectorConnections{};
		class initSectors{};
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

	class Spawn {
		file = "SOS\TTC\CTI\Functions\Spawn";
		class spawnBagBunker {};
		class spawnOutpost {};
		class spawnStation {};
	};
};