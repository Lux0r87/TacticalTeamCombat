/*
	Created by Lux0r
*/


private ["_sector","_dir","_side","_pos","_towerClass","_bunker","_fence","_flag","_shopPos"];

_sector	= [_this, 0] call BIS_fnc_param;
_dir	= [_this, 1, 0, [0]] call BIS_fnc_param;
_side	= [_this, 2] call BIS_fnc_param;

_pos	= getPos _sector;

//[_sector, "TTC_CTI_fnc_spawnBagBunker", [["_dir = %1", _dir], ["_side = %1", _side], ["_pos = %1", _pos]]] call TTC_CTI_fnc_logSector;


// Spawn bunker
_bunker = [_pos, "Land_BagBunker_Tower_F", _dir] call TTC_CORE_fnc_createVehicle;
_bunker setVectorUp (surfaceNormal _pos);

// Spawn bag fences.
_fence = [_pos, "Land_BagFence_Long_F"] call TTC_CORE_fnc_createVehicle;
_fence attachTo [_bunker, [1.75, 0.7, 1.0]];
_fence setVectorDirAndUp [[1,0,0],[0,0,1]];

_fence = [_pos, "Land_BagFence_Short_F"] call TTC_CORE_fnc_createVehicle;
_fence attachTo [_bunker, [1.75, 2.5, 1.0]];
_fence setVectorDirAndUp [[1,0,0],[0,0,1]];

_fence = [_pos, "Land_BagFence_Long_F"] call TTC_CORE_fnc_createVehicle;
_fence attachTo [_bunker, [0.0, 3.25, 1.0]];

_fence = [_pos, "Land_BagFence_Short_F"] call TTC_CORE_fnc_createVehicle;
_fence attachTo [_bunker, [-1.75, 2.5, 1.0]];
_fence setVectorDirAndUp [[1,0,0],[0,0,1]];

_fence = [_pos, "Land_BagFence_Long_F"] call TTC_CORE_fnc_createVehicle;
_fence attachTo [_bunker, [-1.75, 0.7, 1.0]];
_fence setVectorDirAndUp [[1,0,0],[0,0,1]];

// Create a flag with the texture for this side.
_flag = [_pos, "FlagPole_F"] call TTC_CORE_fnc_createVehicle;
_flag attachTo [_bunker, [-1.65, 3.48, 4.0]];
_flag setVectorDir (vectorDir _bunker);
[_flag, _side] call TTC_CORE_fnc_setFlagTexture;
_bunker setVariable ["TTC_CORE_flag", _flag];

// Spawn sector shop.
_shopPos = [((_pos select 0) - (cos(_dir) * 1.1)), ((_pos select 1) + (sin(_dir) * 1.1)), 0];
[_sector, _side, _shopPos, (_dir + 180)] call TTC_BASE_fnc_spawnSectorShop;

_bunker
