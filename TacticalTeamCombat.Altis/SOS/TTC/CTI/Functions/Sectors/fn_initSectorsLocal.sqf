/*
	Created by Lux0r
*/

#include "dominanceVariables.hpp"
#include "sectorVariables.hpp"

private ["_unit","_side","_sector","_visibility","_find","_canSee","_mrkArea","_mrk"];

_unit	= [_this, 0] call BIS_fnc_param;
_side	= side _unit;

/*[
	["Function: %1", "TTC_CTI_fnc_initSectorsLocal"], ["_unit = %1", _unit], ["_side = %1", _side]
] call TTC_CORE_fnc_log;*/


// Safety measure: Wait until the initialization of the sectors is done.
waitUntil {TTC_CTI_initDone && !isNil "TTC_CTI_sides"};

{
	_sector		= _x;
	_visibility	= TTC_CTI_sectorVariable_visibility;
	_find		= ([TTC_CTI_sides, _side] call BIS_fnc_arrayFindDeep) select 0;
	_canSee		= _visibility select _find;
	_mrkArea	= format["mrk_SectorArea%1", _forEachIndex];
	_mrk		= format["mrk_Sector%1", _forEachIndex];

	if (_canSee) then {
		// Update the sector markers.
		[_sector, TTC_CTI_dominanceMax, _mrkArea, _mrk] call TTC_CTI_fnc_updateSectorMarkersLocal;

		// Create task
		_task = [_unit, _sector] call TTC_CTI_fnc_createSimpleTask;
		_sector setVariable ["TTC_CTI_sector_task", _task];
	} else {
		// Hide the sector markers.
		_mrkArea setMarkerAlphaLocal 0;
		_mrk setMarkerAlphaLocal 0;
	};
} forEach TTC_CTI_sectors;