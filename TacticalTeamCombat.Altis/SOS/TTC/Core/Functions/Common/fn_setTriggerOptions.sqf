/*
	Created by Lux0r
*/

private ["_trigger","_text","_xrad","_yrad","_dir","_rectangle","_actBy","_actType","_actRepeat","_statements","_attach"];

_trigger	= [_this, 0] call BIS_fnc_param;
_text		= [_this, 1, "", [""]] call BIS_fnc_param;
_xrad		= [_this, 2, 20, [0]] call BIS_fnc_param;
_yrad		= [_this, 3, 20, [0]] call BIS_fnc_param;
_dir		= [_this, 4, 0, [0]] call BIS_fnc_param;
_rectangle	= [_this, 5, true, [true]] call BIS_fnc_param;
_actBy		= [_this, 6, "ANY", [""]] call BIS_fnc_param;				// "EAST", "WEST", "GUER", "CIV", "LOGIC", "ANY", ...
_actType	= [_this, 7, "PRESENT", [""]] call BIS_fnc_param;			// Presence: "PRESENT", "NOT PRESENT"; Detection: "WEST D", "EAST D", "GUER D" or "CIV D"
_actRepeat	= [_this, 8, true, [true]] call BIS_fnc_param;
_statements	= [_this, 9, ["this", "", ""], [[]]] call BIS_fnc_param;
_attach		= [_this, 10, true, [true]] call BIS_fnc_param;

/*[
	["Function: %1", "TTC_CORE_fnc_setTriggerOptions"], ["_trigger = %1", _trigger], ["_text = %1", _text], ["_xrad = %1", _xrad], ["_yrad = %1", _yrad], ["_dir = %1", _dir],
	["_rectangle = %1", _rectangle], ["_actBy = %1", _actBy], ["_actType = %1", _actType], ["_actRepeat = %1", _actRepeat], ["_statements = %1", _statements], ["_attach = %1", _attach]
] call TTC_CORE_fnc_log;*/


_trigger setTriggerText _text;
_trigger setTriggerArea [_xrad, _yrad, _dir, _rectangle];
_trigger setTriggerActivation [_actBy, _actType, _actRepeat];

// Clients only.
if (hasInterface) then {
	_trigger setTriggerStatements _statements;

	if (_attach) then {
		_trigger triggerAttachVehicle [player];
	};
};
