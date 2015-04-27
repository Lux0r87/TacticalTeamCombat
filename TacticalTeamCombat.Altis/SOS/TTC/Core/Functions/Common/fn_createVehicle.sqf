/*
	Created by Lux0r
*/


private ["_pos","_className","_dir","_allowDamage""_veh"];

_pos			= [_this, 0, [0, 0], [[]], [2, 3]] call BIS_fnc_param;
_className		= [_this, 1, "", [""]] call BIS_fnc_param;
_dir			= [_this, 2, 0, [0]] call BIS_fnc_param;
_allowDamage	= [_this, 3, false, [false]] call BIS_fnc_param;

/*[
	["Function: %1", "TTC_CORE_fnc_createVehicle"],
	["_pos = %1", _pos], ["_className = %1", _className], ["_dir = %1", _dir], ["_allowDamage = %1", _allowDamage]
] call TTC_CORE_fnc_log;*/


_veh	= createVehicle [_className, _pos, [], 0, "CAN_COLLIDE"];
_veh setDir _dir;
_veh allowDamage _allowDamage;

_veh