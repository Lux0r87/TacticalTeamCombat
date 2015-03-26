class TTC_SectorControl_Functions {
	tag = "TTC_SC";

	class Init {
		file = "SOS\TacticalTeamCombat\TTC_SectorControl";
		class initSectorControl{};
	};

	class Markers {
		file = "SOS\TacticalTeamCombat\TTC_SectorControl\Functions\Markers";
		class createSectorAreaMarker{};
		class createSectorMarker{};
		class updateSectorMarkers{};
	};

	class Sectors {
		file = "SOS\TacticalTeamCombat\TTC_SectorControl\Functions\Sectors";
		class updateDominance{};
	};
};