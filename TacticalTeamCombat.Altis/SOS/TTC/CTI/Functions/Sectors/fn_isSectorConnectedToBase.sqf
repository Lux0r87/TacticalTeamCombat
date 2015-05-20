/*
	Recursive function to check if the given sector is connected with the corresponding base.

	Created by Lux0r
*/


#include "sectorVariables.inc"

private ["_sector","_blacklist","_sectorSide","_neighbours","_return","_neighbourSide"];

_sector		= [_this, 0] call BIS_fnc_param;
_blacklist	= [_this, 1, [], [[]]] call BIS_fnc_param;
_sectorSide	= [_this, 2, TTC_CTI_sectorVariable_side(_sector), [sideUnknown]] call BIS_fnc_param;

_neighbours	= TTC_CTI_sectorVariable_neighbours(_sector);

/*[_sector, "TTC_CTI_fnc_isSectorConnectedTobase",
	[["_blacklist = %1", _blacklist], ["_sectorSide = %1", _sectorSide], ["_neighbours = %1", _neighbours]]
] call TTC_CTI_fnc_logSector;*/


// Add sector to blacklist.
_blacklist pushBack _sector;

_return = [false, _blacklist];

// Return true, if one of the neighbours is the base of this side.
if (_sectorSide in _neighbours) exitWith {
	[true, _blacklist]
};

// Iterate over all neighbours
{
	scopeName "searchLoop";

	// Must be a trigger object, representing the sector. Skip the bases (sides) and already checked sectors.
	if ((typeName _x == "OBJECT") && !(_x in _blacklist)) then {
		_neighbourSide	= _x getVariable "TTC_CTI_sector_side";

		// Check if the neighbour sector belong to the same side.
		if (_sectorSide == _neighbourSide) then {
			_return = [_x, _blacklist, _sectorSide] call TTC_CTI_fnc_isSectorConnectedToBase;
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
