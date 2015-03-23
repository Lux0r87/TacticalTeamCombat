/*
	Created by BauerMitFackel
*/

private ["_unit", "_groupId","_role","_uniformTexture","_insignia"];


_unit			= [_this, 0] call BIS_fnc_param;
_groupId		= [_this, 1] call BIS_fnc_param;
_role			= [_this, 2] call BIS_fnc_param;
_uniformTexture	= [_this, 3, "", [""]] call BIS_fnc_param;
_insignia		= [_this, 4, "", [""]] call BIS_fnc_param;

diag_log format["initUnit: _unit = %1, _groupId = %2, _role = %3, _uniformTexture = %4, _insignia = %5", _unit, _groupId, _role, _uniformTexture, _insignia];

// Group ID
group _unit setGroupId [_groupId]; 
_unit addEventHandler ["respawn", format ["
    _unit = _this select 0;
    group _unit setGroupId ['%1'];", _groupId
]];

// Initialize Role
_unit setVariable ["SOS_role", _role, true];

// Appearance
if (_uniformTexture != "") then {
	_unit setObjectTextureGlobal [0, _uniformTexture]; 
};

if (_insignia != "") then {
	[_unit, _insignia] call BIS_fnc_setUnitInsignia;
};