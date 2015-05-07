/*
	Created by Lux0r
*/


private ["_text","_pos","_xrad","_yrad","_dir","_rectangle","_actBy","_trigger"];

_text		= [_this, 0, "", [""]] call BIS_fnc_param;
_pos		= [_this, 1, [0, 0], [[]], [2, 3]] call BIS_fnc_param;
_xrad		= [_this, 2, 20, [0]] call BIS_fnc_param;
_yrad		= [_this, 3, 20, [0]] call BIS_fnc_param;
_dir		= [_this, 4, 0, [0]] call BIS_fnc_param;
_rectangle	= [_this, 5, false, [false]] call BIS_fnc_param;
_actBy		= [_this, 6, "ANY", [""]] call BIS_fnc_param;			// "EAST", "WEST", "GUER", "CIV", "LOGIC", "ANY", ...
_actType	= [_this, 7, "PRESENT", [""]] call BIS_fnc_param;		// Presence: "PRESENT", "NOT PRESENT"; Detection: "WEST D", "EAST D", "GUER D" or "CIV D"

/*[
	["Function: %1", "TTC_CORE_fnc_createZoneProtection"], ["_text = %1", _text], ["_pos = %1", _pos], ["_xrad = %1", _xrad], ["_yrad = %1", _yrad],
	["_dir = %1", _dir], ["_rectangle = %1", _rectangle], ["_actBy = %1", _actBy], ["_actType = %1", _actType]
] call TTC_CORE_fnc_log;*/


// Create a trigger.
_trigger = [_text, _pos, _xrad, _yrad, _dir, _rectangle, nil, "EmptyDetector", _actBy, _actType, false, false] call TTC_CORE_fnc_createTrigger;

// Create location area.
_logicCenter	= createCenter sideLogic;
_logicGroup		= createGroup _logicCenter;
_locationArea	= _logicGroup createUnit ["LocationArea_F", _pos, [], 0, "NONE"];

// Create zone protection module.
//_logicGroup		= createGroup _logicCenter;
_zoneProtection	= _logicGroup createUnit ["ModuleZoneProtection_F", _pos, [], 0, "NONE"];
_zoneProtection setVariable ["show", false];

// Synchronize: trigger and location area; location area and zone protection module.
_trigger synchronizeObjectsAdd [_locationArea];
_locationArea synchronizeObjectsAdd [_zoneProtection];

// Return trigger, location area and zone protection module.
[_trigger, _locationArea, _zoneProtection]