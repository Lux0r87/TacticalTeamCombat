/*
	Add 'Shop' action to the given object.

	Created by Lux0r
*/


private ["_object","_location"];

_object		= [_this, 0] call BIS_fnc_param;
_location	= [_this, 1, TTC_SHOP_LOCATION_BASE, [0]] call BIS_fnc_param;


// Shop action
_object addAction [
	"<t color='#FFD700'>Shop</t>",
	TTC_SHOP_UI_fnc_createDialog,
	[_location],
	10,
	true,
	true,
	"",
	"((_this distance _target) < 4) &&
	(((_target getVariable['TTC_accordingSector', objNull]) getVariable['TTC_CTI_sector_side', side _this]) == (side _this))"
];
