/*
	This script is called when the player clicks on the teleport button.

    Created by Lux0r
*/


disableSerialization;

#define IDC_OK		1 //emulate "Ok" button
#define IDC_CANCEL	2 //emulate "Cancel" button

private["_control","_index","_dialog","_id","_sector","_pos","_price"];

_control	= [_this, 0] call BIS_fnc_param;
_index		= [_this, 1] call BIS_fnc_param;


// Get the control of the sector list.
_list = uiNamespace getVariable ["TTC_TP_UI_sectorList", nil];

if (!isNil "_list") then {
	// Get selected row
	_index = lnbCurSelRow _list;

	if (_index >= 0) then {
		// Get the sector.
		_id			= _list lnbValue [_index, 0];
		_sector		= TTC_CTI_sectors select _id;
		_pos		= getPos _sector;

		// Get the price for the teleport.
		_price		= _list lnbValue [_index, 1];

		// Run the teleport function.
		[_pos, _price] spawn TTC_TP_fnc_teleport;

		closeDialog IDC_OK;
	};
} else {
	["Variable TTC_TP_UI_sectorList not defined"] call BIS_fnc_error;
};
