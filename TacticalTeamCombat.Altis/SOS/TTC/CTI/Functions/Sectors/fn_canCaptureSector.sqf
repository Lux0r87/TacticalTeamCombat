/*
	Check if the sector can be captured by the given side.
	Therefore the team must control at least one neighbour sector, which is connected to the base.

	Created by Lux0r
*/


#include "sectorVariables.hpp"

private ["_sector","_side","_neighbours","_canCapture","_base","_neighbourSide","_connected"];

_sector	= [_this, 0] call BIS_fnc_param;
_side	= [_this, 1, sideUnknown, [sideUnknown]] call BIS_fnc_param;

_neighbours	= TTC_CTI_sectorVariable_neighbours;
_canCapture	= false;
_base		= format["base%1", _side];

//[_sector, "TTC_CTI_fnc_canCaptureSector", [["_side = %1", _side], ["_neighbours = %1", _neighbours], ["_base = %1", _base]]] call TTC_CTI_fnc_logSector;


// Return true, if one of the neighbours is the base of this side.
if (_base in _neighbours) exitWith {
	true
};

// Iterate over all neighbours
{
	scopeName "searchLoop";
	_sector = _x;

	// Skip bases (strings).
	if (typeName _sector != "STRING") then {
		_neighbourSide	= TTC_CTI_sectorVariable_side;

		// Check if the given side controls this neighbour sector.
		if (_side == _neighbourSide) then {
			_connected = TTC_CTI_sectorVariable_isConnectedToBase;

			// The sector can be captured, if the neighbour sector is connected with the base.
			if (_connected) exitWith {
				_canCapture = true;
				breakOut "searchLoop"
			};
		};
	};
} forEach _neighbours;

_canCapture