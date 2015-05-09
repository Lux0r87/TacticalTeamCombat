/*
	This script is called when the player clicks on the teleport button.

    Created by Lux0r
*/


disableSerialization;

#define IDC_OK			1 //emulate "Ok" button
#define IDC_CANCEL		2 //emulate "Cancel" button
#define TTC_randomDir	30

private["_control","_index","_list","_id","_sector","_directions","_find","_dir","_random","_price"];

_control	= [_this, 0] call BIS_fnc_param;
_index		= [_this, 1] call BIS_fnc_param;

//[["Function: %1", "TTC_TP_UI_fnc_onTeleportClicked"], ["_control = %1", _control], ["_index = %1", _index]] call TTC_CORE_fnc_log;


// Get the control of the sector list.
_list = uiNamespace getVariable ["TTC_TP_UI_sectorList", nil];

if (!isNil "_list") then {
	// Get selected row
	_index = lnbCurSelRow _list;

	if (_index >= 0) then {
		// Get the sector.
		_id			= _list lnbValue [_index, 0];
		_sector		= TTC_CTI_sectors select _id;
		_directions	= _sector getVariable ["TTC_CTI_sector_respawnDir", []];
		_find		= ([TTC_CTI_sides, side player] call BIS_fnc_arrayFindDeep) select 0;
		_dir		= _directions select _find;
		_random		= TTC_randomDir - floor(random(2 * TTC_randomDir));

		// Get the price for the teleport.
		_price		= _list lnbValue [_index, 1];

		// Run the teleport function.
		[getPos _sector, (_dir + _random), _price] spawn TTC_TP_fnc_teleport;

		closeDialog IDC_OK;
	};
} else {
	["Variable TTC_TP_UI_sectorList not defined"] call BIS_fnc_error;
};
