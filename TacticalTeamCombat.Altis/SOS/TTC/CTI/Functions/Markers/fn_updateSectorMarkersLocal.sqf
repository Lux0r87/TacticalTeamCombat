/*
	Function to update a marker locally. Can also called by bis_fnc_MP to update the marker for a side.

	Created by Lux0r
*/

#define TTC_CTI_sectorMarkerAlpha 1
#define TTC_CTI_sectorAreaMarkerAlpha 0.3

private ["_sector","_dominanceMax","_name","_side","_dominance","_mrkArea","_mrk","_color"];

_sector			= [_this, 0] call BIS_fnc_param;
_dominanceMax	= [_this, 1, 100, [0]] call BIS_fnc_param;

_name		= _sector getVariable "TTC_CTI_sector_name";
_side		= _sector getVariable "TTC_CTI_sector_side";
_dominance	= _sector getVariable "TTC_CTI_sector_dominance";
_mrkArea	= _sector getVariable "TTC_CTI_sector_markerArea";
_mrk		= _sector getVariable "TTC_CTI_sector_marker";
_color		= [_side, true] call BIS_fnc_sideColor;

/*[_sector, "TTC_CTI_fnc_updateSectorMarkersLocal", 
	[["_dominanceMax = %1", _dominanceMax], ["_name = %1", _name], ["_side = %1", _side], ["_dominance = %1", _dominance],
	["_mrkArea = %1", _mrkArea], ["_mrk = %1", _mrk], ["_color = %1", _color]]
] call TTC_CTI_fnc_logSector;*/


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