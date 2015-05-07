/*
	Created by Lux0r
*/


private ["_text","_pos","_xrad","_yrad","_dir","_rectangle","_statements","_type","_actBy","_actType","_actRepeat","_attach","_trigger"];

_text		= [_this, 0, "", [""]] call BIS_fnc_param;
_pos		= [_this, 1, [0, 0], [[]], [2, 3]] call BIS_fnc_param;
_xrad		= [_this, 2, 20, [0]] call BIS_fnc_param;
_yrad		= [_this, 3, 20, [0]] call BIS_fnc_param;
_dir		= [_this, 4, 0, [0]] call BIS_fnc_param;
_rectangle	= [_this, 5, true, [true]] call BIS_fnc_param;
_statements	= [_this, 6, ["this", "", ""], [[]]] call BIS_fnc_param;
_type		= [_this, 7, "EmptyDetector", [""]] call BIS_fnc_param;
_actBy		= [_this, 8, "ANY", [""]] call BIS_fnc_param;				// "EAST", "WEST", "GUER", "CIV", "LOGIC", "ANY", ...
_actType	= [_this, 9, "PRESENT", [""]] call BIS_fnc_param;			// Presence: "PRESENT", "NOT PRESENT"; Detection: "WEST D", "EAST D", "GUER D" or "CIV D"
_actRepeat	= [_this, 10, true, [true]] call BIS_fnc_param;
_attach		= [_this, 11, true, [true]] call BIS_fnc_param;

/*[
	["Function: %1", "TTC_CORE_fnc_createTrigger"], ["_text = %1", _text], ["_pos = %1", _pos], ["_xrad = %1", _xrad], ["_yrad = %1", _yrad], ["_dir = %1", _dir],
	["_rectangle = %1", _rectangle], ["_statements = %1", _statements], ["_type = %1", _type], ["_actBy = %1", _actBy], ["_actType = %1", _actType],
	["_actRepeat = %1", _actRepeat], ["_attach = %1", _attach]
] call TTC_CORE_fnc_log;*/


_trigger = createTrigger [_type, _pos];
[[_trigger, _text, _xrad, _yrad, _dir, _rectangle, _actBy, _actType, _actRepeat, _statements, _attach], "TTC_CORE_fnc_setTriggerOptions", true, true] call BIS_fnc_MP;

_trigger