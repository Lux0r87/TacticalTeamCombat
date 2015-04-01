/*
	Function to update a marker locally. Can also called by bis_fnc_MP to update the marker for a side.

	Created by Lux0r
*/

#include "markerVariables.hpp"
#include "sectorVariables.hpp"

private ["_sector","_dominanceMax","_name","_side","_dominance","_mrkArea","_mrk","_color"];

_sector			= [_this, 0] call BIS_fnc_param;
_dominanceMax	= [_this, 1, 100, [0]] call BIS_fnc_param;

_name		= _sector select TTC_CTI_sector_name;
_side		= _sector select TTC_CTI_sector_side;
_dominance	= _sector select TTC_CTI_sector_dominance;
_mrkArea	= _sector select TTC_CTI_sector_markerArea;
_mrk		= _sector select TTC_CTI_sector_marker;
_color		= [_side, true] call BIS_fnc_sideColor;

/*[
	["TTC_CTI: updateSectorMarkersLocal:"], ["_sector = %1", _sector], ["_dominanceMax = %1", _dominanceMax], ["_name = %1", _name], ["_side = %1", _side],
	["_dominance = %1", _dominance], ["_mrkArea = %1", _mrkArea], ["_mrk = %1", _mrk], ["_color = %1", _color]
] call TTC_CORE_fnc_log;*/


// Update area marker
if (_mrkArea != "") then {
	_mrkArea setMarkerColorLocal _color;
	_mrkArea setMarkerAlphaLocal TTC_CTI_sectorAreaMarkerAlpha;
};

// Update marker
if (_mrk != "") then {
	_mrk setMarkerColorLocal _color;
	_mrk setMarkerAlphaLocal TTC_CTI_sectorMarkerAlpha;
	_mrk setMarkerTextLocal format[" %1 - %2%3", _name, (_dominance/_dominanceMax)*100, "%"];
};