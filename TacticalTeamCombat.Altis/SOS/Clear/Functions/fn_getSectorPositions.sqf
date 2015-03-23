/*
	This script searches all sector controls and return an array with the positions.

	Created by Lux0r
*/


private ["_positions","_sectors","_sectorPos"];

_positions	= [];


// Find all sectors and add them to the positions array.
waitUntil {time > 0.0};
_sectors = [true] call BIS_fnc_moduleSector;

{
	_sectorPos	= getPos _x;

	if (format ["%1", _sectorPos] != "[0,0,0]") then {
		_positions pushBack _sectorPos;
	};
} forEach _sectors;

// Return positions array
_positions