/*
	Created by Lux0r
*/



private ["_flag","_side","_texture"];


_flag	= [_this, 0] call BIS_fnc_param;
_side	= [_this, 1] call BIS_fnc_param;

/*[
	["Function: %1", "TTC_CORE_fnc_setFlagTexture"],
	["_flag = %1", _flag], ["_side = %1", _side]
] call TTC_CORE_fnc_log;*/


_texture = [_side] call TTC_CORE_fnc_getFlagForSide;
_flag setFlagTexture _texture;
