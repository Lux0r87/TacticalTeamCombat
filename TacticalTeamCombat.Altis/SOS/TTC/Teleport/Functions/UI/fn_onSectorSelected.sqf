/*
	This script is called when the player selects a sector from the sector list.
	
	Parameter(s):
		0: CONTROL	- the sector list display control
		1: NUMBER	- the index of the selected sector
	
    Created by BauerMitFackel
*/

disableSerialization;


_control	= [_this, 0] call BIS_fnc_param;
_index		= [_this, 1] call BIS_fnc_param;

systemChat ["Teleport Dialog: Sector @ index %1 selected", _index];
