/*
	Created by Lux0r
*/


private [
	"_side","_building","_dir","_height","_pos","_prefix","_type","_desk1","_desk2","_money","_rack","_ammo","_className","_barrel","_salesman1","_salesman2"
];

_side		= [_this, 0] call BIS_fnc_param;
_building	= [_this, 1] call BIS_fnc_param;
_dir		= [_this, 2] call BIS_fnc_param;
_height		= [_this, 3, 0, [0]] call BIS_fnc_param;

_pos		= getPos _building;
_prefix	= [_side] call TTC_CORE_fnc_getPrefix;
_type	= [_side] call TTC_CORE_fnc_getAmmoBoxType;

/*[
	["Function: %1", "TTC_Base_fnc_spawnShop"],
	["_side = %1", _side], ["_building = %1", _building], ["_height = %1", _height], ["_pos = %1", _pos], ["_prefix = %1", _prefix], ["_type = %1", _type]
] call TTC_CORE_fnc_log;*/


_createRack = {
	private ["_rack","_positions"];
	_rack	= [_pos, "Land_Metal_rack_F", _dir] call TTC_CORE_fnc_createVehicle;

	// Create land survival radios (1. row)
	_positions = [
		[-0.3, 0, -0.70],
		[0, 0, -0.70],
		[0.3, 0, -0.70]
	];

	["Land_SurvivalRadio_F", _pos, _rack, _positions, [[0,-1,0],[0,0,1]]] call TTC_CORE_fnc_attachObjectsTo;

	// Create  (2. row)
	

	// Create  (3. row)
	

	// Create radios (4. row)
	_positions = [
		[-0.45, 0, 0.63],
		[-0.3, 0, 0.63],
		[-0.15, 0, 0.63],
		[0, 0, 0.63],
		[0.15, 0, 0.63],
		[0.3, 0, 0.63],
		[0.45, 0, 0.63]
	];

	["Land_PortableLongRangeRadio_F", _pos, _rack, _positions, [[0,0,1],[0,-1,0]]] call TTC_CORE_fnc_attachObjectsTo;

	_rack;
};

_spawnSalesman = {
	private ["_pos","_group","_className","_unitPos","_unit"];	
	_pos	= _this select 0;

	_group		= createGroup _side;
	_className	= format["%1_soldier_unarmed_f", _prefix];
	_unitPos	= [((_pos select 0) - (cos(_dir + 90) * 0.3)), ((_pos select 1) + (sin(_dir + 90) * 0.3)), (_pos select 2)];
	_unit		= _group createUnit [_className, _unitPos, [], 0, "CAN_COLLIDE"];
	_unit setDir (_dir + 180);
	_unit allowDamage false;
	_unit setSkill  0;
	_unit disableAI "MOVE";

	_unit;
};

// Spawn cash desk.
_desk1		= [_pos, "Land_CashDesk_F"] call TTC_CORE_fnc_createVehicle;
_desk1 attachTo [_building, [2.55, -0.11, _height]];

// Spawn cash desk.
_desk2		= [_pos, "Land_CashDesk_F"] call TTC_CORE_fnc_createVehicle;
_desk2 attachTo [_building, [6.73, -0.11, _height]];

// Place some money on the desk.
_money		= [_pos, "Land_Money_F"] call TTC_CORE_fnc_createVehicle;
_money attachTo [_desk2, [-0.4, 0.0, 1.04]];

// Create rack.
_rack		= [] call _createRack;
_rack attachTo [_building, [1.85, 3.9, (_height + 0.9)]];
_rack setVectorDirAndUp [[-1,0,0],[0,0,1]];

// Create ammo boxes.
_className	= format["%1_CargoNet_01_ammo_F", _prefix];
_ammo		= [_pos, _className] call TTC_CORE_fnc_createAmmoBox;
_ammo attachTo [_building, [3.0, 5.4, (_height + 0.99)]];

_ammo		= [_pos, "Box_FIA_Ammo_F"] call TTC_CORE_fnc_createAmmoBox;
_ammo attachTo [_building, [5.3, 5.25, (_height + 1.49)]];
_ammo setVectorDirAndUp [[1,0,0],[0,0,1]];

// Explosives
_className	= format["Box_%1_AmmoOrd_F", _type];
_ammo		= [_pos, _className] call TTC_CORE_fnc_createAmmoBox;
_ammo attachTo [_building, [8.35, 3.90, (_height + 0.41)]];

_ammo		= [_pos, _className] call TTC_CORE_fnc_createAmmoBox;
_ammo attachTo [_building, [8.35, 3.90, (_height + 1.00)]];

_ammo		= [_pos, _className] call TTC_CORE_fnc_createAmmoBox;
_ammo attachTo [_building, [8.35, 3.90, (_height + 1.59)]];

// Ammunition
_className	= format["Box_%1_Ammo_F", _type];
_ammo		= [_pos, _className] call TTC_CORE_fnc_createAmmoBox;
_ammo attachTo [_building, [8.35, 3.15, (_height + 0.41)]];

_ammo		= [_pos, _className] call TTC_CORE_fnc_createAmmoBox;
_ammo attachTo [_building, [8.35, 3.15, (_height + 1.00)]];

_ammo		= [_pos, _className] call TTC_CORE_fnc_createAmmoBox;
_ammo attachTo [_building, [8.25, 2.60, (_height + 0.41)]];
_ammo setVectorDirAndUp [[1,0,0],[0,0,1]];

_ammo		= [_pos, _className] call TTC_CORE_fnc_createAmmoBox;
_ammo attachTo [_building, [8.25, 2.60, (_height + 1.00)]];
_ammo setVectorDirAndUp [[1,0,0],[0,0,1]];

_ammo		= [_pos, _className] call TTC_CORE_fnc_createAmmoBox;
_ammo attachTo [_building, [8.25, 2.60, (_height + 1.59)]];
_ammo setVectorDirAndUp [[1,0,0],[0,0,1]];

// Launcher
_className	= format["Box_%1_WpsLaunch_F", _type];
_ammo		= [_pos, _className] call TTC_CORE_fnc_createAmmoBox;
_ammo attachTo [_building, [7.75, 3.5, (_height + 0.30)]];
_ammo setVectorDirAndUp [[1,0,0],[0,0,1]];

_ammo		= [_pos, _className] call TTC_CORE_fnc_createAmmoBox;
_ammo attachTo [_building, [7.75, 3.5, (_height + 0.65)]];
_ammo setVectorDirAndUp [[1,0,0],[0,0,1]];

// Create AI (salesman)
_salesman1	= [getPosATL _desk1] call _spawnSalesman;
_salesman2	= [getPosATL _desk2] call _spawnSalesman;

// Add the 'Shop' action for all players of this side (including JIP).
[[[_salesman1, _salesman2]], "TTC_BASE_fnc_addShopActions", _side, true] call BIS_fnc_MP;
