/*
	Sets the blood volume of the given unit.
	
	Parameter(s):
		0: OBJECT	- unit
		1: NUMBER	- blood volume
		2: BOOLEAN	- broadcast (Optional, Default: false) 
		
    Created by BauerMitFackel
*/


_unit		= [_this, 0] call BIS_fnc_param;
_bloodValue = [_this, 1] call BIS_fnc_param;
_broadcast	= [_this, 2, false] call BIS_fnc_param;


if (TTC_MED_debug) then {
	[_unit, _bloodValue, _broadcast] call BIS_fnc_log;
};


if (_broadcast) then {
	player setVariable [TTC_MED_var_BLOOD_VOLUME, _bloodValue, true];
} else {
	player setVariable [TTC_MED_var_BLOOD_VOLUME, _bloodValue];
};

