/*
	Returns the roles name of the role with the given id.

	Created by BauerMitFackel
*/

private["_roleName"];

_roleName = switch (_this) do {
	// Platoon Lead
	case PLATOON_LEADER_ID: {
		PLATOON_LEADER_NAME;
	};
	// Archer / Knight
	case TEAM_LEADER_ID: {
		TEAM_LEADER_NAME;
	};
	case MACHINE_GUNNER_ID: {
		MACHINE_GUNNER_NAME;
	};
	case COMBAT_ENGINEER_ID: {
		COMBAT_ENGINEER_NAME;
	};
	case MISSILE_SPECIALIST_ID: {
		MISSILE_SPECIALIST_NAME;
	};
	case MEDIC_ID: {
		MEDIC_NAME;
	};
	// Recon
	case SCOUT_ID: {
		SCOUT_NAME;
	};
	case MARKSMAN_ID: {
		MARKSMAN_NAME;
	};
	case PARAMEDIC_ID: {
		PARAMEDIC_NAME;
	};
	// Pilots
	case PILOT_ID: {
		PILOT_NAME;
	};
	default {
		"";
	};
};

_roleName;