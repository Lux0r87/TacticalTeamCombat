/*
	Created by Lux0r
*/


private ["_side","_pos","_dir","_teleporter","_table","_laptop1","_bottle","_phone","_notepad","_pen","_chair","_laptop2","_can","_suitcase","_barrel","_rack"];

_side	= [_this, 0] call BIS_fnc_param;
_pos	= [_this, 1] call BIS_fnc_param;
_dir	= [_this, 2] call BIS_fnc_param;

//[["Function: %1", "TTC_Base_fnc_spawnTeleporter"], ["_side = %1", _side], ["_pos = %1", _pos], ["_dir = %1", _dir]] call TTC_CORE_fnc_log;


// Spawn research house.
_teleporter	= createVehicle ["Land_Research_house_V1_F", _pos, [], 0, "CAN_COLLIDE"];
_teleporter setDir _dir;
_teleporter allowDamage false;

// Spawn 1. table.
_table		= createVehicle ["Land_CampingTable_F", _pos, [], 0, "CAN_COLLIDE"];
_table attachTo [_teleporter, [-1.5, 3.7, 0.45]];

_laptop1		= createVehicle ["Land_laptop_unfolded_F", _pos, [], 0, "CAN_COLLIDE"];
_laptop1 attachTo [_table, [-0.5, 0.1, 0.56]];
_laptop1 setVectorDirAndUp [[0.3,-1,0],[0,0,1]];

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

_chair		= createVehicle ["Land_CampingChair_V2_F", _pos, [], 0, "CAN_COLLIDE"];
_chair attachTo [_teleporter, [-1.9, 2.8, 0.52]];
_chair setVectorDirAndUp [[-0.2,-1,0],[0,0,1]];

// Spawn 2. table.
_table		= createVehicle ["Land_CampingTable_F", _pos, [], 0, "CAN_COLLIDE"];
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

_chair		= createVehicle ["Land_CampingChair_V2_F", _pos, [], 0, "CAN_COLLIDE"];
_chair attachTo [_teleporter, [1.9, 2.7, 0.52]];
_chair setVectorDirAndUp [[0,-1,0],[0,0,1]];

// Create suitcase.
_suitcase	= createVehicle ["Land_Suitcase_F", _pos, [], 0, "CAN_COLLIDE"];
_suitcase attachTo [_teleporter, [-0.4, 3.7, 0.28]];
_suitcase setVectorDirAndUp [[1,0,0],[0,0,1]];

// Create trash barrel.
_barrel		= createVehicle ["Land_BarrelTrash_grey_F", _pos, [], 0, "CAN_COLLIDE"];
_barrel attachTo [_teleporter, [-2.5, 0.2, 0.30]];

// Create rack.
_rack		= createVehicle ["Land_Metal_rack_F", _pos, [], 0, "CAN_COLLIDE"];
_rack attachTo [_teleporter, [-1.0, 0.01, 0.79]];
_rack setVectorDirAndUp [[0,-1,0],[0,0,1]];

// Add the 'Teleport' action for all players of this side (including JIP).
[[[_laptop1, _laptop2]], "TTC_BASE_fnc_addTeleportActions", _side, true] call BIS_fnc_MP;

_teleporter