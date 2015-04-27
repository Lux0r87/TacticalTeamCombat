/*
	Function to create multiple objects and attach them to the given object.

	Created by Lux0r
*/


private ["_className","_pos","_object","_positions","_dirAndUp"];

_className	= [_this, 0] call BIS_fnc_param;
_pos		= [_this, 1] call BIS_fnc_param;
_object		= [_this, 2] call BIS_fnc_param;
_positions	= [_this, 3] call BIS_fnc_param;
_dirAndUp	= [_this, 4, [[0,1,0],[0,0,1]], [[]]] call BIS_fnc_param;

{
	_veh	= createVehicle [_className, _pos, [], 0, "CAN_COLLIDE"];
	_veh attachTo [_object, _x];
	_veh setVectorDirAndUp _dirAndUp;
} forEach _positions;
