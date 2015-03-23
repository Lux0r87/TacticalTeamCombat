/*
	This script searches all bases and return an array with the positions.

	Created by Lux0r
*/


private ["_positions","_mrkPos"];

_positions	= [];


// Find all base markers and add them to the positions array.
{
	_mrkPos	= getMarkerpos format["Base_%1", _x];

	if (format ["%1", _mrkPos] != "[0,0,0]") then {
		_positions pushBack _mrkPos;
	};
} forEach [west, east, resistance];

// Return positions array
_positions