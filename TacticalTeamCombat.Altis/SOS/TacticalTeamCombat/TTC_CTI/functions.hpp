class TTC_CTI_Functions {
	tag = "TTC_CTI";

	class Init {
		file = "SOS\TacticalTeamCombat\TTC_CTI";
		class initCTI{};
	};

	class Markers {
		file = "SOS\TacticalTeamCombat\TTC_CTI\Functions\Markers";
		class createSectorAreaMarker{};
		class createSectorMarker{};
		class updateSectorMarkers{};
		class updateSectorMarkersLocal{};
	};

	class Sectors {
		file = "SOS\TacticalTeamCombat\TTC_CTI\Functions\Sectors";
		class addRespawnPositions{};
		class canCaptureSector{};
		class canSeeSector{};
		class createMobileSector{};
		class createSectorDisplay{};
		class createSectorPatrol{};
		class getInMobileSector{};
		class isSectorConnectedToBase{};
		class mobileSectorIsMoving{};
		class sideCapturedAllSectors{};
		class updateDominance{};
		class updateSectors{};
	};
};