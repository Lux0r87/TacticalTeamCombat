/*
	Updates the sector list.
	
	Parameter(s):
		0: ARRAY - the sectors to display
		
    Created by BauerMitFackel
	Edited by Lux0r
*/


disableSerialization;

#include "sectorStates.hpp"

#define TTC_TP_UI_basicPrice 250
#define TTC_TP_UI_distancePrice 20


/*
	Returns the icon for the sector.
	Parameter(s):
		0: Trigger	- the sector/trigger object
*/
_getSectorIcon = {
	private["_sector","_state","_icon"];

	_sector		= [_this, 0] call BIS_fnc_param;

	// Get the sector state.
	_state = [_sector] call TTC_TP_fnc_getSectorState;

	// Get the icon according to the sector's state.
	_icon = switch (_state) do {
		case TTC_TP_UI_sectorState_safe: {
			"SOS\TTC\Teleport\Icons\sector_icon_safe.paa";
		};
		case TTC_TP_UI_sectorState_warning: {
			"SOS\TTC\Teleport\Icons\sector_icon_warning.paa";
		};
		case TTC_TP_UI_sectorState_danger: {
			"SOS\TTC\Teleport\Icons\sector_icon_danger.paa";
		};
		case TTC_TP_UI_sectorState_cutOff: {
			"SOS\TTC\Teleport\Icons\sector_icon_cutOff.paa";
		};
	};

	_icon;
};

/*
	Adds the given sector to the sector list
	Parameter(s):
		0: CONTROL	- sector list display control
		1: ARRAY	- sector array
*/
_addSectorToList = {
	private["_control","_sector","_id","_side","_displayName","_basePos","_sectorPos","_distance","_distPrice","_price","_index"];

	_control = [_this, 0] call BIS_fnc_param;
	_sector	 = [_this, 1] call BIS_fnc_param;
	_id		 = [_this, 2] call BIS_fnc_param;
	_side	 = [_this, 3] call BIS_fnc_param;

	// Get the display name for the sector.
	_displayName	= [_sector] call TTC_CTI_fnc_getSectorText;

	// Calculate the price.
	_basePos	= missionNamespace getVariable [format["TTC_BASE_%1", _side], [0, 0]];
	_sectorPos	= getPos _sector;
	_distance	= _basePos distance _sectorPos;
	_distPrice	= (floor (_distance / 100)) * TTC_TP_UI_distancePrice;
	_price		= TTC_TP_UI_basicPrice + _distPrice;

	// Get the icon for the sector.
	_icon	= [_sector] call _getSectorIcon;

	// Add a new row: set name, picture and value.
	_index	= _control lnbAddRow [_displayName, format["%1 BTC", _price]];
	_control lnbSetPicture [[_index, 0], _icon];
	_control lnbSetValue [[_index, 0], _id];
};


//////////


private["_control","_side","_sectorSide"];

_control = uiNamespace getVariable ["TTC_TP_UI_sectorList", nil];

/*[
	["Function: %1", "TTC_TP_UI_updateSectorList"], ["_control = %1", _control], ["_this = %1", _this]
] call TTC_CORE_fnc_log;*/

if (!isNil {_control}) then {
	lnbClear _control;

	if (_this isEqualTo []) then {
		["Sector array is empty"] call BIS_fnc_log;
	} else {
		// Iterate over all sectors.
		{
			_side		= side player;
			_sectorSide	= _x getVariable ["TTC_CTI_sector_side", sideUnknown];

			// Add sectors to list, if the player's side controls it.
			if (_side == _sectorSide) then {
				[_control, _x, _forEachIndex, _side] call _addSectorToList;
			};
		} forEach _this;

		// Select first row
		_control lnbSetCurSelRow 0;
	};
} else {
	["Variable TTC_TP_UI_sectorList not defined"] call BIS_fnc_error;
};
