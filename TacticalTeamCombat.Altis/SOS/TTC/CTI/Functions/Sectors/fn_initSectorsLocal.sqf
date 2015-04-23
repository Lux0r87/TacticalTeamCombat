/*
	Created by Lux0r
*/

#include "dominanceVariables.hpp"

private ["_unit","_side","_visibility","_find","_canSee","_mrkArea","_mrk"];

_unit	= [_this, 0] call BIS_fnc_param;
_side	= side _unit;

/*[
	["Function: %1", "TTC_CTI_fnc_initSectorsLocal"], ["_unit = %1", _unit], ["_side = %1", _side]
] call TTC_CORE_fnc_log;*/


// Safety measure: Wait until the initialization of the sectors is done.
waitUntil {TTC_CTI_initDone};

{
	_visibility	= _x getVariable "TTC_CTI_sector_visibility";
	_find = ([TTC_CTI_Sides, _side] call BIS_fnc_arrayFindDeep) select 0;
	_canSee = _visibility select _find;

	if (_canSee) then {
		// Update the sector markers.
		[_x, TTC_CTI_dominanceMax] call TTC_CTI_fnc_updateSectorMarkersLocal;

		// Create task
		[_unit, _x] call TTC_CTI_fnc_createSimpleTask;
	} else {
		// Hide the sector markers.
		_mrkArea	= _x getVariable "TTC_CTI_sector_markerArea";
		_mrk		= _x getVariable "TTC_CTI_sector_marker";
		_mrkArea setMarkerAlphaLocal 0;
		_mrk setMarkerAlphaLocal 0;
	};
} forEach TTC_CTI_sectors;