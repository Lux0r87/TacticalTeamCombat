/*
	Returns the prefix for the given side.

	Created by Lux0r
*/

private ["_side", "_prefix"];

_side	= [_this, 0] call BIS_fnc_param;


_prefix = switch (_side) do {
	case west: {
		"B";	
	};
	case east: {
		"O";	
	};
	case resistance: {
		"I";	
	};
	default {
		"";	
	};
};

_prefix