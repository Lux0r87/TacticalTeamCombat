class TTC_Core_Functions {
	tag = "TTC_CORE";

	class Actions {
		file = "SOS\TTC\Core\Functions\Actions";
		class addAction_lock{};
		class addAction_unlock{};
	};

	class Common {
		file = "SOS\TTC\Core\Functions\Common";
		class addToBlacklist{};
		class addWaypoint{};
		class attachObjectsTo{};
		class clearAmmoBox{};
		class clearVehicleWrecks{};
		class createAmmoBox{};
		class createSimpleTask{};
		class createTrigger{};
		class createVehicle{};
		class createZoneProtection{};
		class endMission{};
		class findControls{};
		class endMissionAll{};
		class getAmmoBoxType{};
		class getBasePositions{};
		class getFlagForSide{};
		class getLocation{};
		class getMrkTypePrefix{};
		class getPrefix{};
		class getRoleNameById{};
		class getSectorPattern{};
		class getSideForFaction{};
		class handleFatigue{};
		class hint{};
		class lock{};
		class log{};
		class runTimer{};
		class setFlagTexture{};
		class setTriggerOptions{};
		class setVelocity{};
		class showTimerDisplay{};
		class showWelcomeMessage{};
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
		class spawnBunkerSmall {};
		class spawnHelicopter {};
		class spawnVehicle {};
	};

	class Vectors {
		file = "SOS\TTC\Core\Functions\Vectors";
		class getOrthogonalVector {};
		class getOrthogonalVectorSimplified {};
	};
};