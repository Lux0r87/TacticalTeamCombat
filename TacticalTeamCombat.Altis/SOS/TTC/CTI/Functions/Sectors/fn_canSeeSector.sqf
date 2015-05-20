/*
	Check if the sector can be seen by the given side.
	Therefore the team must control either the sector itself, or at least one neighbour sector.

	Created by Lux0r
*/


#include "sectorVariables.inc"

private ["_sector","_side","_sectorSide","_neighbours","_canSee","_neighbourSide"];

_sector		= [_this, 0] call BIS_fnc_param;
_side		= [_this, 1, sideUnknown, [sideUnknown]] call BIS_fnc_param;
_sectorSide	= [_this, 2, TTC_CTI_sectorVariable_side(_sector), [sideUnknown]] call BIS_fnc_param;

_neighbours	= TTC_CTI_sectorVariable_neighbours(_sector);
_canSee		= false;

//[_sector, "TTC_CTI_fnc_canSeeSector", [["_side = %1", _side]]] call TTC_CTI_fnc_logSector;


// Return true, if the side already controls the sector or one of the neighbours is their base.
if ((_side == _sectorSide) || (_side in _neighbours)) exitWith {
	true
};

// Iterate over all neighbours
{
	scopeName "searchLoop";

	// Must be a trigger object, representing the sector. Skip the bases (sides).
	if (typeName _x == "OBJECT") then {
		_neighbourSide = _x getVariable "TTC_CTI_sector_side";

		// Cancel searching, if the neighbour sector belong to the same side.
		if (_side == _neighbourSide) then {
			_canSee = true;
			breakOut "searchLoop"
		};
	};
} forEach _neighbours;

_canSee
