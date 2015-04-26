/*
	Created by Lux0r
*/


private [
	"_side","_pos","_dir","_teleporter","_tablePos","_table","_laptop1","_bottle","_phone","_notepad","_pen","_chairPos","_chair","_laptop2","_can",
	"_suitcasePos","_suitcase","_barrelPos","_barrel","_rackPos","_rack"
];

_side	= [_this, 0] call BIS_fnc_param;
_pos	= [_this, 1] call BIS_fnc_param;
_dir	= [_this, 2] call BIS_fnc_param;

[["Function: %1", "TTC_Base_fnc_spawnTeleporter"], ["_pos = %1", _pos], ["_dir = %1", _dir]] call TTC_CORE_fnc_log;


// Spawn large bunker
_teleporter	= createVehicle ["Land_Research_house_V1_F", _pos, [], 0, "CAN_COLLIDE"];
_teleporter setDir _dir;

// Spawn 1. table
_tablePos	= [((_pos select 0) - (cos(_dir + 45) * 2.2)), ((_pos select 1) + (sin(_dir + 45) * 3.8)), 0.4];
_table		= createVehicle ["Land_CampingTable_F", _tablePos, [], 0, "CAN_COLLIDE"];
_table attachTo [_teleporter, [-1.5, 3.7, 0.45]];

_laptop1		= createVehicle ["Land_laptop_unfolded_F", _pos, [], 0, "CAN_COLLIDE"];
_laptop1 attachTo [_table, [-0.5, 0.1, 0.56]];
_laptop1 setVectorDirAndUp [[0.5,-1,0],[0,0,1]];

_bottle		= createVehicle ["Land_BottlePlastic_V2_F", _pos, [], 0, "CAN_COLLIDE"];
_bottle attachTo [_table, [-0.2, 0.2, 0.54]];

_phone	= createVehicle ["Land_MobilePhone_smart_F", _pos, [], 0, "CAN_COLLIDE"];
_phone attachTo [_table, [-0.85, -0.05, 0.41]];
_phone setVectorDirAndUp [[0,-1,0],[0,0,1]];

_notepad	= createVehicle ["Land_Notepad_F", _pos, [], 0, "CAN_COLLIDE"];
_notepad attachTo [_table, [0.1, -0.1, 0.42]];
_notepad setVectorDirAndUp [[-1,0,0],[0,0,1]];

_pen		= createVehicle ["Land_PenBlack_F", _pos, [], 0, "CAN_COLLIDE"];
_pen attachTo [_table, [0.2, -0.1, 0.415]];

_chairPos	= [((_pos select 0) - (cos(_dir + 45) * 3)), ((_pos select 1) + (sin(_dir + 45) * 2.5)), 0.4];
_chair		= createVehicle ["Land_CampingChair_V2_F", _chairPos, [], 0, "CAN_COLLIDE"];
_chair setDir (_dir + 200);

// Spawn 2. table
_tablePos	= [((_pos select 0) - (cos(_dir + 135) * 2)), ((_pos select 1) + (sin(_dir + 135) * 3.6)), 0.4];
_table		= createVehicle ["Land_CampingTable_F", _tablePos, [], 0, "CAN_COLLIDE"];
_table attachTo [_teleporter, [1.5, 3.7, 0.45]];

_laptop2		= createVehicle ["Land_laptop_unfolded_F", _pos, [], 0, "CAN_COLLIDE"];
_laptop2 attachTo [_table, [0.3, 0.1, 0.56]];
_laptop2 setVectorDirAndUp [[0,-1,0],[0,0,1]];

_bottle		= createVehicle ["Land_BottlePlastic_V2_F", _pos, [], 0, "CAN_COLLIDE"];
_bottle attachTo [_table, [-0.15, 0.25, 0.54]];
_bottle setVectorDirAndUp [[-1,0,0],[0,0,1]];

_bottle		= createVehicle ["Land_BottlePlastic_V2_F", _pos, [], 0, "CAN_COLLIDE"];
_bottle attachTo [_table, [-0.3, 0.25, 0.54]];

_can		= createVehicle ["Land_Can_V3_F", _pos, [], 0, "CAN_COLLIDE"];
_can attachTo [_table, [-0.2, 0.15, 0.44]];

_can		= createVehicle ["Land_Can_V3_F", _pos, [], 0, "CAN_COLLIDE"];
_can attachTo [_table, [-0.28, 0.15, 0.44]];
_can setVectorDirAndUp [[-1,1,0],[0,0,1]];

_can		= createVehicle ["Land_Can_V2_F", _pos, [], 0, "CAN_COLLIDE"];
_can attachTo [_table, [-0.35, 0.2, 0.44]];

_can		= createVehicle ["Land_Can_V1_F", _pos, [], 0, "CAN_COLLIDE"];
_can attachTo [_table, [-0.4, 0.25, 0.44]];

_can		= createVehicle ["Land_Can_Dented_F", _pos, [], 0, "CAN_COLLIDE"];
_can attachTo [_table, [0.65, 0, 0.43]];

_chairPos	= [((_pos select 0) - (cos(_dir + 135) * 2.4)), ((_pos select 1) + (sin(_dir + 135) * 2.7)), 0.4];
_chair		= createVehicle ["Land_CampingChair_V2_F", _chairPos, [], 0, "CAN_COLLIDE"];
_chair setDir (_dir + 180);

// Create suitcase.
_suitcasePos	= [((_pos select 0) - (cos(_dir + 80) * 2.7)), ((_pos select 1) + (sin(_dir + 80) * 2.8)), 0.4];
_suitcase		= createVehicle ["Land_Suitcase_F", _suitcasePos, [], 0, "CAN_COLLIDE"];
_suitcase setDir (_dir + 90);

// Create trash barrel.
_barrelPos	= [((_pos select 0) - (cos(_dir - 15) * 2.7)), ((_pos select 1) + (sin(_dir - 15) * 2.7)), 0.4];
_barrel		= createVehicle ["Land_BarrelTrash_grey_F", _barrelPos, [], 0, "CAN_COLLIDE"];

// Create trash barrel.
_rackPos	= [((_pos select 0) - (cos(_dir - 45) * 1.3)), ((_pos select 1) + (sin(_dir - 45) * 1.3)), 0.6];
_rack		= createVehicle ["Land_Metal_rack_F", _rackPos, [], 0, "CAN_COLLIDE"];
_rack setDir (_dir + 180);

// Add the 'Teleport' action for all players of this side (including JIP).
[[[_laptop1, _laptop2]], "TTC_BASE_fnc_addActions", _side, true] call BIS_fnc_MP;

_teleporter