/*
	Adds the check action to the action menu.
	
	Parameter(s):
		0: OBJECT	- unit
		1: NUMBER 	- max distance to target
		2: NUMBER 	- priority
		3: STRING 	- color (HEX format)
		
    Created by BauerMitFackel
*/


_unit					= [_this, 0] call BIS_fnc_param;
_maxDistanceToTarget	= [_this, 1] call BIS_fnc_param;
_priority				= [_this, 2] call BIS_fnc_param;
_color					= [_this, 3] call BIS_fnc_param;


[_unit, _maxDistanceToTarget, _priority, _color] call BIS_fnc_log;


_title = format["<t color='%1'>Check %2</t>", _color, (name _unit)];
_condition = format[
	"
		_this distance _target < %1) && 
		(alive _target) && 
		(vehicle _this == _this) && 
		!(_this getVariable '%2') && 
		!(_target getVariable '%3') && 
		!(_target getVariable '%4')
	", 
	_maxDistanceToTarget, 
	TTC_MED_var_IS_TREATING,
	TTC_MED_var_IS_INCAPACITATED,
	TTC_MED_var_IS_DRAGGED
];

if (_unit == player) then {
	_title = format["<t color='%1'>Check myself</t>", _color];
	_condition = format[
		"(alive _target) && !(_this getVariable '%1')", 
		TTC_MED_var_IS_TREATING
	];
};


// Add the action
_unit addAction [
	/* title		*/	_title,
	/* script 		*/	{
							[_this select 0, true] call TTC_MED_fnc_check;
						},
	/* arguments	*/	[],
	/* priority		*/	_priority,
	/* show window	*/	false,
	/* hide on use	*/	true,
	/* shortcut		*/	"",
	/* condition	*/	_condition
];
