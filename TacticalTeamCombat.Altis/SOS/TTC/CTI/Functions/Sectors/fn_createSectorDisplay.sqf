/*
    Created by Lux0r
*/


disableSerialization;

#include "sectorVariables.inc"

#define TTC_CTI_sectorDisplay_isNull isNull (uiNamespace getVariable ["TTC_CTI_sectorDisplay", displayNull])

private ["_sector","_display","_control","_side","_color","_text"];

_sector	= [_this, 0] call BIS_fnc_param;

/*[_sector, "TTC_CTI_fnc_createSectorDisplay",
	[["TTC_CTI_sectorDisplay_isNull = %1", TTC_CTI_sectorDisplay_isNull]]
] call TTC_CTI_fnc_logSector;*/


// Safety measure: Only show the sector display, if it doesn't exist.
if (TTC_CTI_sectorDisplay_isNull) then {
	// Show the sector display.
	1004 cutRsc ["TTC_CTI_sectorDisplay", "PLAIN"];
	_display = uiNamespace getVariable "TTC_CTI_sectorDisplay";
	_control = _display displayCtrl 1005;

	while {!TTC_CTI_sectorDisplay_isNull} do {
		// Set the text for the sector display.
		_side	= TTC_CTI_sectorVariable_side(_sector);
		_color	= [_side, false] call BIS_fnc_sideColor;
		_control ctrlSetTextColor _color;

		// Set the text for the balance display.
		_text	= parseText ([_sector] call TTC_CTI_fnc_getSectorText);
		_control ctrlSetStructuredText _text;

		uiSleep 1;
	};
};
