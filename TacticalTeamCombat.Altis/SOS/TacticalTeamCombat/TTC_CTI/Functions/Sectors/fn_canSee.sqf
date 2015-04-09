/*
	Check if the sector can be seen by the given side.
	Therefore the team must control either the sector itself, or at least one neighbour sector.

	Created by Lux0r
*/


#include "sectorVariables.hpp"

private ["_sector","_side","_sectorSide","_neighbours","_canSee","_base","_neighbour","_neighbourSide"];

_sector		= [_this, 0] call BIS_fnc_param;
_side		= [_this, 1, east, [east]] call BIS_fnc_param;
_sectorSide	= [_this, 2, (_sector select TTC_CTI_sector_side), [east]] call BIS_fnc_param;

_neighbours	= _sector select TTC_CTI_sector_neighbours;
_canSee		= false;
_base		= format["base%1", _side];

/*[
	["TTC_CTI: canSee:"], ["_sector = %1", _sector], ["_side = %1", _side], ["_sectorSide = %1", _sectorSide], ["_neighbours = %1", _neighbours],
	["_canSee = %1", _canSee], ["_base = %1", _base]
] call TTC_CORE_fnc_log;*/


// Return true, if the side already controls the sector or one of the neighbours is their base.
if ((_side == _sectorSide) || (_base in _neighbours)) exitWith {
	true
};

// Iterate over all neighbours
{
	scopeName "searchLoop";

	// Skip bases (strings).
	if (typeName _x == "SCALAR") then {
		_neighbour		= TTC_CTI_sectors select _x;
		_neighbourSide	= _neighbour select TTC_CTI_sector_side;

		// Cancel searching, if the neighbour sector belong to the same side.
		if (_side == _neighbourSide) then {
			_canSee = true;
			breakOut "searchLoop"
		};
	};
} forEach _neighbours;

_canSee