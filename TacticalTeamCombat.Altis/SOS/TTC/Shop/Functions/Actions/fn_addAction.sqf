/*
	Add 'Shop' action to the given object.

	Created by Lux0r
*/


private ["_object","_avaiableAtSector","_avaiableAtMobile","_avaiableAtHarbor","_avaiableAtAirport"];

_object				= [_this, 0] call BIS_fnc_param;
_avaiableAtSector	= [_this, 1, false, [false]] call BIS_fnc_param;
_avaiableAtMobile	= [_this, 2, false, [false]] call BIS_fnc_param;
_avaiableAtHarbor	= [_this, 3, false, [false]] call BIS_fnc_param;
_avaiableAtAirport	= [_this, 4, false, [false]] call BIS_fnc_param;


// Shop action
_object addAction [
	"<t color='#FFD700'>Shop</t>",
	TTC_SHOP_UI_fnc_createDialog,
	[_avaiableAtSector, _avaiableAtMobile, _avaiableAtHarbor, _avaiableAtAirport],
	10,
	true,
	true,
	"",
	"(_this distance _target) < 4"
];
