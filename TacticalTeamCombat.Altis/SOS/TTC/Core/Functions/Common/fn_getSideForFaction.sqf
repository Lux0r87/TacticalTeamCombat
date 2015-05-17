/*
	Returns the side for the given faction.

	Created by Lux0r
*/


private["_faction", "_side"];

_faction = [_this, 0] call BIS_fnc_param;


_side = switch (_faction) do {
	case "BLU_F";
	case "BLU_G_F": {
		west;
	};
	case "OPF_F";
	case "OPF_G_F": {
		east;
	};
	case "IND_F";
	case "IND_G_F": {
		resistance;
	};
	default {
		sideUnknown;
	};
};

_side
