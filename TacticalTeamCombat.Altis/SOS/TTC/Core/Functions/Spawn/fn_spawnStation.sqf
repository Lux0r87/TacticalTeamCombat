/*
	Created by Lux0r
*/


private ["_pos","_dir","_side","_flag","_className","_fencePos","_fence","_fenceTop","_shopPos"];

_pos	= [_this, 0, [0,0,0], [[]], [2, 3]] call BIS_fnc_param;
_dir	= [_this, 1, 0, [0]] call BIS_fnc_param;
_side	= [_this, 2] call BIS_fnc_param;

/*[
	["Function: %1", "TTC_CORE_fnc_spawnStation"],
	["_pos = %1", _pos], ["_dir = %1", _dir], ["_side = %1", _side]
] call TTC_CORE_fnc_log;*/


// Create a flag
_flag = [_pos, "FlagPole_F"] call TTC_CORE_fnc_createVehicle;
_flag setDir _dir;
[_flag, _side] call TTC_CORE_fnc_setFlagTexture;

// Create sandbags.
_className	= "Land_BagFence_Round_F";
_fencePos	= [((_pos select 0) - (cos(_dir + 45) * 2.7)), ((_pos select 1) + (sin(_dir + 45) * 2.7)), 0];
_fence		= [_fencePos, _className, (_dir + 135)] call TTC_CORE_fnc_createVehicle;
_fence setVectorUp (surfaceNormal _fencePos);

_fenceTop		= [_fencePos, _className, (_dir + 135)] call TTC_CORE_fnc_createVehicle;
_fenceTop attachTo [_fence, [0.0, 0.0, 0.8]];

_fencePos	= [((_pos select 0) - (cos(_dir + 135) * 2.7)), ((_pos select 1) + (sin(_dir + 135) * 2.7)), 0];
_fence		= [_fencePos, _className, (_dir + 225)] call TTC_CORE_fnc_createVehicle;
_fence setVectorUp (surfaceNormal _fencePos);

_fenceTop		= [_fencePos, _className, (_dir + 225)] call TTC_CORE_fnc_createVehicle;
_fenceTop attachTo [_fence, [0.0, 0.0, 0.8]];

_fencePos	= [((_pos select 0) - (cos(_dir + 225) * 2.5)), ((_pos select 1) + (sin(_dir + 225) * 2.5)), 0];
_fence		= [_fencePos, _className, (_dir + 325)] call TTC_CORE_fnc_createVehicle;
_fence setVectorUp (surfaceNormal _fencePos);

_fenceTop		= [_fencePos, _className, (_dir + 325)] call TTC_CORE_fnc_createVehicle;
_fenceTop attachTo [_fence, [0.0, 0.0, 0.8]];

_fencePos	= [((_pos select 0) - (cos(_dir + 325) * 2.5)), ((_pos select 1) + (sin(_dir + 325) * 2.5)), 0];
_fence		= [_fencePos, _className, (_dir + 45)] call TTC_CORE_fnc_createVehicle;
_fence setVectorUp (surfaceNormal _fencePos);

_fenceTop		= [_fencePos, _className, (_dir + 45)] call TTC_CORE_fnc_createVehicle;
_fenceTop attachTo [_fence, [0.0, 0.0, 0.8]];

// Spawn outdoor shop.
_shopPos = [((_pos select 0) - (cos(_dir + 90) * 0.5)), ((_pos select 1) + (sin(_dir + 90) * 0.5)), 0];
[_side, _shopPos, (_dir + 90)] call TTC_BASE_fnc_spawnOutdoorShop;

_flag