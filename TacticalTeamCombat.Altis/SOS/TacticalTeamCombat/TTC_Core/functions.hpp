class TTC_Core_Functions {
	tag = "TTC_CORE";

	class Common {
		file = "SOS\TacticalTeamCombat\TTC_Core\Functions\Common";
		class addToBlacklist{};
		class addWaypoint{};
		class createTrigger{};
		class endMission{};
		class endMissionAll{};
		class getLocation{};
		class getMrkTypePrefix{};
		class getPrefix{};
		class getRoleNameById{};
		class getSectorPattern{};
		class handleFatigue{};
		class hint{};
		class log{};
		class runTimer{};
		class speedLimit{};
		class systemChat{};
		class taskPatrol{};
	};

	class Init {
		file = "SOS\TacticalTeamCombat\TTC_Core\Functions\Init";
		class initPlayer{};
		class initUnit{};
		class initRoles{preInit = 1;};
	};

	class Markers {
		file = "SOS\TacticalTeamCombat\TTC_Core\Functions\Markers";
		class createMarker{};
		class createMarkerLocal{};
		class setMarkerAlphaLocal{};
	};

	class Nametags {
		file = "SOS\TacticalTeamCombat\TTC_Core\Functions\Nametags";
		class draw3D{};
		class initNametags{};
		class keyDown{};
	};
};