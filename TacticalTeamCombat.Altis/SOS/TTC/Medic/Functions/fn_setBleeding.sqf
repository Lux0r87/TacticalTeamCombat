/*
	Sets the bleeding flag of the given unit.
	
	Parameter(s):
		0: OBJECT	- unit
		1: BOOLEAN	- bleeding
		2: BOOLEAN	- broadcast (Optional, Default: false) 
		
    Created by BauerMitFackel
*/


_unit		= [_this, 0] call BIS_fnc_param;
_bleeding	= [_this, 1] call BIS_fnc_param;
_broadcast	= [_this, 2, false] call BIS_fnc_param;


if (TTC_MED_debug) then {
	[_unit, _bleeding, _broadcast] call BIS_fnc_log;
};


if (_broadcast) then {
	player setVariable [TTC_MED_var_IS_BLEEDING, _bleeding, true];
} else {
	player setVariable [TTC_MED_var_IS_BLEEDING, _bleeding];
};
