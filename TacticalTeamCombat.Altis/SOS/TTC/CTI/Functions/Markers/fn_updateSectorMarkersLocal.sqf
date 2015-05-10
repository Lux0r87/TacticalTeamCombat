/*
	Function to update a marker locally. Can also called by bis_fnc_MP to update the marker for a side.

	Created by Lux0r
*/

#define TTC_CTI_sectorMarkerAlpha 1
#define TTC_CTI_sectorAreaMarkerAlpha 0.3

private ["_sector","_dominanceMax","_mrkArea","_mrk","_color","_brush","_text"];

_sector			= [_this, 0] call BIS_fnc_param;
_dominanceMax	= [_this, 1, 100, [0]] call BIS_fnc_param;
_mrkArea		= [_this, 2, _sector getVariable ["TTC_CTI_sector_markerArea", ""], [""]] call BIS_fnc_param;
_mrk			= [_this, 3, _sector getVariable ["TTC_CTI_sector_marker", ""], [""]] call BIS_fnc_param;
_color			= [_this, 4, [_side, true] call BIS_fnc_sideColor, [""]] call BIS_fnc_param;
_brush			= [_this, 5, "Solid", [""]] call BIS_fnc_param;
_text			= [_this, 6, "", [""]] call BIS_fnc_param;

/*[_sector, "TTC_CTI_fnc_updateSectorMarkersLocal", 
	[["_dominanceMax = %1", _dominanceMax], ["_mrkArea = %1", _mrkArea], ["_mrk = %1", _mrk], ["_color = %1", _color], ["_brush = %1", _brush], ["_text = %1", _text]]
] call TTC_CTI_fnc_logSector;*/


// Update area marker
if (_mrkArea != "") then {
	_mrkArea setMarkerColorLocal _color;
	_mrkArea setMarkerAlphaLocal TTC_CTI_sectorAreaMarkerAlpha;
	_mrkArea setMarkerBrushLocal _brush;
};

// Update marker
if (_mrk != "") then {
	_mrk setMarkerColorLocal _color;
	_mrk setMarkerAlphaLocal TTC_CTI_sectorMarkerAlpha;
	_mrk setMarkerTextLocal _text;
};
