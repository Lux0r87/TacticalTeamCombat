class TTC_Core_Functions {
	tag = "TTC_CORE";

	class Common {
		file = "SOS\TacticalTeamCombat\TTC_Core\Functions\Common";
		class createTrigger{};
		class getLocation{};
		class getPrefix{};
		class hint{};
		class log{};
		class runTimer{};
		class systemChat{};
	};

	class Init {
		file = "SOS\TacticalTeamCombat\TTC_Core\Functions\Init";
		class initAmmoBox{};			// Lux0r: update call for this fnc: new prefix "TTC_CORE"
		class initVehicleSpawn {};		// Lux0r: update call for this fnc: new prefix "TTC_CORE"
		class initHelicopterSpawn {};	// Lux0r: update call for this fnc: new prefix "TTC_CORE"
	};

	class Markers {
		file = "SOS\TacticalTeamCombat\TTC_Core\Functions\Markers";
		class createMarker{};
		class createMarkerLocal{};
		class setMarkerAlphaLocal{};
	};

	class Spawn {
		file = "SOS\TacticalTeamCombat\TTC_Core\Functions\Spawn";
		class spawnBase {};
	};
};