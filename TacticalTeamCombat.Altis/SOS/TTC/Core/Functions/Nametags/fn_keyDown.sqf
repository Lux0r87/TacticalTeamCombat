/*
	Created by Lux0r
*/


private ["_ctrl","_dikCode","_shiftKey","_ctrlKey","_altKey","_handled","_status","_nametags"];

_ctrl		= _this select 0;
_dikCode	= _this select 1;
_shiftKey	= _this select 2;
_ctrlKey	= _this select 3;
_altKey		= _this select 4;
_handled	= false;

/*[
	["Function: %1", "TTC_CORE_keyDown"], ["_ctrl = %1", _ctrl], ["_dikCode = %1", _dikCode], ["_shiftKey = %1", _shiftKey], ["_ctrlKey = %1", _ctrlKey], ["_altKey = %1", _altKey]
] call TTC_CORE_fnc_log;*/


// Ctrl + L
if (_ctrlKey && _dikCode == 38) then {
	if (isNil {missionNamespace getVariable "TTC_CORE_draw3D_nametags"}) then {
		_status = "<t color='#00FF00'>enabled</t>";
		_nametags = addMissionEventHandler ["Draw3D", TTC_CORE_fnc_draw3D];
		missionNamespace setVariable ["TTC_CORE_draw3D_nametags", _nametags];
	} else {
		_status = "<t color='#FF0000'>disabled</t>";
		removeMissionEventHandler ["Draw3D", missionNamespace getVariable "TTC_CORE_draw3D_nametags"];
		missionNamespace setVariable ["TTC_CORE_draw3D_nametags", nil];
	};

	hintSilent parseText format["You have %1 the name tags", _status];
	_handled = true;
};

_handled;