/*
	Add actions to the given unit.

	Created by Lux0r
*/


private ["_objects"];

_objects = [_this, 0] call BIS_fnc_param;


// Teleport
{
	[_x] call TTC_TP_fnc_addAction;
} forEach _objects;