/*
	This script is called when the player selects a sector from the sector list.
	
	Parameter(s):
		0: CONTROL	- the sector list display control
		1: NUMBER	- the index of the selected sector
	
    Created by BauerMitFackel
*/


disableSerialization;

#include "sectorStates.hpp"

#define TTC_TP_UI_tooltip_safe(NAME) "Your team dominates '" +NAME +"'. It should be safe to spawn here."
#define TTC_TP_UI_tooltip_warning(NAME) "'" +NAME +"' is not completely under your control. Maybe it is not safe to spawn here."
#define TTC_TP_UI_tooltip_danger(NAME) "You can't spawn at '" +NAME +"', because the enemy is already too strong in the area!"
#define TTC_TP_UI_tooltip_cutOff(NAME) "You can't spawn at '" +NAME +"', because this sector is cut off from your base!"

private["_control","_index","_id","_sector","_name","_state"];

_control	= [_this, 0] call BIS_fnc_param;
_index		= [_this, 1] call BIS_fnc_param;


// Get the sector.
_id			= _control lnbValue [_index, 0];
_sector		= TTC_CTI_sectors select _id;
_name		= _sector getVariable ["TTC_CTI_sector_name", ""];

// Get the state of the sector.
_state = [_sector] call TTC_TP_fnc_getSectorState;

// Set tooltip according to the sector's state.
switch (_state) do {
	case TTC_TP_UI_sectorState_safe: {
		_control ctrlSetTooltip TTC_TP_UI_tooltip_safe(_name);
	};
	case TTC_TP_UI_sectorState_warning: {
		_control ctrlSetTooltip TTC_TP_UI_tooltip_warning(_name);
	};
	case TTC_TP_UI_sectorState_danger: {
		_control ctrlSetTooltip TTC_TP_UI_tooltip_danger(_name);
	};
	case TTC_TP_UI_sectorState_cutOff: {
		_control ctrlSetTooltip TTC_TP_UI_tooltip_cutOff(_name);
	};
};
