/*
	Check if the sector can be captured by the given side.
	Therefore the team must control at least one neighbour sector, which is connected to the base.

	Created by Lux0r
*/


#include "sectorVariables.inc"

private ["_sector","_side","_neighbours","_canCapture","_neighbourSide","_connected"];

_sector	= [_this, 0] call BIS_fnc_param;
_side	= [_this, 1, sideUnknown, [sideUnknown]] call BIS_fnc_param;

_neighbours	= TTC_CTI_sectorVariable_neighbours(_sector);
_canCapture	= false;

//[_sector, "TTC_CTI_fnc_canCaptureSector", [["_side = %1", _side], ["_neighbours = %1", _neighbours]]] call TTC_CTI_fnc_logSector;


// Return true, if one of the neighbours is the base of this side.
if (_side in _neighbours) exitWith {
	true
};

// Iterate over all neighbours
{
	scopeName "searchLoop";

	// Must be a trigger object, representing the sector. Skip the bases (sides).
	if (typeName _x == "OBJECT") then {
		_neighbourSide	= TTC_CTI_sectorVariable_side(_x);

		// Check if the given side controls this neighbour sector.
		if (_side == _neighbourSide) then {
			_connected = TTC_CTI_sectorVariable_isConnectedToBase(_x);

			// The sector can be captured, if the neighbour sector is connected with the base.
			if (_connected) exitWith {
				_canCapture = true;
				breakOut "searchLoop"
			};
		};
	};
} forEach _neighbours;

_canCapture
