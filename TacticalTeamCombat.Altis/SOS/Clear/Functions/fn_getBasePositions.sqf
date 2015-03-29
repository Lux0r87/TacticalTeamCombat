/*
	This script searches all bases and return an array with the positions.

	Created by Lux0r
*/


private ["_positions","_basePos"];

_positions	= [];


// Find all base markers and add them to the positions array.
{
	_basePos	= missionNamespace getVariable [format["TTC_BASE_%1", _x], [0,0]];

	if (format ["%1", _basePos] != "[0,0]") then {
		_positions pushBack _basePos;
	};
} forEach [west, east, resistance];

// Return positions array
_positions