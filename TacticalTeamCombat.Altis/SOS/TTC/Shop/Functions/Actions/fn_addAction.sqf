/*
	Add 'Shop' action to the given object.

	Created by Lux0r
*/


private ["_object"];

_object = [_this, 0] call BIS_fnc_param;


// Shop action
_object addAction [
	"<t color='#FFD700'>Shop</t>",
	TTC_SHOP_UI_fnc_createDialog,
	[],
	10,
	true,
	true,
	"",
	"(_this distance _target) < 4"
];
