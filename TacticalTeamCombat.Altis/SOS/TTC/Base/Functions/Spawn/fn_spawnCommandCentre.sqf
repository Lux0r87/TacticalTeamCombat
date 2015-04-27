/*
	Created by Lux0r
*/


private ["_side","_pos","_dir","_table"];

_side	= [_this, 0] call BIS_fnc_param;
_pos	= [_this, 1] call BIS_fnc_param;
_dir	= [_this, 2] call BIS_fnc_param;

//[["Function: %1", "TTC_Base_fnc_spawnCommandCentre"], ["_side = %1", _side], ["_pos = %1", _pos], ["_dir = %1", _dir]] call TTC_CORE_fnc_log;


// Spawn desk.
_table	= createVehicle ["Land_CampingTable_F", _pos, [], 0, "CAN_COLLIDE"];
_table setDir _dir;
