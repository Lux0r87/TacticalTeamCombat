/*
	Returns true if the given unit is incapacitated, false otherwise.
	If the variable TTC_MED_var_IS_INCAPACITATED is not set, this function returns false.
	
	Parameter(s):
		0: OBJECT - unit
		
    Created by BauerMitFackel
*/


_unit = [_this, 0] call BIS_fnc_param;


_isIncapacitated = _unit getVariable [TTC_MED_var_IS_INCAPACITATED, false];
_isIncapacitated;
