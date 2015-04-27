/*
	Returns a string for the given side, used for the ammo box type.

	Created by Lux0r
*/

private ["_side", "_type"];

_side	= [_this, 0] call BIS_fnc_param;


_type = switch (_side) do {
	case west: {
		"NATO";	
	};
	case east: {
		"East";	
	};
	case resistance: {
		"IND";	
	};
	default {
		"";	
	};
};

_type