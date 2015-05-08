/*
	This script spawns a small bunker with units inside.

	Parameters:
	_this select 0: Coordinates	- Position to spawn the bunker.
	_this select 1: Integer		- Direction to spawn the bunker
	_this select 2: Side		- The side for which the units get spawned.

	Returns: Bunker

	Created by Lux0r
*/


private ["_pos","_dir","_bunker"];

_pos	= [_this, 0, [0,0,0], [[]], [2, 3]] call BIS_fnc_param;
_dir	= [_this, 1, 0, [0]] call BIS_fnc_param;
_side	= [_this, 2, east, [east]] call BIS_fnc_param;

/*[
	["Function: %1", "TTC_BASE_fnc_spawnBunkerSmall"],
	["_pos = %1", _pos], ["_dir = %1", _dir], ["_side = %1", _side]
] call TTC_CORE_fnc_log;*/


// Spawn small bunker
_bunker	= createVehicle ["Land_BagBunker_Small_F", _pos, [], 0, "CAN_COLLIDE"];
_bunker setDir _dir;
_bunker setVectorUp (surfaceNormal _pos);
_bunker allowDamage false;

// Spawn grass cutter
_cutter = createVehicle ["Land_ClutterCutter_large_F", _pos, [], 0, "CAN_COLLIDE"];

_bunker