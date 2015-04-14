/*
    Created by Lux0r
*/


disableSerialization;

#include "dominanceVariables.hpp"

private ["_display","_control","_text"];


1004 cutRsc ["TTC_CTI_sectorDisplay", "PLAIN"];
_display = uiNamespace getVariable "TTC_CTI_sectorDisplay";
_control = _display displayCtrl 1005;

// Dummy function to simulate the sector display.
while {true} do {
	_name = "A - Mobile Sector";
	_dominance = [0, 100] call BIS_fnc_randomInt;
	_text = parseText format["<t size='0.8'>%1 (%2/%3)</t>", _name, _dominance, TTC_CTI_dominanceMax];
	_color = [side player, false] call BIS_fnc_sideColor;
	_control ctrlSetStructuredText _text;
	_control ctrlSetTextColor _color;

	uiSleep 5;
};