/*
	Created by Lux0r
*/


private [
	"_side","_pos","_dir","_prefix","_type","_lmg_mk200","_lmg_zafir","_lmg_navid","_srifle_mk14","_pistol","_pistol_snds","_pistolOfficer",
	"_pistolOfficer_scope","_pistolOfficer_snds","_rifle","_rifleGL","_marksmanRifle","_sniperRifle","_sniperRifle_DLC","_deskPos","_desk",
	"_cashDeskPos1","_cashDesk","_cashDeskPos2","_shelvesPos","_shelves","_reference","_positions","_rackPos","_rack","_ammoPos","_ammo",
	"_className","_palletPos","_pallet","_barrelPos","_barrel","_salesman1","_salesman2"
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


_createWeapons = {
	private ["_pos","_object","_settings","_weaponHolder"];	
	_pos		= _this select 0;
	_object		= _this select 1;
	_settings	= _this select 2;

	{
		_weaponHolder = createVehicle ["Library_WeaponHolder", _pos, [], 0, "CAN_COLLIDE"];
		_weaponHolder addWeaponCargoGlobal [(_x select 0), 1];
		_weaponHolder attachTo [_object, (_x select 1)];
		_weaponHolder setVectorDirAndUp (_x select 2);
		_weaponHolder setVariable ["TTC_isShopItem", true, true];
		//_weaponHolder enableSimulationGlobal false;
	} forEach _settings;
};

_createRack = {
	private ["_pos","_rack","_positions"];	
	_pos	= _this select 0;

	_rack	= [_pos, "Land_Metal_rack_F", _dir] call TTC_CORE_fnc_createVehicle;

	// Create land survival radios (2. + 3. row)
	_positions = [
		[-0.3, 0, -0.25],
		[0, 0, -0.25],
		[0.3, 0, -0.25],
		[-0.3, 0, 0.2],
		[0, 0, 0.2],
		[0.3, 0, 0.2]
	];

	["Land_SurvivalRadio_F", _pos, _rack, _positions, [[0,-1,0],[0,0,1]]] call TTC_CORE_fnc_attachObjectsTo;

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

_createBackpacks = {
	private ["_pos","_object","_settings","_weaponHolder"];	
	_pos		= _this select 0;
	_object		= _this select 1;
	_settings	= _this select 2;

	{
		_weaponHolder = createVehicle ["Library_WeaponHolder", _pos, [], 0, "CAN_COLLIDE"];
		_weaponHolder addBackpackCargoGlobal [(_x select 0), 1];
		_weaponHolder attachTo [_object, (_x select 1)];
		_weaponHolder setVectorDirAndUp (_x select 2);
		_weaponHolder setVariable ["TTC_isShopItem", true, true];
		//_weaponHolder enableSimulationGlobal false;
	} forEach _settings;
};

_spawnSalesman = {
	private ["_pos","_group","_className","_unitPos","_unit"];	
	_pos	= _this select 0;

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

// Initialize the weapon variables.
switch (_side) do {
	_lmg_mk200		= ["LMG_Mk200_F","LMG_Mk200_MRCO_F","LMG_Mk200_pointer_F"] call BIS_fnc_selectRandom;
	_lmg_zafir		= ["LMG_Zafir_F","LMG_Zafir_ARCO_F","LMG_Zafir_pointer_F"] call BIS_fnc_selectRandom;
	_lmg_navid		= ["MMG_01_hex_F","MMG_01_tan_F","MMG_01_hex_ARCO_LP_F","MMG_02_camo_F","MMG_02_black_F","MMG_02_sand_F","MMG_02_sand_RCO_LP_F","MMG_02_black_RCO_BI_F"] call BIS_fnc_selectRandom;
	_srifle_mk14	= ["srifle_DMR_06_camo_F","srifle_DMR_06_olive_F","srifle_DMR_06_camo_khs_F"] call BIS_fnc_selectRandom;

	case west: {
		_pistol					= "hgun_P07_F";
		_pistol_snds			= "hgun_P07_snds_F";
		_pistolOfficer			= "hgun_Pistol_heavy_01_F";
		_pistolOfficer_scope	= "hgun_Pistol_heavy_01_MRD_F";
		_pistolOfficer_snds		= "hgun_Pistol_heavy_01_snds_F";
		_rifle					= "arifle_MX_F";
		_rifleGL				= "arifle_MX_GL_F";
		_marksmanRifle			= ["srifle_EBR_F","srifle_EBR_ACO_F","srifle_EBR_MRCO_pointer_F","srifle_EBR_ARCO_pointer_F","srifle_EBR_SOS_F","srifle_EBR_DMS_F","srifle_EBR_Hamr_pointer_F"] call BIS_fnc_selectRandom;
		_sniperRifle			= ["srifle_LRR_F","srifle_LRR_SOS_F","srifle_LRR_LRPS_F"] call BIS_fnc_selectRandom;
		_sniperRifle_DLC		= ["srifle_DMR_02_F","srifle_DMR_02_camo_F","srifle_DMR_02_sniper_F","srifle_DMR_02_ACO_F","srifle_DMR_02_MRCO_F","srifle_DMR_02_SOS_F","srifle_DMR_02_DMS_F","srifle_DMR_02_sniper_AMS_LP_S_F","srifle_DMR_02_camo_AMS_LP_F","srifle_DMR_02_ARCO_F"] call BIS_fnc_selectRandom;
	};
	case resistance: {
		_pistol					= "hgun_ACPC2_F";
		_pistol_snds			= "hgun_ACPC2_snds_F";
		_pistolOfficer			= "hgun_Pistol_heavy_02_F";
		_pistolOfficer_scope	= "hgun_Pistol_heavy_02_Yorris_F";
		_pistolOfficer_snds		= "hgun_Pistol_heavy_02_Yorris_F";
		_rifle					= "arifle_TRG21_F";
		_rifleGL				= "arifle_TRG21_GL_F";
		_marksmanRifle			= ["srifle_DMR_01_F","srifle_DMR_01_ACO_F","srifle_DMR_01_MRCO_F","srifle_DMR_01_SOS_F","srifle_DMR_01_DMS_F","srifle_DMR_01_ARCO_F"] call BIS_fnc_selectRandom;
		_sniperRifle			= ["srifle_GM6_F","srifle_GM6_SOS_F","srifle_GM6_LRPS_F"] call BIS_fnc_selectRandom;
		_sniperRifle_DLC		= ["srifle_DMR_04_F","srifle_DMR_04_Tan_F","srifle_DMR_04_ACO_F","srifle_DMR_04_MRCO_F","srifle_DMR_04_SOS_F","srifle_DMR_04_DMS_F","srifle_DMR_04_ARCO_F","srifle_DMR_04_NS_LP_F"] call BIS_fnc_selectRandom;
	};
	default {
		["Function 'TTC_BASE_spawnShop' was called with an unknown side!"] call BIS_fnc_error;
	};
};

//_desk		= createVehicle ["Land_PaperBox_open_full_F", _pos, [], 0, "CAN_COLLIDE"];

// Spawn desk.
_deskPos	= [((_pos select 0) - (cos(_dir + 270) * 2.5)), ((_pos select 1) + (sin(_dir + 270) * 2.5)), 0];
_desk		= [_deskPos, "Land_TableDesk_F", _dir] call TTC_CORE_fnc_createVehicle;

// Create Weapons
_settings = [
	[_rifle,				[-0.45, 0.10, 1.05],	[[0,1,0],[0,0,1]]],
	[_rifleGL,				[-0.45, -0.25, 1.05],	[[0,1,0],[0,0,1]]],
	[_pistol,				[0.05, 0.20, 1.08],		[[0,1,0],[0,0,1]]],
	[_pistol_snds,			[0.05, 0.05, 1.08],		[[0,1,0],[0,0,1]]],
	["hgun_Rook40_F",		[0.05, -0.10, 1.08],	[[0,1,0],[0,0,1]]],
	["hgun_Rook40_snds_F",	[0.05, -0.25, 1.08],	[[0,1,0],[0,0,1]]],
	[_pistolOfficer,		[0.45, 0.20, 1.08],		[[0,1,0],[0,0,1]]],
	[_pistolOfficer_scope,	[0.45, 0.0, 1.08],		[[0,1,0],[0,0,1]]],
	[_pistolOfficer_snds,	[0.45, -0.20, 1.08],	[[0,1,0],[0,0,1]]]
];

[_deskPos, _desk, _settings] call _createWeapons;

// Spawn cash desks.
_cashDeskPos1	= [((_deskPos select 0) - (cos(_dir) * 1.75)), ((_deskPos select 1) + (sin(_dir) * 1.75)), 0];
_cashDesk		= [_cashDeskPos1, "Land_CashDesk_F", _dir] call TTC_CORE_fnc_createVehicle;

_cashDeskPos2	= [((_deskPos select 0) - (cos(_dir + 180) * 1.75)), ((_deskPos select 1) + (sin(_dir + 180) * 1.75)), 0];
_cashDesk		= [_cashDeskPos2, "Land_CashDesk_F", _dir] call TTC_CORE_fnc_createVehicle;

// Spawn desk.
_deskPos	= [((_cashDeskPos1 select 0) - (cos(_dir + 23) * 1.35)), ((_cashDeskPos1 select 1) + (sin(_dir + 23) * 1.35)), 0];
_desk		= [_deskPos, "Land_TableDesk_F", (_dir + 90)] call TTC_CORE_fnc_createVehicle;

// Create Weapons
_settings = [
	[_marksmanRifle,	[-0.60, 0.20, 1.05],	[[0,1,0],[0,0,1]]],
	[_sniperRifle,		[-0.55, -0.15, 1.05],	[[0,1,0],[0,0,1]]],
	[_sniperRifle_DLC,	[0.20, 0.09, 1.05],		[[0,1,0],[0,0,1]]],
	[_srifle_mk14,		[0.15, -0.31, 1.05],	[[0,1,0],[0,0,1]]]
];

[_deskPos, _desk, _settings] call _createWeapons;

// Spawn desk.
_deskPos	= [((_cashDeskPos2 select 0) - (cos(_dir + 157) * 1.35)), ((_cashDeskPos2 select 1) + (sin(_dir + 157) * 1.35)), 0];
_desk		= [_deskPos, "Land_TableDesk_F", (_dir - 90)] call TTC_CORE_fnc_createVehicle;

// Create Weapons
_settings = [
	[_lmg_mk200,		[-0.60, 0.20, 1.05],	[[0,1,0],[0,0,1]]],
	["arifle_MX_SW_F",	[-0.55, -0.15, 1.05],	[[0,1,0],[0,0,1]]],
	[_lmg_navid,		[0.20, 0.09, 1.05],		[[0,1,0],[0,0,1]]],
	[_lmg_zafir,		[0.28, -0.31, 1.05],	[[0,1,0],[0,0,1]]]
];

[_deskPos, _desk, _settings] call _createWeapons;

// Create shelves (metal).
_shelvesPos	= [((_pos select 0) - (cos(_dir + 90) * 1.5)), ((_pos select 1) + (sin(_dir + 90) * 1.5)), 0];
_shelves	= [_shelvesPos, "Land_ShelvesMetal_F", _dir] call TTC_CORE_fnc_createVehicle;

// Create a reference point at the shelves location.
_reference	= _shelvesPos;

// Create rounds (right side; 1. row)
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

// Create rounds (right side; 2. row)
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

// Create rounds (right side; 3. row)
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

// Create rounds (right side; 4. row)
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

// Create rounds (left side; 3. row)
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

// Create rounds (left side; 4. row)
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

// Create backpacks (1. row)
_settings = [
	["B_Carryall_ocamo",	[0.7, -0.4, 0.45],	[[0,1,0],[1,0,0]]],
	["B_Carryall_oucamo",	[0.7, 0.2, 0.45],	[[0,1,0],[1,0,0]]],
	["B_Carryall_mcamo",	[0.7, 0.8, 0.45],	[[0,1,0],[1,0,0]]],
	["B_Carryall_khk",		[-0.7, -0.4, 0.27],	[[0,1,0],[-1,0,0]]],
	["B_Carryall_oucamo",	[-0.7, 0.2, 0.27],	[[0,1,0],[-1,0,0]]],
	["B_Carryall_cbr",		[-0.7, 0.8, 0.27],	[[0,1,0],[-1,0,0]]]
];

[_reference, _shelves, _settings] call _createBackpacks;

// Create backpacks (2. row)
_settings = [
	["B_FieldPack_khk",		[0.7, -0.3, 0.80],	[[0,1,0],[1,0,0]]],
	["B_FieldPack_ocamo",	[0.7, 0.3, 0.80],	[[0,1,0],[1,0,0]]],
	["B_FieldPack_oucamo",	[0.7, 0.9, 0.80],	[[0,1,0],[1,0,0]]],
	["B_FieldPack_cbr",		[-0.7, -0.3, 0.62],	[[0,1,0],[-1,0,0]]],
	["B_FieldPack_blk",		[-0.7, 0.3, 0.62],	[[0,1,0],[-1,0,0]]],
	["B_FieldPack_khk",		[-0.7, 0.9, 0.62],	[[0,1,0],[-1,0,0]]]
];

[_reference, _shelves, _settings] call _createBackpacks;

// Create backpacks (3. row)
_settings = [
	["B_TacticalPack_blk",		[0.7, -0.3, 1.15],	[[0,1,0],[1,0,0]]],
	["B_TacticalPack_oli",		[0.7, 0.3, 1.15],	[[0,1,0],[1,0,0]]],
	["B_TacticalPack_rgr",		[0.7, 0.9, 1.15],	[[0,1,0],[1,0,0]]],
	["B_TacticalPack_rgr",		[-0.7, -0.3, 0.97],	[[0,1,0],[-1,0,0]]],
	["B_TacticalPack_mcamo",	[-0.7, 0.3, 0.97],	[[0,1,0],[-1,0,0]]],
	["B_TacticalPack_ocamo",	[-0.7, 0.9, 0.97],	[[0,1,0],[-1,0,0]]]
];

[_reference, _shelves, _settings] call _createBackpacks;

// Create backpacks (4. row)
_settings = [
	["B_Carryall_ocamo",	[0.7, -0.3, 1.50],	[[0,1,0],[1,0,0]]],
	["B_Carryall_khk",		[0.7, 0.3, 1.50],	[[0,1,0],[1,0,0]]],
	["B_Carryall_mcamo",	[0.7, 0.9, 1.50],	[[0,1,0],[1,0,0]]],
	["B_Carryall_oucamo",	[-0.7, -0.3, 1.32],	[[0,1,0],[-1,0,0]]],
	["B_Carryall_cbr",		[-0.7, 0.3, 1.32],	[[0,1,0],[-1,0,0]]],
	["B_Carryall_ocamo",	[-0.7, 0.9, 1.32],	[[0,1,0],[-1,0,0]]]
];

[_reference, _shelves, _settings] call _createBackpacks;

// Create racks.
_rackPos	= [((_reference select 0) - (cos(_dir + 40) * 1.3)), ((_reference select 1) + (sin(_dir + 40) * 1.3)), 0];
_rack		= [_rackPos] call _createRack;

_rackPos	= [((_reference select 0) - (cos(_dir + 140) * 1.3)), ((_reference select 1) + (sin(_dir + 140) * 1.3)), 0];
_rack		= [_rackPos] call _createRack;

// ---------- Left side ---------
// Create ammo boxes.
_ammoPos	= [((_reference select 0) - (cos(_dir) * 2.8)), ((_reference select 1) + (sin(_dir) * 2.8)), 0];
_ammo		= [_ammoPos, "Box_FIA_Ammo_F", (_dir + 180)] call TTC_CORE_fnc_createAmmoBox;

_className	= format["%1_CargoNet_01_ammo_F", _prefix];
_ammoPos	= [((_reference select 0) - (cos(_dir - 10) * 4.5)), ((_reference select 1) + (sin(_dir - 10) * 4.5)), 0];
_ammo		= [_ammoPos, _className, _dir] call TTC_CORE_fnc_createAmmoBox;

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
_ammo		= [_ammoPos, _className, (_dir + 20)] call TTC_CORE_fnc_createAmmoBox;

// Create a reference point at the ammo box location.
_reference	= _ammoPos;

_className	= format["Box_%1_Ammo_F", _type];
_ammoPos	= [((_reference select 0) - (cos(_dir + 190) * 2.1)), ((_reference select 1) + (sin(_dir + 190) * 2.1)), 0];
_ammo		= [_ammoPos, _className, (_dir + 20)] call TTC_CORE_fnc_createAmmoBox;

_ammoPos	= [((_reference select 0) - (cos(_dir + 192) * 2.6)), ((_reference select 1) + (sin(_dir + 192) * 2.6)), 0];
_ammo		= [_ammoPos, _className, (_dir + 20)] call TTC_CORE_fnc_createAmmoBox;
 
_className	= format["Box_%1_AmmoOrd_F", _type];
_ammoPos	= [((_reference select 0) - (cos(_dir + 205) * 2.2)), ((_reference select 1) + (sin(_dir + 205) * 2.2)), 0];
_ammo		= [_ammoPos, _className, (_dir + 110)] call TTC_CORE_fnc_createAmmoBox;;

_className	= format["Box_%1_WpsLaunch_F", _type];
_ammoPos	= [((_reference select 0) - (cos(_dir + 270) * 1.0)), ((_reference select 1) + (sin(_dir + 270) * 1.0)), 0];
_ammo		= [_ammoPos, _className, (_dir + 20)] call TTC_CORE_fnc_createAmmoBox;

// Create AI (salesman)
_salesman1 = [_cashDeskPos1] call _spawnSalesman;
_salesman2 = [_cashDeskPos2] call _spawnSalesman;

// Add the 'Shop' action for all players of this side (including JIP).
[[[_salesman1, _salesman2]], "TTC_BASE_fnc_addShopActions", _side, true] call BIS_fnc_MP;
