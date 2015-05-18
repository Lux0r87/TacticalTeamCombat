/*
	Created by Lux0r
*/


disableSerialization;


private ["_basePos","_display","_control"];


waitUntil {
	_basePos	= getMarkerPos format ["mrk_Base_%1", side player];
	_display	= if (isServer) then {findDisplay 52;} else {findDisplay 53;};
	_control	= _display displayCtrl 51;
	format["%1", _basePos] != "[0,0,0]" && !isNull(_control)
};

_control ctrlMapAnimAdd [3, 0.6, _basePos];
ctrlMapAnimCommit _control;

waitUntil {ctrlMapAnimDone _control};

_control ctrlMapAnimAdd [2, 0.15, _basePos];
ctrlMapAnimCommit _control;
