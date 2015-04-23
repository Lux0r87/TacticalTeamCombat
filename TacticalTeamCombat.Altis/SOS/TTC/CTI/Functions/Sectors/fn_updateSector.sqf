/*
	Created by Lux0r
*/


#include "sectorVariables.hpp"

private ["_sector","_recalculate","_target","_mrkArea","_mrk","_visibility","_pos","_isNull","_sides","_find","_canSee"];

_sector			= [_this, 0] call BIS_fnc_param;
_recalculate	= [_this, 1, false, [false]] call BIS_fnc_param;		// Recalculate "canSee", otherwise use stored value.
_target			= [_this, 2, ObjNull, [ObjNull]] call BIS_fnc_param;

_mrkArea	= TTC_CTI_sectorVariable_markerArea;
_mrk		= TTC_CTI_sectorVariable_marker;
_visibility	= TTC_CTI_sectorVariable_visibility;
_pos		= getPos _sector;

_isNull		= isNull _target;
_sides		= if (!_isNull) then {[side _target]} else {TTC_CTI_Sides};

/*[_sector, "TTC_CTI_fnc_updateSector",
	[["_recalculate = %1", _recalculate], ["_target = %1", _target], ["_visibility = %1", _visibility], ["_isNull = %1", _isNull], ["_sides = %1", _sides]]
] call TTC_CTI_fnc_logSector;*/


_mrkArea setMarkerPos _pos;
_mrk setMarkerPos _pos;

{
	if (_isNull) then {
		_target = _x;
	};

	_find = ([TTC_CTI_Sides, _x] call BIS_fnc_arrayFindDeep) select 0;

	if (_recalculate) then {
		_canSee = [_sector, _x] call TTC_CTI_fnc_canSeeSector;
		_visibility set [_find, _canSee];
		_sector setVariable ["TTC_CTI_sector_visibility", _visibility];
	} else {
		_canSee = _visibility select _find;
	};

	[[_sector, _canSee, _mrkArea, _mrk], "TTC_CTI_fnc_updateSectorLocal", _target, false] call BIS_fnc_MP;
} forEach _sides;