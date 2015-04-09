/*
	Check if the sector can be captured by the given side.
	Therefore the team must control at least one neighbour sector, which is connected to the base.

	Created by Lux0r
*/


#include "sectorVariables.hpp"

private ["_sector","_side","_neighbours","_canCapture","_base","_neighbour","_neighbourSide","_return","_connected"];

_sector	= [_this, 0] call BIS_fnc_param;
_side	= [_this, 1, east, [east]] call BIS_fnc_param;

_neighbours	= _sector select TTC_CTI_sector_neighbours;
_canCapture	= false;
_base		= format["base%1", _side];

/*[
	["TTC_CTI: canCaptureSector:"], ["_sector = %1", _sector], ["_side = %1", _side], ["_neighbours = %1", _neighbours], ["_base = %1", _base]
] call TTC_CORE_fnc_log;*/


// Return true, if one of the neighbours is the base of this side.
if (_base in _neighbours) exitWith {
	true
};

// Iterate over all neighbours
{
	scopeName "searchLoop";

	// Skip bases (strings).
	if (typeName _x == "SCALAR") then {
		_neighbour		= TTC_CTI_sectors select _x;
		_neighbourSide	= _neighbour select TTC_CTI_sector_side;

		// Check if the given side controls this neighbour sector.
		if (_side == _neighbourSide) then {
			_return = [_neighbour] call TTC_CTI_fnc_isSectorConnectedToBase;
			_connected	= _return select 0;

			// The sector can be captured, if the neighbour sector is connected with the base.
			if (_connected) exitWith {
				_canCapture = true;
				breakOut "searchLoop"
			};
		};
	};
} forEach _neighbours;

_canCapture