/*
	This function checks, if one side controls all sectors with 100% dominance.

	Return:
	The side, which controls all sectors. Otherwise sideUnknown.

	Created by Lux0r
*/


#include "dominanceVariables.inc"
#include "sectorVariables.inc"

private ["_side","_sectorSide","_dominance"];

_side = sideUnknown;


// Iterate over all sectors
{
	scopeName "searchLoop";

	_sectorSide = TTC_CTI_sectorVariable_side(_x);
	_dominance	= TTC_CTI_sectorVariable_dominance(_x);

	// Cancel searching, if the sector is not controlled by the same side or the dominance is not at maximum.
	if ((_side != sideUnknown && {_side != _sectorSide}) || (_dominance < TTC_CTI_dominanceMax)) then {
		_side = sideUnknown;
		breakOut "searchLoop"
	} else {
		_side = _sectorSide;
	};
} forEach TTC_CTI_sectors;

_side
