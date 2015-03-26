/*
	Created by Lux0r
*/

diag_log "TTC_CORE: createTrigger";

private ["_text","_pos","_xrad","_yrad","_dir","_rectangle","_type","_actBy","_actType","_actRepeat","_trigger"];

_text		= [_this, 0, "", [""]] call BIS_fnc_param;
_pos		= [_this, 1, [0, 0], [[]], [2, 3]] call BIS_fnc_param;
_xrad		= [_this, 2, 20, [0]] call BIS_fnc_param;
_yrad		= [_this, 3, 20, [0]] call BIS_fnc_param;
_dir		= [_this, 4, 0, [0]] call BIS_fnc_param;
_rectangle	= [_this, 5, true, [true]] call BIS_fnc_param;
_type		= [_this, 6, "EmptyDetector", [""]] call BIS_fnc_param;
_actBy		= [_this, 7, "ANY", [""]] call BIS_fnc_param;
_actType	= [_this, 8, "PRESENT", [""]] call BIS_fnc_param;
_actRepeat	= [_this, 9, true, [true]] call BIS_fnc_param;


_trigger = createTrigger [_type, _pos];
_trigger setTriggerText _text;
_trigger setTriggerArea [_xrad, _yrad, _dir, _rectangle];
_trigger setTriggerActivation [_actBy, _actType, _actRepeat];
//_trigger setTriggerStatements ["this", "hint 'trigger on'", "hint 'trigger off'"];

_trigger