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
		class canCapture{};
		class canSee{};
		class connectedToBase{};
		class createSectorPatrol{};
		class sideCapturedAllSectors{};
		class updateDominance{};
		class updateSectors{};
	};
};