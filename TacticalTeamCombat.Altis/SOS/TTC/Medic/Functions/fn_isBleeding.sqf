/*
	Returns true if the given unit is bleeding, false otherwise.
	If the variable TTC_MED_var_IS_BLEEDING is not set, this function returns false.
	
	Parameter(s):
		0: OBJECT - unit
		
    Created by BauerMitFackel
*/


_unit = [_this, 0] call BIS_fnc_param;


_isBleeding = _unit getVariable [TTC_MED_var_IS_BLEEDING, false];
_isBleeding;
