/*
	TODO: Write documentation
	
	Parameter(s):
		0: OBJECT	- unit
		
    Created by BauerMitFackel
*/


_unit = [_this, 0] call BIS_fnc_param;

[_unit] call BIS_fnc_log;
[_unit] call TTC_MED_fnc_addActions;

/*
if !(_unit getVariable [TTC_MED_var_isActionsInit, false]) then {
	_unit setVariable [TTC_MED_var_isActionsInit, true];
	[_unit] call TTC_MED_fnc_addActions;
};
*/