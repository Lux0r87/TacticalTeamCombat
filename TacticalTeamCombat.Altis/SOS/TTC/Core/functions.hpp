class TTC_Core_Functions {
	tag = "TTC_CORE";

	class Common {
		file = "SOS\TTC\Core\Functions\Common";
		class addToBlacklist{};
		class addWaypoint{};
		class clearAmmoBox{};
		class createSimpleTask{};
		class createTrigger{};
		class endMission{};
		class endMissionAll{};
		class getAmmoBoxType{};
		class getLocation{};
		class getMrkTypePrefix{};
		class getPrefix{};
		class getRoleNameById{};
		class getSectorPattern{};
		class handleFatigue{};
		class hint{};
		class log{};
		class runTimer{};
		class setTriggerOptions{};
		class speedLimit{};
		class systemChat{};
		class taskPatrol{};
	};

	class EventHandler {
		file = "SOS\TTC\Core\Functions\EventHandler";
		class inventoryOpened{};
	};

	class Init {
		file = "SOS\TTC\Core\Functions\Init";
		class initUnit{};
		class initRoles{preInit = 1;};
	};

	class Markers {
		file = "SOS\TTC\Core\Functions\Markers";
		class createMarker{};
		class createMarkerLocal{};
		class setMarkerAlphaLocal{};
	};

	class Nametags {
		file = "SOS\TTC\Core\Functions\Nametags";
		class draw3D{};
		class initNametags{};
		class keyDown{};
	};

	class Respawn {
		file = "SOS\TTC\Core\Functions\Respawn";
		class addRespawnInventory{};
	};

	class Spawn {
		file = "SOS\TTC\Core\Functions\Spawn";
		class spawnHelicopter {};
		class spawnVehicle {};
	};
};