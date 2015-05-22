/*
	Returns the description for the given TTC_MED variable
	
	Parameter(s):
		0: STRING	- variable name
		1: ANYTHING - value
		
    Created by BauerMitFackel
*/


#define _COLOR_SUN_FLOWER	"#F1C40F"
#define _COLOR_CARROT		"#E67E22"
#define _COLOR_ALIZARIN		"#E74C3C"


_variableName 	= [_this, 0] call BIS_fnc_param;
_value 			= [_this, 1] call BIS_fnc_param;


if (TTC_MED_debug) then {
	[_variableName, _value] call BIS_fnc_log;
};


_description = nil;
switch (_variableName) do {
	
	case TTC_MED_var_BLOOD_LOSS_PER_HEARTBEAT : {
		if (_value > 0.006)	then {_description = format["<t color='%1'>heavily</t>", _COLOR_ALIZARIN];};
		if (_value > 0.003)	then {_description = format["<t color='%1'>moderately</t>", _COLOR_CARROT];};
		if (_value > 0)		then {_description = format["<t color='%1'>lightly</t>", _COLOR_SUN_FLOWER];};
		if (_value <= 0)	then {_description = "not";};
	};
};

_description;
