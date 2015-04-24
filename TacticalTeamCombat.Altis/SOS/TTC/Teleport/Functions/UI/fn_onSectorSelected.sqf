/*
	This script is called when the player selects a sector from the sector list.
	
	Parameter(s):
		0: CONTROL	- the sector list display control
		1: NUMBER	- the index of the selected sector
	
    Created by BauerMitFackel
*/


disableSerialization;

#define TTC_TP_UI_tooltip_dominate "Your team dominates this sector.It should be safe to spawn here."
#define TTC_TP_UI_tooltip_control "This is sector is not completely under your control. Maybe it is not safe to spawn here."
#define TTC_TP_UI_tooltip_weak "You can't spawn here, because the enemy is already too strong in the area!"
#define TTC_TP_UI_tooltip_cutOff "You can't spawn here, because this sector is cut off from your base!"


/*
	Returns the icon for the sector.
	Parameter(s):
		0: Trigger	- the sector/trigger object
*/
_getSectorTooltip = {
	private["_sector","_dominance","_isConnected","_tooltip"];

	_sector		= [_this, 0] call BIS_fnc_param;

	_dominance		= _sector getVariable ["TTC_CTI_sector_dominance", 0];
	_isConnected	= _sector getVariable ["TTC_CTI_sector_isConnectedToBase", false];

	// Get the display name for the sector.
	_tooltip = if (_isConnected) then {
		switch (true) do {
			case (_dominance == 100): {
				TTC_TP_UI_tooltip_dominate;
			};
			case (_dominance >= 75): {
				TTC_TP_UI_tooltip_control;
			};
			default {
				TTC_TP_UI_tooltip_weak;
			};
		};
	} else {
		TTC_TP_UI_tooltip_cutOff;
	};

	_tooltip;
};


private["_control","_index","_id","_sector"];

_control	= [_this, 0] call BIS_fnc_param;
_index		= [_this, 1] call BIS_fnc_param;


_id			= _control lnbValue [_index, 0];
_sector		= TTC_CTI_sectors select _id;
_tooltip	= [_sector] call _getSectorTooltip;
_control ctrlSetTooltip _tooltip;
