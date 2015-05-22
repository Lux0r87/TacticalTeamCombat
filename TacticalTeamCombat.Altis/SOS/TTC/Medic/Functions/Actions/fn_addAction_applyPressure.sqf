/*
	Adds the apply pressure action to the action menu.
	
	Parameter(s):
		0: OBJECT	- unit
		1: NUMBER 	- max distance to target
		2: NUMBER 	- priority
		3: STRING 	- color (HEX format)
		
    Created by BauerMitFackel
*/


_unit					= [this, 0] call BIS_fnc_param;
_maxDistanceToTarget	= [this, 1] call BIS_fnc_param;
_priority				= [this, 2] call BIS_fnc_param;
_color					= [this, 3] call BIS_fnc_param;


_title = format["<t color='%1'>Apply pressure to %2</t>", _color, (name _unit)];
_condition = format[
	"
		_this distance _target < %1) && 
		(alive _target) && 
		(vehicle _this == _this) && 
		!(_this getVariable %2) && 
		(_target getVariable %3) && 
		!(_target getVariable %4)
	", 
	_maxDistanceToTarget, 
	TTC_MED_var_isTreating,
	TTC_MED_var_isIncapacitated,
	TTC_MED_var_isBeingDragged
];

// Add the action
_unit addAction [
	/* title		*/	_title,
	/* script 		*/	{
							[] call TTC_MED_fnc_applyPressure;
						},
	/* arguments	*/	[],
	/* priority		*/	_priority,
	/* show window	*/	false,
	/* hide on use	*/	true,
	/* shortcut		*/	"",
	/* condition	*/	_condition
];
