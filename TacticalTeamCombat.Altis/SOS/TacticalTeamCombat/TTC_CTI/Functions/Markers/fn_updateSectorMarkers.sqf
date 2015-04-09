/*
	Created by Lux0r
*/


#include "sectorVariables.hpp"

// Don't add "_sector" to private variables. This function modifies the original variable.
private ["_dominanceMax","_recalculate","_target","_pos","_mrkArea","_mrk","_visibility","_isNull","_sides","_find","_canSee"];

_sector			= [_this, 0] call BIS_fnc_param;
_dominanceMax	= [_this, 1, 100, [0]] call BIS_fnc_param;
_recalculate	= [_this, 2, false, [false]] call BIS_fnc_param;		// Recalculate "canSee", otherwise use stored value.
_target			= [_this, 3, ObjNull, [ObjNull]] call BIS_fnc_param;

_pos		= _sector select TTC_CTI_sector_position;
_mrkArea	= _sector select TTC_CTI_sector_markerArea;
_mrk		= _sector select TTC_CTI_sector_marker;
_visibility	= _sector select TTC_CTI_sector_visibility;

_isNull		= isNull _target;
_sides		= if (!_isNull) then {[side _target]} else {TTC_CTI_Sides};

/*[
	["TTC_CTI: updateSectorMarkers:"], ["_sector = %1", _sector], ["_dominanceMax = %1", _dominanceMax], ["_recalculate = %1", _recalculate], ["_target = %1", _target],
	["_mrkArea = %1", _mrkArea], ["_mrk = %1", _mrk], ["_visibility = %1", _visibility], ["_isNull = %1", _isNull], ["_sides = %1", _sides]
] call TTC_CORE_fnc_log;*/

_mrkArea setMarkerPos _pos;
_mrk setMarkerPos _pos;

{
	if (_isNull) then {
		_target = _x;
	};

	_find = ([TTC_CTI_Sides, _x] call BIS_fnc_arrayFindDeep) select 0;

	if (_recalculate) then {
		_canSee = [_sector, _x] call TTC_CTI_fnc_canSee;
		_visibility set [_find, _canSee];
		_sector set [TTC_CTI_sector_visibility, _visibility];
	} else {
		_canSee = _visibility select _find;
	};

	if (_canSee) then {
		[[_sector, _dominanceMax], "TTC_CTI_fnc_updateSectorMarkersLocal", _target, false] call BIS_fnc_MP;
	} else {
		// Hide the sector markers for this side.
		[[_mrkArea, 0], "TTC_CORE_fnc_setMarkerAlphaLocal", _target, false] call BIS_fnc_MP;
		[[_mrk, 0], "TTC_CORE_fnc_setMarkerAlphaLocal", _target, false] call BIS_fnc_MP;
	};
} forEach _sides;