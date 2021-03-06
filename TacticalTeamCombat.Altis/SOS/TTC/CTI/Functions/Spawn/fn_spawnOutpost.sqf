/*
	Created by Lux0r
*/


#define TTC_maps		["Land_Map_F","Land_Map_unfolded_F"]
#define TTC_files		["Land_File1_F","Land_File2_F","Land_FilePhotos_F"]
#define TTC_photos		["Land_Photos_V1_F","Land_Photos_V2_F","Land_Photos_V3_F"]
#define TTC_drinks		["Land_BottlePlastic_V1_F","Land_Can_Dented_F","Land_Can_Rusty_F","Land_Can_V1_F","Land_Can_V2_F","Land_Can_V3_F","Land_TacticalBacon_F"]
#define TTC_smallItems	(TTC_maps + TTC_files + TTC_photos + TTC_drinks)


_createSandbag = {
	private ["_pos","_className","_dir","_sandbag"];
	_pos		= _this select 0;
	_className	= _this select 1;
	_dir		= _this select 2;

	_sandbag	= [_pos, _className, _dir] call TTC_CORE_fnc_createVehicle;
	_sandbag setVectorUp (surfaceNormal _pos);

	_sandbag;
};

_createSandbags = {
	private ["_pos","_dir","_sandbagPos","_sandbag","_bagCorner"];
	_pos		= _this select 0;
	_dir		= _this select 1;

	_sandbagPos	= [((_pos select 0) - (cos(_dir + 90) * 1.5)), ((_pos select 1) + (sin(_dir + 90) * 1.5)), -0.1];
	_sandbag	= [_sandbagPos, "Land_BagFence_Long_F", (_dir + 90)] call _createSandbag;
	_sandbag setVectorUp (surfaceNormal _sandbagPos);

	_bagCorner	= [_pos, "Land_BagFence_Corner_F", (_dir + 270)] call _createSandbag;
	_bagCorner attachTo [_sandbag, [-2.05, 0.23, 0.0]];
	_bagCorner setVectorDirAndUp [[0,-1,0], (surfaceNormal (getPos _bagCorner))];

	_sandbagPos	= [((_pos select 0) - (cos(_dir + 270) * 1.5)), ((_pos select 1) + (sin(_dir + 270) * 1.5)), -0.1];
	_sandbag	= [_sandbagPos, "Land_BagFence_Long_F", (_dir + 90)] call _createSandbag;
	_sandbag setVectorUp (surfaceNormal _sandbagPos);

	_bagCorner	= [_pos, "Land_BagFence_Corner_F", (_dir + 180)] call _createSandbag;
	_bagCorner attachTo [_sandbag, [2.0, 0.38, 0.0]];
	_bagCorner setVectorDirAndUp [[1,0,0], (surfaceNormal (getPos _bagCorner))];
};


private [
	"_sector","_dir","_side","_pos","_flag","_flagPos","_cutterPos","_cutter","_className","_camoNetPos","_camoNet","_locations","_direction","_distance",
	"_reference","_firePos","_fire","_itemType","_safePos","_item"
];

_sector	= [_this, 0] call BIS_fnc_param;
_dir	= [_this, 1, 0, [0]] call BIS_fnc_param;
_side	= [_this, 2] call BIS_fnc_param;

_pos	= getPos _sector;

//[_sector, "TTC_CTI_fnc_spawnOutpost", [["_dir = %1", _dir], ["_side = %1", _side], ["_pos = %1", _pos]]] call TTC_CTI_fnc_logSector;


// Create a flag
_flag = [_pos, "FlagPole_F"] call TTC_CORE_fnc_createVehicle;
_flag setDir _dir;
[_flag, _side] call TTC_CORE_fnc_setFlagTexture;
_flagPos = getPos _flag;

// Spawn grass cutter
_cutterPos	= [((_flagPos select 0) - (cos(_dir) * 3)), ((_flagPos select 1) + (sin(_dir) * 3)), 0];
_cutter = createVehicle ["Land_ClutterCutter_large_F", _cutterPos, [], 0, "CAN_COLLIDE"];

_cutterPos	= [((_flagPos select 0) - (cos(_dir + 180) * 3)), ((_flagPos select 1) + (sin((_dir + 180)) * 3)), 0];
_cutter = createVehicle ["Land_ClutterCutter_large_F", _cutterPos, [], 0, "CAN_COLLIDE"];

// Create a camouflage net.
_className = switch (_side) do {
	case west: {
		"CamoNet_BLUFOR_open_F";
	};
	case east: {
		"CamoNet_OPFOR_open_F";
	};
	case resistance: {
		"CamoNet_INDP_open_F";
	};
	default {
		"";	
	};
};

_camoNetPos	= [((_flagPos select 0) - (cos(_dir) * 0.25)), ((_flagPos select 1) + (sin(_dir) * 0.25)), 0];
_camoNet	= [_camoNetPos, _className, _dir] call TTC_CORE_fnc_createVehicle;
_camoNet setVectorUp (surfaceNormal _camoNetPos);

// Create sandbags.
_locations = [
	[_dir,			6.0] ,
	[(_dir + 90),	4.0] ,
	[(_dir + 180),	6.0] ,
	[(_dir + 270),	4.0]
];

{
	_direction	= _x select 0;
	_distance	= _x select 1;
	_reference	= [((_flagPos select 0) - (cos(_direction) * _distance)), ((_flagPos select 1) + (sin(_direction) * _distance)), 0];

	[_reference, _direction] call _createSandbags;
} forEach _locations;

// Create a burning camp fire.
_firePos	= [((_flagPos select 0) - (cos(_dir) * 1.3)), ((_flagPos select 1) + (sin(_dir) * 1.3)), 0.1];
_fire		= [_firePos, "Campfire_burning_F", (_dir)] call TTC_CORE_fnc_createVehicle;
_fire setVectorUp (surfaceNormal _firePos);

// Spawn small items
_random = [5, 10] call BIS_fnc_randomInt;

for "_x" from 1 to _random do {
	_itemType	= TTC_smallItems call BIS_fnc_selectRandom;
	_safePos	= [_firePos, 0.9, 3, 0, 0, 1000, 0, [], [_flagPos, _flagPos]] call BIS_fnc_findSafePos;
	_item		= [_safePos, _itemType, (random 360)] call TTC_CORE_fnc_createVehicle;
};

// Spawn sector shop.
_shopPos = [((_flagPos select 0) - (cos(_dir + 180) * 0.7)), ((_flagPos select 1) + (sin(_dir + 180) * 0.7)), 0];
[_sector, _side, _shopPos, (_dir + 180)] call TTC_BASE_fnc_spawnSectorShop;

_flag
