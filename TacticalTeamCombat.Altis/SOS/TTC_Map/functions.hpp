class TTC_Map {

	tag = "TTC_MAP";

	class Bases {
		file = "SOS\TTC_Map\Bases";
	};
	
	class Sectors {
		file = "SOS\TTC_Map\Sectors";
	};

	class Units {
		file = "SOS\TTC_Map\Units";
		class showMarkerForUnits{};
		class updateMarker_Infantry{};
		class updateMarker_Vehicle{};
	};
};