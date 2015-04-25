/*
	This script is called when the player selects a sector from the sector list.
	
	Parameter(s):
		0: CONTROL	- the sector list display control
		1: NUMBER	- the index of the selected sector
	
    Created by BauerMitFackel
*/


disableSerialization;

#include "sectorStates.hpp"
#include "tooltipsSector.hpp"
#include "tooltipsTeleport.hpp"

private["_control","_index","_enable","_id","_sector","_name","_state","_teleport","_price","_balance"];

_control	= [_this, 0] call BIS_fnc_param;
_index		= [_this, 1] call BIS_fnc_param;
_enable		= true;


// Get the sector.
_id			= _control lnbValue [_index, 0];
_sector		= TTC_CTI_sectors select _id;
_name		= _sector getVariable ["TTC_CTI_sector_name", ""];

// Get the state of the sector.
_state = [_sector] call TTC_TP_fnc_getSectorState;

// Set sector tooltip, according to the state.
switch (_state) do {
	case TTC_TP_UI_sectorState_safe: {
		_control ctrlSetTooltip TTC_TP_UI_tooltipSector_safe(_name);
	};
	case TTC_TP_UI_sectorState_warning: {
		_control ctrlSetTooltip TTC_TP_UI_tooltipSector_warning(_name);
	};
	case TTC_TP_UI_sectorState_danger: {
		_control ctrlSetTooltip TTC_TP_UI_tooltipSector_danger(_name);
		_enable = false;
	};
	case TTC_TP_UI_sectorState_cutOff: {
		_control ctrlSetTooltip TTC_TP_UI_tooltipSector_cutOff(_name);
		_enable = false;
	};
};

// Get the control of the 'Teleport' button.
_teleport	= uiNamespace getVariable ["TTC_TP_UI_teleport", nil];

// Get the price for the teleport and current balance of the player.
_price		= _control lnbValue [_index, 1];
_balance	= missionNamespace getVariable ["TTC_BTC_balance", 0];

// Check if the player has enough money
if (_balance >= _price) then {
	_teleport ctrlSetTooltip TTC_TP_UI_tooltipTeleport_enoughMoney(_name, _price);
} else {
	_teleport ctrlSetTooltip TTC_TP_UI_tooltipTeleport_notEnoughMoney(_name, _price);
	_enable = false;
};

_teleport ctrlEnable _enable;
