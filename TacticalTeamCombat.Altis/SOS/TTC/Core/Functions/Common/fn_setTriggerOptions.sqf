/*
	Created by Lux0r
*/

private ["_trigger","_text","_xrad","_yrad","_dir","_rectangle","_actBy","_actType","_actRepeat","_statements"];

_trigger	= [_this, 0] call BIS_fnc_param;
_text		= [_this, 1, "", [""]] call BIS_fnc_param;
_xrad		= [_this, 2, 20, [0]] call BIS_fnc_param;
_yrad		= [_this, 3, 20, [0]] call BIS_fnc_param;
_dir		= [_this, 4, 0, [0]] call BIS_fnc_param;
_rectangle	= [_this, 5, true, [true]] call BIS_fnc_param;
_actBy		= [_this, 6, "ANY", [""]] call BIS_fnc_param;
_actType	= [_this, 7, "PRESENT", [""]] call BIS_fnc_param;
_actRepeat	= [_this, 8, true, [true]] call BIS_fnc_param;
_statements	= [_this, 9, ["this", "", ""], [[]]] call BIS_fnc_param;

/*[
	["Function: %1", "TTC_CTI_setTriggerOptions:"], ["_trigger = %1", _trigger], ["_text = %1", _text], ["_xrad = %1", _xrad], ["_yrad = %1", _yrad], ["_dir = %1", _dir],
	["_rectangle = %1", _rectangle], ["_actBy = %1", _actBy], ["_actType = %1", _actType], ["_actRepeat = %1", _actRepeat], ["_statements = %1", _statements]
] call TTC_CORE_fnc_log;*/


_trigger setTriggerText _text;
_trigger setTriggerArea [_xrad, _yrad, _dir, _rectangle];
_trigger setTriggerActivation [_actBy, _actType, _actRepeat];
_trigger setTriggerStatements _statements;
_trigger triggerAttachVehicle [player];