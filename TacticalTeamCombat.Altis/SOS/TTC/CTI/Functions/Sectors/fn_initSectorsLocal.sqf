/*
	Created by Lux0r
*/

#include "dominanceVariables.inc"
#include "sectorVariables.inc"

private ["_unit","_side","_visibility","_find","_canSee","_mrkArea","_mrk","_sectorSide","_color","_brush","_text","_task"];

_unit	= [_this, 0] call BIS_fnc_param;
_side	= side _unit;

/*[
	["Function: %1", "TTC_CTI_fnc_initSectorsLocal"], ["_unit = %1", _unit], ["_side = %1", _side]
] call TTC_CORE_fnc_log;*/


// Safety measure: Wait until the initialization of the sectors is done.
waitUntil {TTC_CTI_initDone && !isNil "TTC_CTI_sides"};

{
	_visibility	= TTC_CTI_sectorVariable_visibility(_x);
	_find		= ([TTC_CTI_sides, _side] call BIS_fnc_arrayFindDeep) select 0;
	_canSee		= _visibility select _find;
	_mrkArea	= format["mrk_SectorArea%1", _forEachIndex];
	_mrk		= format["mrk_Sector%1", _forEachIndex];

	if (_canSee) then {
		_sectorSide	= _x getVariable ["TTC_CTI_sector_side", sideUnknown];
		_color		= [_sectorSide, true] call BIS_fnc_sideColor;
		_brush		= "Solid";
		_text		= [_x] call TTC_CTI_fnc_getSectorText;

		// Create task
		_task = [_unit, _x] call TTC_CTI_fnc_createSimpleTask;
		_x setVariable ["TTC_CTI_sector_task", _task];
	} else {
		_color		= "ColorUNKNOWN";
		_brush		= "DiagGrid";
		_text		= _x getVariable ["TTC_CTI_sector_name", ""];
	};

	// Update the sector markers.
	[_x, TTC_CTI_dominanceMax, _mrkArea, _mrk, _color, _brush, (" " + _text)] call TTC_CTI_fnc_updateSectorMarkersLocal;
} forEach TTC_CTI_sectors;