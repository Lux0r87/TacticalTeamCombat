/*
	Returns the blood volume of the given unit.
	If the variable TTC_MED_var_BLOOD_VOLUME is not set, this function returns 1.0.
	
	Parameter(s):
		0: OBJECT - unit
		
    Created by BauerMitFackel
*/


_unit = [_this, 0] call BIS_fnc_param;


_bloodVolume = player getVariable [TTC_MED_var_BLOOD_VOLUME, 1.0];
_bloodVolume;
