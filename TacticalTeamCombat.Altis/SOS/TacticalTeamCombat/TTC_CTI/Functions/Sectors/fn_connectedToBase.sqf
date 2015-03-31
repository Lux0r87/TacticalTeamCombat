/*
	Recursive function to check if the given sector is connected with the corresponding base.

	Created by Lux0r
*/


#include "sectorVariables.hpp"

private ["_sector","_blacklist","_sectorSide","_sectorID","_neighbours","_base","_return","_neighbour","_neighbourSide"];

_sector		= [_this, 0] call BIS_fnc_param;
_blacklist	= [_this, 1, [], [[]]] call BIS_fnc_param;
_sectorSide	= [_this, 2, (_sector select TTC_CTI_sector_side), [east]] call BIS_fnc_param;
_sectorID	= [_this, 3, -100, [0]] call BIS_fnc_param;

_neighbours	= _sector select TTC_CTI_sector_neighbours;


// Get sectorID if undefined.
if (_sectorID == -100) then {
	_sectorID = ([TTC_CTI_sectors, _sector] call BIS_fnc_arrayFindDeep) select 0;
};

// Add sectorID to blacklist.
_blacklist pushBack _sectorID;

_base		= format["base%1", _sectorSide];
_return		= [false, _blacklist];

// Return true, if one of the neighbours is the base of this side.
if (_base in _neighbours) exitWith {
	[true, _blacklist]
};

// Iterate over all neighbours
{
	scopeName "searchLoop";

	// Skip bases (strings) and already checked sectors
	if ((typeName _x == "SCALAR") && !(_x in _blacklist)) then {
		_neighbour		= TTC_CTI_sectors select _x;
		_neighbourSide	= _neighbour select TTC_CTI_sector_side;

		// Check if the neighbour sector belong to the same side.
		if (_sectorSide == _neighbourSide) then {
			_return = [_neighbour, _blacklist, _sectorSide, _x] call TTC_CTI_fnc_connectedToBase;
			_connected	= _return select 0;
			_blacklist	= _return select 1;

			// Cancel searching, if sub-routine found connection to the base.
			if (_connected) then {
				breakOut "searchLoop"
			};
		} else {
			_blacklist pushBack _x;
		};
	};
} forEach _neighbours;

_return