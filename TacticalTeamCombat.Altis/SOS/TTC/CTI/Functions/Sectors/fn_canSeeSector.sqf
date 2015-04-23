/*
	Check if the sector can be seen by the given side.
	Therefore the team must control either the sector itself, or at least one neighbour sector.

	Created by Lux0r
*/


#include "sectorVariables.hpp"

private ["_sector","_side","_sectorSide","_neighbours","_canSee","_base","_neighbourSide"];

_sector		= [_this, 0] call BIS_fnc_param;
_side		= [_this, 1, sideUnknown, [sideUnknown]] call BIS_fnc_param;
_sectorSide	= [_this, 2, TTC_CTI_sectorVariable_side, [sideUnknown]] call BIS_fnc_param;

_neighbours	= TTC_CTI_sectorVariable_neighbours;
_canSee		= false;
_base		= format["base%1", _side];

//[_sector, "TTC_CTI_fnc_canSeeSector", [["_side = %1", _side], ["_base = %1", _base]]] call TTC_CTI_fnc_logSector;


// Return true, if the side already controls the sector or one of the neighbours is their base.
if ((_side == _sectorSide) || (_base in _neighbours)) exitWith {
	true
};

// Iterate over all neighbours
{
	scopeName "searchLoop";

	// Skip bases (strings).
	if (typeName _x != "STRING") then {
		_neighbourSide = _x getVariable "TTC_CTI_sector_side";

		// Cancel searching, if the neighbour sector belong to the same side.
		if (_side == _neighbourSide) then {
			_canSee = true;
			breakOut "searchLoop"
		};
	};
} forEach _neighbours;

_canSee