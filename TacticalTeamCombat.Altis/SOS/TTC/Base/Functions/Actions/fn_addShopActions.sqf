/*
	Add 'Shop' action to the given objects.

	Created by Lux0r
*/


private ["_objects"];

_objects = [_this, 0] call BIS_fnc_param;


// Shop
{
	[_x] call TTC_SHOP_fnc_addAction;
} forEach _objects;