/*
	Created by Lux0r
*/


private ["_sector","_side","_pos","_dir","_type","_group","_logic","_table","_phone1","_phone2","_className","_ammo"];

_sector	= [_this, 0] call BIS_fnc_param;
_side	= [_this, 1] call BIS_fnc_param;
_pos	= [_this, 2] call BIS_fnc_param;
_dir	= [_this, 3] call BIS_fnc_param;

_type	= [_side] call TTC_CORE_fnc_getAmmoBoxType;

/*[
	["Function: %1", "TTC_Base_fnc_spawnSectorShop"],
	["_side = %1", _side], ["_pos = %1", _pos], ["_dir = %1", _dir], ["_type = %1", _type]
] call TTC_CORE_fnc_log;*/


// Create a game logic as helper.
_group		= createGroup _side;
_logic		= _group createUnit ["Logic", _pos, [], 0, "CAN_COLLIDE"];
_logic setDir _dir;
_logic setVectorUp (surfaceNormal _pos);

// Create a  table.
_table		= [_pos, "Land_WoodenTable_small_F", _dir] call TTC_CORE_fnc_createVehicle;
_table attachTo [_logic, [0, 0, 0.43]];

// Place satellite phones on the desk.
_phone1		= [_pos, "Land_SatellitePhone_F"] call TTC_CORE_fnc_createVehicle;
_phone1 attachTo [_table, [-0.1, -0.35, 0.61]];
_phone1 setVectorDirAndUp [[1,0,0],[0,0,1]];
_phone1 setVariable["TTC_accordingSector", _sector, true];

_phone2		= [_pos, "Land_SatellitePhone_F"] call TTC_CORE_fnc_createVehicle;
_phone2 attachTo [_table, [0.0, 0.35, 0.61]];
_phone2 setVectorDirAndUp [[0,-1,0],[0,0,1]];
_phone2 setVariable["TTC_accordingSector", _sector, true];

// Create ammo box.
_className	= format["Box_%1_Ammo_F", _type];
_ammo		= [_pos, _className, _dir] call TTC_CORE_fnc_createAmmoBox;
_ammo attachTo [_logic, [0, 0, 0.27]];

// Add the 'Shop' action for all players (including JIP).
[[[_phone1, _phone2], TTC_SHOP_LOCATION_SECTOR], "TTC_BASE_fnc_addShopActions", true, true] call BIS_fnc_MP;
