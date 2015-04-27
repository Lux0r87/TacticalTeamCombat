/*
	Created by Lux0r
*/


private [
	"_side","_pos","_dir","_prefix","_type","_deskPos","_desk","_cashDeskPos1","_cashDesk","_cashDeskPos2","_shelvesPos","_shelves","_reference",
	"_positions","_rackPos","_rack","_ammoPos","_ammo","_className","_palletPos","_pallet","_barrelPos","_barrel","_salesman1","_salesman2"
];

_side	= [_this, 0] call BIS_fnc_param;
_pos	= [_this, 1] call BIS_fnc_param;
_dir	= [_this, 2] call BIS_fnc_param;

_prefix	= [_side] call TTC_CORE_fnc_getPrefix;
_type	= [_side] call TTC_CORE_fnc_getAmmoBoxType;

/*[
	["Function: %1", "TTC_Base_fnc_spawnShop"],
	["_side = %1", _side], ["_pos = %1", _pos], ["_dir = %1", _dir], ["_prefix = %1", _prefix], ["_type = %1", _type]
] call TTC_CORE_fnc_log;*/


_spawnSalesman = {
	private ["_pos","_group","_className","_unitPos","_unit"];	
	_pos = _this select 0;

	_group		= createGroup _side;
	_className	= format["%1_soldier_unarmed_f", _prefix];
	_unitPos	= [((_pos select 0) - (cos(_dir + 90) * 0.3)), ((_pos select 1) + (sin(_dir + 90) * 0.3)), 0];
	_unit		= _group createUnit [_className, _unitPos, [], 0, "CAN_COLLIDE"];
	_unit setDir (_dir + 180);
	_unit allowDamage false;
	_unit setSkill  0;
	_unit disableAI "MOVE";

	_unit;
};

//_desk		= createVehicle ["Land_PaperBox_open_full_F", _pos, [], 0, "CAN_COLLIDE"];

// Spawn desks.
_deskPos	= [((_pos select 0) - (cos(_dir + 270) * 2.5)), ((_pos select 1) + (sin(_dir + 270) * 2.5)), 0];
_desk		= [_deskPos, "Land_TableDesk_F", _dir] call TTC_CORE_fnc_createVehicle;

_cashDeskPos1	= [((_deskPos select 0) - (cos(_dir) * 1.75)), ((_deskPos select 1) + (sin(_dir) * 1.75)), 0];
_cashDesk		= [_cashDeskPos1, "Land_CashDesk_F", _dir] call TTC_CORE_fnc_createVehicle;

_cashDeskPos2	= [((_deskPos select 0) - (cos(_dir + 180) * 1.75)), ((_deskPos select 1) + (sin(_dir + 180) * 1.75)), 0];
_cashDesk		= [_cashDeskPos2, "Land_CashDesk_F", _dir] call TTC_CORE_fnc_createVehicle;

_deskPos	= [((_cashDeskPos1 select 0) - (cos(_dir + 23) * 1.35)), ((_cashDeskPos1 select 1) + (sin(_dir + 23) * 1.35)), 0];
_desk		= [_deskPos, "Land_TableDesk_F", (_dir + 90)] call TTC_CORE_fnc_createVehicle;

_deskPos	= [((_cashDeskPos2 select 0) - (cos(_dir + 157) * 1.35)), ((_cashDeskPos2 select 1) + (sin(_dir + 157) * 1.35)), 0];
_desk		= [_deskPos, "Land_TableDesk_F", (_dir - 90)] call TTC_CORE_fnc_createVehicle;

// Create shelves (metal).
_shelvesPos	= [((_pos select 0) - (cos(_dir + 90) * 1.5)), ((_pos select 1) + (sin(_dir + 90) * 1.5)), 0];
_shelves	= [_shelvesPos, "Land_ShelvesMetal_F", _dir] call TTC_CORE_fnc_createVehicle;

// Create a reference point at the shelves location.
_reference	= _shelvesPos;

// Create round (right side; 1. row)
_positions = [
	[0.19, -0.8, 0.30],
	[0.19, -0.6, 0.30],
	[0.19, -0.4, 0.30],
	[0.19, -0.2, 0.30],
	[0.19, 0, 0.30],
	[0.19, 0.2, 0.30],
	[0.19, 0.4, 0.30],
	[0.19, 0.6, 0.30],
	[0.19, 0.8, 0.30]
];

["Land_Ammobox_rounds_F", _reference, _shelves, _positions] call TTC_CORE_fnc_attachObjectsTo;

// Create round (right side; 2. row)
_positions = [
	[0.19, -0.4, 0.66],
	[0.19, -0.2, 0.66],
	[0.19, 0, 0.66],
	[0.19, 0.2, 0.66],
	[0.19, 0.4, 0.66],
	[0.19, 0.6, 0.66],
	[0.19, 0.8, 0.66]
];

["Land_Ammobox_rounds_F", _reference, _shelves, _positions] call TTC_CORE_fnc_attachObjectsTo;

// Create round (right side; 3. row)
_positions = [
	[0.18, -0.75, 0.91],
	[0.18, -0.6, 0.91],
	[0.18, -0.45, 0.91],
	[0.18, -0.3, 0.91],
	[0.18, -0.15, 0.91],
	[0.18, 0, 0.91],
	[0.18, 0.15, 0.91],
	[0.18, 0.3, 0.91],
	[0.18, 0.45, 0.91],
	[0.18, 0.6, 0.91],
	[0.18, 0.75, 0.91]
];

["Land_Magazine_rifle_F", _reference, _shelves, _positions, [[-1,0,0],[0,0,1]]] call TTC_CORE_fnc_attachObjectsTo;

// Create round (right side; 4. row)
_positions = [
	[0.18, -0.75, 1.26],
	[0.18, -0.6, 1.26],
	[0.18, -0.45, 1.26],
	[0.18, -0.3, 1.26],
	[0.18, -0.15, 1.26],
	[0.18, 0, 1.26],
	[0.18, 0.15, 1.26],
	[0.18, 0.3, 1.26],
	[0.18, 0.45, 1.26],
	[0.18, 0.6, 1.26],
	[0.18, 0.75, 1.26]
];

["Land_Magazine_rifle_F", _reference, _shelves, _positions, [[-1,0,0],[0,0,1]]] call TTC_CORE_fnc_attachObjectsTo;

// Create round (left side; 3. row)
_positions = [
	[-0.18, -0.75, 0.91],
	[-0.18, -0.6, 0.91],
	[-0.18, -0.45, 0.91],
	[-0.18, -0.3, 0.91],
	[-0.18, -0.15, 0.91],
	[-0.18, 0, 0.91],
	[-0.18, 0.15, 0.91],
	[-0.18, 0.3, 0.91],
	[-0.18, 0.45, 0.91],
	[-0.18, 0.6, 0.91],
	[-0.18, 0.75, 0.91]
];

["Land_Magazine_rifle_F", _reference, _shelves, _positions, [[1,0,0],[0,0,1]]] call TTC_CORE_fnc_attachObjectsTo;

// Create round (left side; 4. row)
_positions = [
	[-0.18, -0.75, 1.26],
	[-0.18, -0.6, 1.26],
	[-0.18, -0.45, 1.26],
	[-0.18, -0.3, 1.26],
	[-0.18, -0.15, 1.26],
	[-0.18, 0, 1.26],
	[-0.18, 0.15, 1.26],
	[-0.18, 0.3, 1.26],
	[-0.18, 0.45, 1.26],
	[-0.18, 0.6, 1.26],
	[-0.18, 0.75, 1.26]
];

["Land_Magazine_rifle_F", _reference, _shelves, _positions, [[1,0,0],[0,0,1]]] call TTC_CORE_fnc_attachObjectsTo;

// Create shelves (metal).
_shelvesPos	= [((_pos select 0) - (cos(_dir + 90) * 3.5)), ((_pos select 1) + (sin(_dir + 90) * 3.5)), 0];
_shelves	= [_shelvesPos, "Land_ShelvesMetal_F", _dir] call TTC_CORE_fnc_createVehicle;

// Create a reference point at the shelves location.
_reference	= _shelvesPos;

// Create backpacks (right side; 1. row)
//_weaponHolder = createVehicle ["groundWeaponHolder", _shelvesPos, [], 0, "CAN_COLLIDE"];
//_weaponHolder addBackpackCargoGlobal ["B_Carryall_ocamo", 1];
//_weaponHolder addItemCargoGlobal ["V_TacVest_oli", 1];
//_weaponHolder addItemCargoGlobal ["U_O_Officer_uniform", 1];
//_weaponHolder attachTo [_shelves, [0.19, -0.8, 0.30]];
//_weaponHolder enableSimulation false;

// Create racks.
_rackPos	= [((_reference select 0) - (cos(_dir + 40) * 1.3)), ((_reference select 1) + (sin(_dir + 40) * 1.3)), 0];
_rack		= [_rackPos, "Land_Metal_rack_F", _dir] call TTC_CORE_fnc_createVehicle;

_rackPos	= [((_reference select 0) - (cos(_dir + 140) * 1.3)), ((_reference select 1) + (sin(_dir + 140) * 1.3)), 0];
_rack		= [_rackPos, "Land_Metal_rack_F", _dir] call TTC_CORE_fnc_createVehicle;

// ---------- Left side ---------
// Create ammo boxes.
_ammoPos	= [((_reference select 0) - (cos(_dir) * 2.8)), ((_reference select 1) + (sin(_dir) * 2.8)), 0];
_ammo		= [_ammoPos, "Box_FIA_Ammo_F", (_dir + 180)] call TTC_CORE_fnc_createVehicle;
[_ammo] call TTC_CORE_fnc_clearAmmoBox;

_className	= format["%1_CargoNet_01_ammo_F", _prefix];
_ammoPos	= [((_reference select 0) - (cos(_dir - 10) * 4.5)), ((_reference select 1) + (sin(_dir - 10) * 4.5)), 0];
_ammo		= [_ammoPos, _className, _dir] call TTC_CORE_fnc_createVehicle;
[_ammo] call TTC_CORE_fnc_clearAmmoBox;

_ammoPos	= [((_reference select 0) - (cos(_dir - 15) * 6.3)), ((_reference select 1) + (sin(_dir - 15) * 6.3)), 0];
_ammo		= [_ammoPos, "Land_PaperBox_closed_F", _dir] call TTC_CORE_fnc_createVehicle;

// Create pallets.
_palletPos	= [((_ammoPos select 0) - (cos(_dir - 10) * 0.9)), ((_ammoPos select 1) + (sin(_dir - 10) * 0.9)), 0];
_pallet		= [_palletPos, "Land_Pallet_vertical_F", (_dir - 90)] call TTC_CORE_fnc_createVehicle;

_palletPos	= [((_ammoPos select 0) - (cos(_dir - 10) * 1.1)), ((_ammoPos select 1) + (sin(_dir - 10) * 1.1)), 0];
_pallet		= [_palletPos, "Land_Pallet_vertical_F", (_dir - 90)] call TTC_CORE_fnc_createVehicle;

_palletPos	= [((_ammoPos select 0) - (cos(_dir - 11) * 1.3)), ((_ammoPos select 1) + (sin(_dir - 11) * 1.3)), 0];
_pallet		= [_palletPos, "Land_Pallet_vertical_F", (_dir - 90)] call TTC_CORE_fnc_createVehicle;

_palletPos	= [((_ammoPos select 0) - (cos(_dir - 55) * 2.2)), ((_ammoPos select 1) + (sin(_dir - 55) * 2.2)), 0];
_pallet		= [_palletPos, "Land_Pallets_F", (_dir + 180)] call TTC_CORE_fnc_createVehicle;

// Barrel
_barrelPos	= [((_ammoPos select 0) - (cos(_dir - 10) * 1.8)), ((_ammoPos select 1) + (sin(_dir - 10) * 1.8)), 0];
_barrel		= [_barrelPos, "Land_BarrelTrash_F", _dir] call TTC_CORE_fnc_createVehicle;

// Create ammo boxes.
_ammoPos	= [((_ammoPos select 0) - (cos(_dir + 270) * 2)), ((_ammoPos select 1) + (sin(_dir + 270) * 2)), 0];
_ammo		= [_ammoPos, "Land_PaperBox_open_full_F", _dir] call TTC_CORE_fnc_createVehicle;

_ammoPos	= [((_ammoPos select 0) - (cos(_dir + 270) * 2)), ((_ammoPos select 1) + (sin(_dir + 270) * 2)), 0];
_ammo		= [_ammoPos, "Land_PaperBox_open_empty_F", _dir] call TTC_CORE_fnc_createVehicle;

// ---------- Right side ---------
// Create ammo boxes.
_ammoPos	= [((_reference select 0) - (cos(_dir + 175) * 2.6)), ((_reference select 1) + (sin(_dir + 175) * 2.6)), 0];
[_ammoPos, "Land_Pallet_MilBoxes_F", (_dir + 90)] call TTC_CORE_fnc_createVehicle;

_className	= format["%1_supplyCrate_F", _prefix];
_ammoPos	= [((_reference select 0) - (cos(_dir + 190) * 4)), ((_reference select 1) + (sin(_dir + 190) * 4)), 0];
_ammo		= [_ammoPos, _className, (_dir + 20)] call TTC_CORE_fnc_createVehicle;
[_ammo] call TTC_CORE_fnc_clearAmmoBox;

// Create a reference point at the ammo box location.
_reference	= _ammoPos;

_className	= format["Box_%1_Ammo_F", _type];
_ammoPos	= [((_reference select 0) - (cos(_dir + 190) * 2.1)), ((_reference select 1) + (sin(_dir + 190) * 2.1)), 0];
_ammo		= [_ammoPos, _className, (_dir + 20)] call TTC_CORE_fnc_createVehicle;
[_ammo] call TTC_CORE_fnc_clearAmmoBox;

_ammoPos	= [((_reference select 0) - (cos(_dir + 192) * 2.6)), ((_reference select 1) + (sin(_dir + 192) * 2.6)), 0];
_ammo		= [_ammoPos, _className, (_dir + 20)] call TTC_CORE_fnc_createVehicle;
[_ammo] call TTC_CORE_fnc_clearAmmoBox;
 
_className	= format["Box_%1_AmmoOrd_F", _type];
_ammoPos	= [((_reference select 0) - (cos(_dir + 205) * 2.2)), ((_reference select 1) + (sin(_dir + 205) * 2.2)), 0];
_ammo		= [_ammoPos, _className, (_dir + 110)] call TTC_CORE_fnc_createVehicle;
[_ammo] call TTC_CORE_fnc_clearAmmoBox;

_className	= format["Box_%1_WpsLaunch_F", _type];
_ammoPos	= [((_reference select 0) - (cos(_dir + 270) * 1.0)), ((_reference select 1) + (sin(_dir + 270) * 1.0)), 0];
_ammo		= [_ammoPos, _className, (_dir + 20)] call TTC_CORE_fnc_createVehicle;
[_ammo] call TTC_CORE_fnc_clearAmmoBox;

// Create AI (salesman)
_salesman1 = [_cashDeskPos1] call _spawnSalesman;
_salesman2 = [_cashDeskPos2] call _spawnSalesman;

// Add the 'Shop' action for all players of this side (including JIP).
[[[_salesman1, _salesman2]], "TTC_BASE_fnc_addShopActions", _side, true] call BIS_fnc_MP;
