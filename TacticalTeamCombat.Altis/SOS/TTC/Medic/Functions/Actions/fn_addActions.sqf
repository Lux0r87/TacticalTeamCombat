/*
	Adds medic actions to the action menu.
	The colors of the action menu entries can be seen at http://flatuicolors.com/
	
	Parameter(s):
		0: OBJECT - unit
		
    Created by BauerMitFackel
*/


#define _MAX_DISTANCE_TO_TARGET	2.45
#define _COLOR_SUN_FLOWER		"#F1C40F"
#define _COLOR_CARROT			"#E67E22"
#define _COLOR_ALIZARIN			"#E74C3C"


_unit = [_this, 0] call BIS_fnc_param;
if (_unit == player) then {
	[_unit, _MAX_DISTANCE_TO_TARGET, 8.9, _COLOR_SUN_FLOWER]	call TTC_MED_fnc_addAction_check;
} else {
	[_unit, _MAX_DISTANCE_TO_TARGET, 8.8, _COLOR_SUN_FLOWER]	call TTC_MED_fnc_addAction_check;
	//[_unit, _MAX_DISTANCE_TO_TARGET, 8.7, _COLOR_SUN_FLOWER]	call TTC_MED_fnc_addAction_examine;
	//[_unit, _MAX_DISTANCE_TO_TARGET, 8.6, _COLOR_CARROT]		call TTC_MED_fnc_addAction_drag;
	//[_unit, _MAX_DISTANCE_TO_TARGET, 8.5, _COLOR_ALIZARIN]		call TTC_MED_fnc_addAction_applyPressure;
	//[_unit, _MAX_DISTANCE_TO_TARGET, 8.4, _COLOR_ALIZARIN]		call TTC_MED_fnc_addAction_revive;
};
