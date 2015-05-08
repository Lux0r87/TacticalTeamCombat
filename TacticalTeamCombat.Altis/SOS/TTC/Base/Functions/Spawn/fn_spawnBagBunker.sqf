/*
	Created by Lux0r
*/


private ["_pos","_dir","_side","_towerClass","_bunker","_fence"];

_pos	= [_this, 0, [0,0,0], [[]], [2, 3]] call BIS_fnc_param;
_dir	= [_this, 1, 0, [0]] call BIS_fnc_param;
_side	= [_this, 2] call BIS_fnc_param;

/*[
	["Function: %1", "TTC_BASE_fnc_spawnBagBunker"],
	["_pos = %1", _pos], ["_dir = %1", _dir], ["_side = %1", _side]
] call TTC_CORE_fnc_log;*/


// Spawn bunker
_bunker = createVehicle ["Land_BagBunker_Tower_F", _pos, [], 0, "CAN_COLLIDE"];
_bunker setDir _dir;
_bunker allowDamage false;

// Spawn bag fences.
_fence = createVehicle ["Land_BagFence_Long_F", _pos, [], 0, "CAN_COLLIDE"];
_fence attachTo [_bunker, [1.75, 0.7, 1.0]];
_fence setVectorDirAndUp [[1,0,0],[0,0,1]];
_fence allowDamage false;

_fence = createVehicle ["Land_BagFence_Short_F", _pos, [], 0, "CAN_COLLIDE"];
_fence attachTo [_bunker, [1.75, 2.5, 1.0]];
_fence setVectorDirAndUp [[1,0,0],[0,0,1]];
_fence allowDamage false;

_fence = createVehicle ["Land_BagFence_Long_F", _pos, [], 0, "CAN_COLLIDE"];
_fence attachTo [_bunker, [0.0, 3.25, 1.0]];
_fence allowDamage false;

_fence = createVehicle ["Land_BagFence_Short_F", _pos, [], 0, "CAN_COLLIDE"];
_fence attachTo [_bunker, [-1.75, 2.5, 1.0]];
_fence setVectorDirAndUp [[1,0,0],[0,0,1]];
_fence allowDamage false;

_fence = createVehicle ["Land_BagFence_Long_F", _pos, [], 0, "CAN_COLLIDE"];
_fence attachTo [_bunker, [-1.75, 0.7, 1.0]];
_fence setVectorDirAndUp [[1,0,0],[0,0,1]];
_fence allowDamage false;

_bunker