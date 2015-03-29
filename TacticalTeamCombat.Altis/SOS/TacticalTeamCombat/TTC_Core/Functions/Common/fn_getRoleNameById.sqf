/*
	Returns the roles name of the role with the given id.
	Created by BauerMitFackel
*/

private["_roleName"];

_roleName = switch (_this) do {
	case COMBAT_ENGINEER_ID: {
		COMBAT_ENGINEER_NAME;
	};
	case MACHINE_GUNNER_ID: {
		MACHINE_GUNNER_NAME;
	};
	case MEDIC_ID: {
		MEDIC_NAME;
	};
	case MISSILE_SPECIALIST_ID: {
		MISSILE_SPECIALIST_NAME;
	};
	case MARKSMAN_ID: {
		MARKSMAN_NAME;
	};
	case PARAMEDIC_ID: {
		PARAMEDIC_NAME;
	};
	case PILOT_ID: {
		PILOT_NAME;
	};
	case PLATOON_LEADER_ID: {
		PLATOON_LEADER_NAME;
	};
	case SCOUT_ID: {
		SCOUT_NAME;
	};
	case TEAM_LEADER_ID: {
		TEAM_LEADER_NAME;
	};
};

_roleName;