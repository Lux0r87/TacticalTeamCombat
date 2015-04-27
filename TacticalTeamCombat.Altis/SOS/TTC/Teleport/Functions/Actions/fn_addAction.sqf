/*
	Add 'Teleport' action to the given object.

	Created by Lux0r
*/


private ["_object"];

_object = [_this, 0] call BIS_fnc_param;


// Teleport action
_object addAction [
	"<t color='#2200FF'>Teleport</t>",
	TTC_TP_UI_fnc_createDialog,
	[],
	10,
	true,
	true,
	"",
	"(_this distance _target) < 3"
];
