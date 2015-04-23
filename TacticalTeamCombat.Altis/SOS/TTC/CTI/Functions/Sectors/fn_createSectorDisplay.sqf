/*
    Created by Lux0r
*/


disableSerialization;

#include "sectorVariables.hpp"

#define TTC_CTI_sectorDisplay_isNull isNull (uiNamespace getVariable ["TTC_CTI_sectorDisplay", displayNull])

private ["_sector","_name","_color","_display","_control","_side","_dominance","_text"];

_sector	= [_this, 0] call BIS_fnc_param;
_name	= [_this, 1, TTC_CTI_sectorVariable_name, [""]] call BIS_fnc_param;

/*[_sector, "TTC_CTI_fnc_createSectorDisplay",
	[["_name = %1", _name], ["TTC_CTI_sectorDisplay_isNull = %1", TTC_CTI_sectorDisplay_isNull]]
] call TTC_CTI_fnc_logSector;*/


// Safety measure: Only show the sector display, if it doesn't exist.
if (TTC_CTI_sectorDisplay_isNull) then {
	// Show the sector display.
	1004 cutRsc ["TTC_CTI_sectorDisplay", "PLAIN"];
	_display = uiNamespace getVariable "TTC_CTI_sectorDisplay";
	_control = _display displayCtrl 1005;

	while {!TTC_CTI_sectorDisplay_isNull} do {
		// Set the text for the sector display.
		_side	= TTC_CTI_sectorVariable_side;
		_color	= [_side, false] call BIS_fnc_sideColor;
		_control ctrlSetTextColor _color;

		// Set the text for the balance display.
		_dominance	= TTC_CTI_sectorVariable_dominance;
		_text		= parseText format["<t size='0.8'>%1 (%2/%3)</t>", _name, _dominance, 0];
		_control ctrlSetStructuredText _text;

		uiSleep 1;
	};
};