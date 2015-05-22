/*
	Sets the incapacitated state of the given unit to the given value.
	
	Parameter(s):
		0: OBJECT	- unit
		1: BOOLEAN	- incapacitated
		2: BOOLEAN	- broadcast (Optional, Default: false) 
		
    Created by BauerMitFackel
*/


_unit			= [_this, 0] call BIS_fnc_param;
_incapacitated	= [_this, 1] call BIS_fnc_param;
_broadcast		= [_this, 2, false] call BIS_fnc_param;


if (TTC_MED_debug) then {
	[_unit, _incapacitated, _broadcast] call BIS_fnc_log;
};


if (_broadcast) then {
	player setVariable [TTC_MED_var_IS_INCAPACITATED, _incapacitated, true];
} else {
	player setVariable [TTC_MED_var_IS_INCAPACITATED, _incapacitated];
};

