/*
    Created by BauerMitFackel and Lux0r
*/


#define TTC_SHOP_amountMin 1
#define TTC_SHOP_amountMax 20

TTC_SHOP_ARTICLE_id				= 0;
TTC_SHOP_ARTICLE_name			= 1;
TTC_SHOP_ARTICLE_price			= 2;
TTC_SHOP_ARTICLE_displayName	= 3;
TTC_SHOP_ARTICLE_description	= 4;
TTC_SHOP_ARTICLE_picture		= 5;
TTC_SHOP_ARTICLE_maxAmount		= 6;


_getArticle = {
	private["_id","_name","_maxAmount","_price","_config","_descriptionShort","_descriptionLong","_descriptionUse","_displayName","_picture","_description","_data"];

	_id					= [_this, 0] call BIS_fnc_param;
	_name				= [_this, 1] call BIS_fnc_param;
	_maxAmount			= [_this, 2] call BIS_fnc_param;
	_price				= [_this, 3] call BIS_fnc_param;
	_config				= [_this, 4] call BIS_fnc_param;
	_descriptionShort	= [_this, 5, (getText(configFile >> _config >> _name >> "descriptionShort")), [""]] call BIS_fnc_param;
	_descriptionLong	= [_this, 6, "", [""]] call BIS_fnc_param;
	_descriptionUse		= [_this, 7, (getText(configFile >> _config >> _name >> "descriptionUse")), [""]] call BIS_fnc_param;
	_displayName		= [_this, 8, (getText(configFile >> _config >> _name >> "displayName")), [""]] call BIS_fnc_param;
	_picture			= [_this, 9, (getText(configFile >> _config >> _name >> "picture")), [""]] call BIS_fnc_param;

	_description = "";

	if (_descriptionShort != "") then {
		_description = _descriptionShort;
	};

	if (_descriptionUse != "") then {
		if (_description != "") then {
			_description = _description + format ["<br/>%1", _descriptionUse];
		} else {
			_description = _descriptionUse;
		};
	};

	if (_descriptionLong != "") then {
		if (_description != "") then {
			_description = _description + format ["<br/><br/>%1", _descriptionLong];
		} else {
			_description = _descriptionLong;
		};
	};

	_data = [];
	_data set [TTC_SHOP_ARTICLE_id, _id];
	_data set [TTC_SHOP_ARTICLE_name, _name];
	_data set [TTC_SHOP_ARTICLE_maxAmount, _maxAmount];
	_data set [TTC_SHOP_ARTICLE_price, _price];
	_data set [TTC_SHOP_ARTICLE_displayName, _displayName];
	_data set [TTC_SHOP_ARTICLE_description, _description];
	_data set [TTC_SHOP_ARTICLE_picture, _picture];
	_data;
};

_getCapacity = {
	private ["_name","_container","_capacity"];
	_name	= [_this, 0] call BIS_fnc_param;

	_container	= getText	(configFile >> "CfgWeapons" >> _name >> "ItemInfo" >> "containerClass");
	_capacity	= getNumber	(configFile >> "CfgVehicles" >> _container >> "maximumLoad");
	
	_capacity;
};

_getWeapon = {
	private ["_name","_text"];
	_name	= [_this, 1] call BIS_fnc_param;

	_short		= getText	(configFile >> "CfgWeapons" >> _name >> "descriptionShort");
	_text		= getText	(configFile >> "CfgWeapons" >> _name >> "Library" >> "libTextDesc");

	(_this + ["CfgWeapons", _short, _text]) call _getArticle;
};

_getMagazine = {
	(_this + ["CfgMagazines"]) call _getArticle;
};

_getItem = {
	(_this + ["CfgWeapons"]) call _getArticle;
};

_getGlasses = {
	(_this + ["CfgGlasses"]) call _getArticle;
};

_countVehicleSeats = {
	private ["_name","_hasDriver","_transport","_seats","_turrets","_class","_hasGunner"];
	_name	= [_this, 0] call BIS_fnc_param;

	_hasDriver	= getNumber	(configFile >> "CfgVehicles" >> _name >> "hasDriver");
	_transport	= getNumber	(configFile >> "CfgVehicles" >> _name >> "transportSoldier");
	_seats		= _hasDriver + _transport;
	_turrets	= (configFile >> "CfgVehicles" >> _name >> "Turrets");
	//diag_log format["_name = %1, _hasDriver = %2, _transport = %3, _turrets = %4", _name, _hasDriver, _transport, count _turrets];

	for "_i" from 0 to count _turrets -1 do {
		 _class = _turrets select _i;

		if (isClass _class) then {
			//_isPersonTurret = getNumber	(configFile >> "CfgVehicles" >> _name >> "Turrets" >> configName _class >> "isPersonTurret");
			_hasGunner = getNumber	(configFile >> "CfgVehicles" >> _name >> "Turrets" >> configName _class >> "hasGunner");
			_seats = _seats + _hasGunner;
		};
	};

	_seats;
};

_getUniform = {
	private ["_name","_mass","_capacity","_descrition"];
	_name	= [_this, 1] call BIS_fnc_param;

	_mass		= getNumber	(configFile >> "CfgWeapons" >> _name >> "ItemInfo" >> "mass");
	_capacity	= [_name] call _getCapacity;
	_descrition	= format["Mass: %1<br/>Capacity: %2", _mass, _capacity];
	(_this + ["CfgWeapons", _descrition]) call _getArticle;
};

_getVest = {
	private ["_name","_mass","_capacity","_armor","_descrition"];
	_name	= [_this, 1] call BIS_fnc_param;

	_mass		= getNumber	(configFile >> "CfgWeapons" >> _name >> "ItemInfo" >> "mass");
	_capacity	= [_name] call _getCapacity;
	_armor		= getNumber	(configFile >> "CfgWeapons" >> _name >> "ItemInfo" >> "armor");
	_descrition	= format["Mass: %1<br/>Capacity: %2<br/>Armor: %3", _mass, _capacity, _armor];
	(_this + ["CfgWeapons", _descrition]) call _getArticle;
};

_getBackpack = {
	private ["_name","_mass","_capacity","_descrition"];
	_name	= [_this, 1] call BIS_fnc_param;

	_mass		= getNumber	(configFile >> "CfgVehicles" >> _name >> "mass");
	_capacity	= getNumber	(configFile >> "CfgVehicles" >> _name >> "maximumLoad");
	_descrition	= format["Mass: %1<br/>Capacity: %2", _mass, _capacity];
	(_this + ["CfgVehicles", _descrition]) call _getArticle;
};

_getVehicle = {
	private ["_name","_capacity","_armor","_seats","_maxSpeed","_text","_descrition"];
	_name	= [_this, 1] call BIS_fnc_param;

	_capacity	= getNumber	(configFile >> "CfgVehicles" >> _name >> "maximumLoad");
	_armor		= getNumber	(configFile >> "CfgVehicles" >> _name >> "armor");
	_seats		= [_name] call _countVehicleSeats;
	_maxSpeed	= getNumber	(configFile >> "CfgVehicles" >> _name >> "maxSpeed");
	_text		= getText	(configFile >> "CfgVehicles" >> _name >> "Library" >> "libTextDesc");
	_descrition	= format["Capacity: %1<br/>Armor: %2<br/>Seats: %3<br/>Max Speed: %4<br/><br/>%5", _capacity, _armor, _seats, _maxSpeed, _text];

	(_this + ["CfgVehicles", _descrition]) call _getArticle;
};


_getUGV = {
	private ["_name","_capacity","_armor","_hasDriver","_maxSpeed","_text","_descrition"];
	_name	= [_this, 1] call BIS_fnc_param;

	_capacity	= getNumber	(configFile >> "CfgVehicles" >> _name >> "maximumLoad");
	_armor		= getNumber	(configFile >> "CfgVehicles" >> _name >> "armor");
	_hasDriver	= getNumber	(configFile >> "CfgVehicles" >> _name >> "hasDriver");
	_maxSpeed	= getNumber	(configFile >> "CfgVehicles" >> _name >> "maxSpeed");
	_text		= getText	(configFile >> "CfgVehicles" >> _name >> "Library" >> "libTextDesc");
	_descrition	= format["Capacity: %1<br/>Armor: %2<br/>Seats: %3<br/>Max Speed: %4<br/><br/>%5", _capacity, _armor, _hasDriver, _maxSpeed, _text];

	(_this + ["CfgVehicles", _descrition]) call _getArticle;
};

_getUAV = {
	private ["_name","_capacity","_armor","_maxSpeed","_text","_descrition"];
	_name	= [_this, 1] call BIS_fnc_param;

	_capacity	= getNumber	(configFile >> "CfgVehicles" >> _name >> "maximumLoad");
	_armor		= getNumber	(configFile >> "CfgVehicles" >> _name >> "armor");
	_maxSpeed	= getNumber	(configFile >> "CfgVehicles" >> _name >> "maxSpeed");
	_text		= getText	(configFile >> "CfgVehicles" >> _name >> "Armory" >> "description");
	_descrition	= format["Capacity: %1<br/>Armor: %2<br/>Max Speed: %3<br/><br/>%4", _capacity, _armor, _maxSpeed, _text];

	(_this + ["CfgVehicles", _descrition]) call _getArticle;
};

/*
	WEAPONS format: [_id, _name, _maxAmount, _price]
*/
// Pistols
TTC_SHOP_articles_pistols = [
	[1000, "hgun_P07_F",					TTC_SHOP_amountMin,	80] call _getWeapon,	// P07 9 mm
	[1001, "hgun_ACPC2_F",					TTC_SHOP_amountMin,	80] call _getWeapon,	// ACP-C2 .45
	[1002, "hgun_Rook40_F",					TTC_SHOP_amountMin,	80] call _getWeapon,	// Rook-40 9 mm
	[1003, "hgun_Pistol_heavy_01_F",		TTC_SHOP_amountMin,	140] call _getWeapon,	// 4-five .45
	[1004, "hgun_Pistol_heavy_02_F",		TTC_SHOP_amountMin,	140] call _getWeapon	// Zubr .45
];

// SMGs
TTC_SHOP_articles_smgs = [
	[1010, "SMG_01_F",						TTC_SHOP_amountMin, 300] call _getWeapon,	// Vermin SMG .45 ACP
	[1011, "hgun_PDW2000_F",				TTC_SHOP_amountMin,	300] call _getWeapon,	// PDW2000 9 mm
	[1012, "SMG_02_F",						TTC_SHOP_amountMin,	300] call _getWeapon	// Sting 9 mm
];

// Carbines
TTC_SHOP_articles_carbines = [
	[1020, "arifle_MXC_F",					TTC_SHOP_amountMin,	480] call _getWeapon,	// MXC 6.5 mm
	[1021, "arifle_TRG20_F",				TTC_SHOP_amountMin,	480] call _getWeapon,	// TRG-20 5.56 mm
	[1022, "arifle_Mk20C_F",				TTC_SHOP_amountMin,	480] call _getWeapon,	// Mk20C 5.56 mm (C)
	[1023, "arifle_Katiba_C_F",				TTC_SHOP_amountMin,	480] call _getWeapon	// Katiba Carbine 6.5 mm
];

// Assault rifles
TTC_SHOP_articles_assaultRifles = [
	[1030, "arifle_MX_F",					TTC_SHOP_amountMin,	600] call _getWeapon,	// MX 6.5 mm
	[1031, "arifle_TRG21_F",				TTC_SHOP_amountMin,	600] call _getWeapon,	// TRG-21 5.56 mm
	[1032, "arifle_Mk20_F",					TTC_SHOP_amountMin,	600] call _getWeapon,	// Mk20 5.56 mm (C)
	[1033, "arifle_Katiba_F",				TTC_SHOP_amountMin,	600] call _getWeapon	// Katiba 6.5 mm
];

// Grenade Launcher
TTC_SHOP_articles_grenadeLauncher = [
	[1040, "arifle_MX_GL_F",				TTC_SHOP_amountMin,	750] call _getWeapon,	// MX 3GL 6.5 mm
	[1041, "arifle_TRG21_GL_F",				TTC_SHOP_amountMin,	750] call _getWeapon,	// TRG-21 EGLM 5.56 mm
	[1041, "arifle_Katiba_GL_F",			TTC_SHOP_amountMin,	750] call _getWeapon	// Katiba GL 6.5 mm
];

// Marksman rifles
TTC_SHOP_articles_marksmanRifles = [
	[1050, "arifle_MXM_F",					TTC_SHOP_amountMin,	840] call _getWeapon,	// MXM 6.5 mm
	[1051, "srifle_DMR_01_F",				TTC_SHOP_amountMin,	1050] call _getWeapon,	// Rahim 7.62 mm
	[1052, "srifle_EBR_F",					TTC_SHOP_amountMin,	1050] call _getWeapon,	// Mk18 ABR 7.62 mm
	[1053, "srifle_DMR_03_F",				TTC_SHOP_amountMin,	1050] call _getWeapon,	// Mk-I EMR 7.62mm (Black)
	[1054, "srifle_DMR_03_khaki_F",			TTC_SHOP_amountMin,	1050] call _getWeapon,	// Mk-I EMR 7.62mm (Khaki)
	[1055, "srifle_DMR_03_tan_F",			TTC_SHOP_amountMin,	1050] call _getWeapon,	// Mk-I EMR 7.62mm (Sand)
	[1056, "srifle_DMR_03_multicam_F",		TTC_SHOP_amountMin,	1050] call _getWeapon,	// Mk-I EMR 7.62mm (Camo)
	[1057, "srifle_DMR_03_woodland_F",		TTC_SHOP_amountMin,	1050] call _getWeapon,	// Mk-I EMR 7.62mm (Woodland)
	[1058, "srifle_DMR_05_blk_F",			TTC_SHOP_amountMin,	1050] call _getWeapon,	// Cyrus 9.3mm (Black)
	[1059, "srifle_DMR_05_hex_F",			TTC_SHOP_amountMin,	1050] call _getWeapon,	// Cyrus 9.3mm (Hex)
	[1060, "srifle_DMR_05_tan_f",			TTC_SHOP_amountMin,	1050] call _getWeapon,	// Cyrus 9.3mm (Tan)
	[1061, "srifle_DMR_06_camo_F",			TTC_SHOP_amountMin,	1050] call _getWeapon,	// Mk14 7.62mm (Camo)
	[1062, "srifle_DMR_06_olive_F",			TTC_SHOP_amountMin,	1050] call _getWeapon	// Mk14 7.62mm (Olive)
];

// Sniper rifles
TTC_SHOP_articles_sniperRifles = [
	[1070, "srifle_GM6_F",					TTC_SHOP_amountMin,	1365] call _getWeapon,	// GM6 Lynx 12.7 mm
	[1071, "srifle_LRR_F",					TTC_SHOP_amountMin,	1365] call _getWeapon,	// M320 LRR .408
	[1072, "srifle_DMR_02_F",				TTC_SHOP_amountMin,	1365] call _getWeapon,	// MAR-10 .338 (Black)
	[1073, "srifle_DMR_02_camo_F",			TTC_SHOP_amountMin,	1365] call _getWeapon,	// MAR-10 .338 (Camo)
	[1074, "srifle_DMR_02_sniper_F",		TTC_SHOP_amountMin,	1365] call _getWeapon,	// MAR-10 .338 (Sand)
	[1075, "srifle_DMR_04_F",				TTC_SHOP_amountMin,	1365] call _getWeapon,	// ASP-1 Kir 12.7mm (Black)
	[1076, "srifle_DMR_04_Tan_F",			TTC_SHOP_amountMin,	1365] call _getWeapon	// ASP-1 Kir 12.7mm (Tan)
];

TTC_SHOP_articles_weapons = (
	TTC_SHOP_articles_pistols + TTC_SHOP_articles_smgs + TTC_SHOP_articles_carbines + TTC_SHOP_articles_assaultRifles + TTC_SHOP_articles_grenadeLauncher +
	TTC_SHOP_articles_marksmanRifles + TTC_SHOP_articles_sniperRifles
);

/*
	AMMUNITION format: [_id, _name, _maxAmount, _price]
*/
TTC_SHOP_articles_flashlight = [
	[1100, "acc_flashlight",				TTC_SHOP_amountMin,	25] call _getItem	// Flashlight
];

TTC_SHOP_articles_pointer = [
	[1101, "acc_pointer_IR",				TTC_SHOP_amountMin,	50] call _getItem	// IR Laser Pointer
];

TTC_SHOP_articles_scopes_pistols = [
	[1110, "optic_MRD",						TTC_SHOP_amountMin,	75] call _getItem,	// Sound Suppressor (9 mm)
	[1111, "optic_Yorris",					TTC_SHOP_amountMin,	75] call _getItem	// Sound Suppressor (9 mm)
];

TTC_SHOP_articles_scopes_smgs = [
	[1120, "optic_Aco_smg",					TTC_SHOP_amountMin,	100] call _getItem,	// ACO SMG (Red)
	[1121, "optic_ACO_grn_smg",				TTC_SHOP_amountMin,	100] call _getItem,	// ACO SMG (Green)
	[1122, "optic_Holosight_smg",			TTC_SHOP_amountMin,	125] call _getItem	// Mk17 Holosight SMG
];

TTC_SHOP_articles_scopes_rifles = [
	[1130, "optic_Aco",						TTC_SHOP_amountMin,	100] call _getItem,	// ACO (Red)
	[1131, "optic_ACO_grn",					TTC_SHOP_amountMin,	100] call _getItem,	// ACO (Green)
	[1132, "optic_Holosight",				TTC_SHOP_amountMin,	125] call _getItem,	// MK17 Holosight
	[1133, "optic_MRCO",					TTC_SHOP_amountMin,	200] call _getItem,	// MRCO
	[1134, "optic_Hamr",					TTC_SHOP_amountMin,	300] call _getItem,	// RCO
	[1135, "optic_Arco",					TTC_SHOP_amountMin,	300] call _getItem	// ARCO
];

TTC_SHOP_articles_scopes_marksman = [
	[1140, "optic_NVS",						TTC_SHOP_amountMin,	300] call _getItem,	// NVS
	[1141, "optic_AMS",						TTC_SHOP_amountMin,	375] call _getItem,	// AMS (Black)
	[1142, "optic_AMS_khk",					TTC_SHOP_amountMin,	375] call _getItem,	// AMS (Khaki)
	[1143, "optic_AMS_snd",					TTC_SHOP_amountMin,	375] call _getItem,	// AMS (Sand)
	[1144, "optic_KHS_blk",					TTC_SHOP_amountMin,	375] call _getItem,	// Kahlia (Black)
	[1145, "optic_KHS_hex",					TTC_SHOP_amountMin,	375] call _getItem,	// Kahlia (Hex)
	[1146, "optic_KHS_old",					TTC_SHOP_amountMin,	375] call _getItem,	// Kahlia (Old)
	[1147, "optic_KHS_tan",					TTC_SHOP_amountMin,	375] call _getItem,	// Kahlia (Tan)
	[1148, "optic_DMS",						TTC_SHOP_amountMin,	450] call _getItem	// DMS
];

TTC_SHOP_articles_scopes_sniper = [
	[1150, "optic_LRPS",					TTC_SHOP_amountMin,	525] call _getItem,	// LRPS
	[1151, "optic_SOS",						TTC_SHOP_amountMin,	750] call _getItem	// MOS
];

TTC_SHOP_articles_scopes = (
	TTC_SHOP_articles_scopes_pistols + TTC_SHOP_articles_scopes_smgs +	TTC_SHOP_articles_scopes_rifles +
	TTC_SHOP_articles_scopes_marksman + TTC_SHOP_articles_scopes_sniper
);

TTC_SHOP_articles_silencers = [
	[1160, "muzzle_snds_L",					TTC_SHOP_amountMin,	120] call _getItem,	// Sound Suppressor (9 mm)
	[1161, "muzzle_snds_acp",				TTC_SHOP_amountMin,	120] call _getItem,	// Sound Suppressor (.45 ACP)
	[1162, "muzzle_snds_M",					TTC_SHOP_amountMin,	180] call _getItem,	// Sound Suppressor (5.56 mm)
	[1163, "muzzle_snds_H",					TTC_SHOP_amountMin,	180] call _getItem,	// Sound Suppressor (6.5 mm)
	[1164, "muzzle_snds_H_SW",				TTC_SHOP_amountMin,	180] call _getItem,	// Sound Suppressor LMG (6.5 mm)	// MX SW
	[1165, "muzzle_snds_H_MG",				TTC_SHOP_amountMin,	180] call _getItem,	// Sound Suppressor LMG (6.5 mm)	// Mk 200
	[1166, "muzzle_snds_B",					TTC_SHOP_amountMin,	270] call _getItem,	// Sound Suppressor (7.62 mm)
	[1167, "muzzle_snds_338_black",			TTC_SHOP_amountMin,	405] call _getItem,	// Sound Suppressor (.338, Black)
	[1168, "muzzle_snds_338_green",			TTC_SHOP_amountMin,	405] call _getItem,	// Sound Suppressor (.338, Green)
	[1169, "muzzle_snds_93mmg",				TTC_SHOP_amountMin,	405] call _getItem,	// Sound Suppressor (9.3mm, Black)
	[1170, "muzzle_snds_93mmg_tan",			TTC_SHOP_amountMin,	405] call _getItem	// Sound Suppressor (9.3mm, Tan)
];

TTC_SHOP_articles_attachments = TTC_SHOP_articles_flashlight + TTC_SHOP_articles_pointer + TTC_SHOP_articles_scopes + TTC_SHOP_articles_silencers;

/*
	AMMUNITION format: [_id, _name, _maxAmount, _price]
*/
TTC_SHOP_articles_magazines = [
	[1200, "16Rnd_9x21_Mag",					TTC_SHOP_amountMax,	 25] call _getMagazine,		// 9mm 16Rnd Mag
	[1201, "30Rnd_9x21_Mag",					TTC_SHOP_amountMax,	50] call _getMagazine,		// 9mm 30Rnd Mag
	[1202, "6Rnd_45ACP_Cylinder",				TTC_SHOP_amountMax,	 20] call _getMagazine,		// .45 ACP 6Rnd Cylinder
	[1203, "9Rnd_45ACP_Mag",					TTC_SHOP_amountMax,  30] call _getMagazine,		// .45 ACP 9Rnd Mag
	[1204, "11Rnd_45ACP_Mag",					TTC_SHOP_amountMax,  40] call _getMagazine,		// .45 ACP 11Rnd Mag
	[1205, "30Rnd_45ACP_Mag_SMG_01",			TTC_SHOP_amountMax,  50] call _getMagazine,		// .45 ACP 30Rnd Vermin Mag
	[1206, "30Rnd_45ACP_Mag_SMG_01_Tracer_Green",	TTC_SHOP_amountMax,  25] call _getMagazine,	// .// .45 30Rnd VerminTracers (Green) Mag
	[1207, "30Rnd_556x45_Stanag",				TTC_SHOP_amountMax,  80] call _getMagazine,		// 5.56mm 30rnd STANAG Mag
	[1208, "30Rnd_556x45_Stanag_Tracer_Yellow",	TTC_SHOP_amountMax,  40] call _getMagazine,		// 5.56mm 30rnd Tracer (Yellow) Mag
	[1209, "30Rnd_65x39_caseless_mag",			TTC_SHOP_amountMax,  80] call _getMagazine,		// 6.5mm 30Rnd STANAG Mag
	[1210, "30Rnd_65x39_caseless_mag_Tracer",	TTC_SHOP_amountMax,  40] call _getMagazine,		// 6.5mm 30Rnd Tracer (Red) Mag
	[1211, "100Rnd_65x39_caseless_mag",			TTC_SHOP_amountMax,  120] call _getMagazine,	// 6.5mm 100Rnd Belt Case
	[1212, "100Rnd_65x39_caseless_mag_Tracer",	TTC_SHOP_amountMax,  60] call _getMagazine,		// 6.5mm 100Rnd Tracer (Red) Belt Case
	[1213, "200Rnd_65x39_cased_Box",			TTC_SHOP_amountMax,  180] call _getMagazine,	// 6.5mm 200Rnd Belt Case
	[1214, "200Rnd_65x39_cased_Box_Tracer",		TTC_SHOP_amountMax,  90] call _getMagazine,		// 6.5mm 200Rnd Belt Case Tracer (Yellow)
	[1215, "20Rnd_762x51_Mag",					TTC_SHOP_amountMax,  80] call _getMagazine,		// 7.62mm 20Rnd Mag
	[1216, "5Rnd_127x108_Mag",					TTC_SHOP_amountMax,  120] call _getMagazine,	// 12.7mm 5Rnd Mag
	[1217, "7Rnd_408_Mag",						TTC_SHOP_amountMax,  140] call _getMagazine		// .408 7Rnd LRR Mag
];

TTC_SHOP_articles_rockets = [
	[1220, "RPG32_F",						TTC_SHOP_amountMax,  500] call _getMagazine,	// RPG-42 Rocket
	[1221, "RPG32_HE_F",					TTC_SHOP_amountMax,  500] call _getMagazine,	// RPG-42 HE Rocket
	[1222, "NLAW_F",						TTC_SHOP_amountMax,  1000] call _getMagazine,	// PCML Missile
	[1223, "Titan_AA",						TTC_SHOP_amountMax,  2000] call _getMagazine,	// Titan AA Missile
	[1224, "Titan_AP",						TTC_SHOP_amountMax,  2000] call _getMagazine,	// Titan AP Missile
	[1225, "Titan_AT",						TTC_SHOP_amountMax,  2000] call _getMagazine	// Titan AT Missile
];

TTC_SHOP_articles_ammunition = TTC_SHOP_articles_magazines + TTC_SHOP_articles_rockets;

/*
	EXPLOSIVES format: [_id, _name, _maxAmount, _price]
*/
TTC_SHOP_articles_charges = [
	[1300, "DemoCharge_Remote_Mag",			TTC_SHOP_amountMax,  200] call _getMagazine,	// Explosive Charge
	[1301, "SatchelCharge_Remote_Mag",		TTC_SHOP_amountMax,  400] call _getMagazine		// Explosive Satchel
];

TTC_SHOP_articles_mines = [
	[1310, "APERSMine_Range_Mag",			TTC_SHOP_amountMax,  150] call _getMagazine,	// APERS Mine
	[1311, "APERSBoundingMine_Range_Mag",	TTC_SHOP_amountMax,  225] call _getMagazine,	// APERS Bounding Mine
	[1312, "APERSTripMine_Wire_Mag",		TTC_SHOP_amountMax,  225] call _getMagazine,	// APERS Tripwire Mine
	[1313, "SLAMDirectionalMine_Wire_Mag",	TTC_SHOP_amountMax,  300] call _getMagazine,	// M6 SLAM Mine
	[1314, "ATMine_Range_Mag",				TTC_SHOP_amountMax,  375] call _getMagazine		// AT Mine
];

TTC_SHOP_articles_explosives = TTC_SHOP_articles_charges + TTC_SHOP_articles_mines;


/*
	ITEMS format: [_id, _name, _maxAmount, _price]
*/
TTC_SHOP_articles_basicItems = [
	[1400, "ItemCompass",					TTC_SHOP_amountMin,  5] call _getWeapon,	// Compass
	[1401, "ItemMap",						TTC_SHOP_amountMin,  5] call _getWeapon,	// Map
	[1402, "ItemRadio",						TTC_SHOP_amountMin,  5] call _getWeapon,	// Radio
	[1403, "ItemWatch",						TTC_SHOP_amountMin,  5] call _getWeapon		// Watch
];

TTC_SHOP_articles_medic = [
	[1410, "FirstAidKit",					TTC_SHOP_amountMax,  50] call _getWeapon,	// First Aid Kit
	[1411, "Medikit",						TTC_SHOP_amountMax,  200] call _getWeapon	// Medikit
];

TTC_SHOP_articles_engineer = [
	[1420, "ToolKit",						TTC_SHOP_amountMax,  200] call _getWeapon,	// Tool Kit
	[1421, "MineDetector",					TTC_SHOP_amountMax,  150] call _getWeapon	// Mine Detector
];

TTC_SHOP_articles_binocular = [
	[1430, "Binocular",						TTC_SHOP_amountMin,  60] call _getWeapon	// Binoculars
];

TTC_SHOP_articles_rangefinder= [
	[1431, "Rangefinder",					TTC_SHOP_amountMin,  600] call _getWeapon	// Rangefinder
];

TTC_SHOP_articles_nightvision = [
	[1440, "NVGoggles",						TTC_SHOP_amountMin,  400] call _getWeapon,	// NV Goggles (Brown)
	[1441, "NVGoggles_OPFOR",				TTC_SHOP_amountMin,  400] call _getWeapon,	// NV Goggles (Black)
	[1442, "NVGoggles_INDEP",				TTC_SHOP_amountMin,  400] call _getWeapon	// NV Goggles (Green)
];

TTC_SHOP_articles_uavTerminal_WEST = [
	[1450, "B_UavTerminal",					TTC_SHOP_amountMin,  750] call _getWeapon	// UAV Terminal
];

TTC_SHOP_articles_uavTerminal_GUER = [
	[1451, "I_UavTerminal",					TTC_SHOP_amountMin,  750] call _getWeapon	// UAV Terminal
];

TTC_SHOP_articles_uavTerminals = TTC_SHOP_articles_uavTerminal_WEST + TTC_SHOP_articles_uavTerminal_GUER;

TTC_SHOP_articles_items = (
	TTC_SHOP_articles_basicItems + TTC_SHOP_articles_medic + TTC_SHOP_articles_engineer + TTC_SHOP_articles_binocular + TTC_SHOP_articles_rangefinder +
	TTC_SHOP_articles_nightvision + TTC_SHOP_articles_uavTerminals
);


/*
	HEADGEAR format: [_id, _name, _maxAmount, _price]
*/
// Shemags
TTC_SHOP_articles_goggles = [
	[1500, "G_Shades_Black",				TTC_SHOP_amountMin,	 5] call _getGlasses,	// Shades (Black)
	[1501, "G_Shades_Blue",					TTC_SHOP_amountMin,	 5] call _getGlasses,	// Shades (Blue)
	[1502, "G_Shades_Green",				TTC_SHOP_amountMin,	 5] call _getGlasses,	// Shades (Green)
	[1503, "G_Shades_Red",					TTC_SHOP_amountMin,	 5] call _getGlasses,	// Shades (Red)
	[1504, "G_Sport_Blackred",				TTC_SHOP_amountMin,	 5] call _getGlasses,	// Sport Shades (Vulcan)
	[1505, "G_Sport_BlackWhite",			TTC_SHOP_amountMin,	 5] call _getGlasses,	// Sport Shades (Shadow)
	[1506, "G_Sport_Blackyellow",			TTC_SHOP_amountMin,	 5] call _getGlasses,	// Sport Shades (Poison)
	[1507, "G_Sport_Checkered",				TTC_SHOP_amountMin,	 5] call _getGlasses,	// Sport Shades (Style)
	[1508, "G_Sport_Greenblack",			TTC_SHOP_amountMin,	 5] call _getGlasses,	// Sport Shades (Yetti)
	[1509, "G_Sport_Red",					TTC_SHOP_amountMin,	 5] call _getGlasses,	// Sport Shades (Fire)
	[1510, "G_Lady_Mirror",					TTC_SHOP_amountMin,	 5] call _getGlasses,	// Ladies Shades (Iridium)
	[1511, "G_Lady_Dark",					TTC_SHOP_amountMin,	 5] call _getGlasses,	// Ladies Shades (Sea)
	[1512, "G_Lady_Red",					TTC_SHOP_amountMin,	 5] call _getGlasses,	// Ladies Shades (Fire)
	[1513, "G_Lady_Blue",					TTC_SHOP_amountMin,	 5] call _getGlasses,	// Ladies Shades (Ice)
	[1514, "G_Spectacles",					TTC_SHOP_amountMin,	 10] call _getGlasses,	// Spectacle Glasses
	[1515, "G_Spectacles_Tinted",			TTC_SHOP_amountMin,	 10] call _getGlasses,	// Tinted Spectacles
	[1516, "G_Squares",						TTC_SHOP_amountMin,	 10] call _getGlasses,	// Square Spectacles
	[1517, "G_Squares_Tinted",				TTC_SHOP_amountMin,	 10] call _getGlasses,	// Square Shades
	[1518, "G_Lowprofile",					TTC_SHOP_amountMin,	 10] call _getGlasses,	// Low Profile Goggles
	[1523, "G_Diving",						TTC_SHOP_amountMin,	 10] call _getGlasses,	// Diving Goggles
	[1519, "G_Tactical_Clear",				TTC_SHOP_amountMin,	 15] call _getGlasses,	// Tactical Glasses
	[1520, "G_Tactical_Black",				TTC_SHOP_amountMin,	 15] call _getGlasses,	// Tactical Shades
	[1521, "G_Combat",						TTC_SHOP_amountMin,	 15] call _getGlasses,	// Combat Goggles
	[1522, "G_Aviator",						TTC_SHOP_amountMin,	 20] call _getGlasses	// Aviator Glasses
];

TTC_SHOP_articles_bandanna = [
	[1530, "G_Bandanna_aviator",			TTC_SHOP_amountMin,	 15] call _getGlasses,	// Bandanna
	[1531, "G_Bandanna_beast",				TTC_SHOP_amountMin,	 15] call _getGlasses,	// Bandanna
	[1532, "G_Bandanna_tan",				TTC_SHOP_amountMin,	 15] call _getGlasses,	// Bandanna
	[1533, "G_Bandanna_sport",				TTC_SHOP_amountMin,	 15] call _getGlasses,	// Bandanna
	[1534, "G_Bandanna_blk",				TTC_SHOP_amountMin,	 15] call _getGlasses,	// Bandanna
	[1535, "G_Bandanna_oli",				TTC_SHOP_amountMin,	 15] call _getGlasses,	// Bandanna
	[1536, "G_Bandanna_shades",				TTC_SHOP_amountMin,	 15] call _getGlasses	// Bandanna
];

TTC_SHOP_articles_balaclava = [
	[1540, "G_Balaclava_blk",				TTC_SHOP_amountMin,	 25] call _getGlasses,	// Balaclava
	[1541, "G_Balaclava_lowprofile",		TTC_SHOP_amountMin,	 25] call _getGlasses,	// Balaclava
	[1542, "G_Balaclava_combat",			TTC_SHOP_amountMin,	 25] call _getGlasses,	// Balaclava
	[1543, "G_Balaclava_oli",				TTC_SHOP_amountMin,	 25] call _getGlasses	// Balaclava
];

TTC_SHOP_articles_shemags = [
	[1550, "H_Shemag_khk",					TTC_SHOP_amountMin,	 30] call _getWeapon,	// Shemag mask (Khaki)
	[1551, "H_Shemag_tan",					TTC_SHOP_amountMin,	 30] call _getWeapon,	// Shemag mask (Tan)
	[1552, "H_Shemag_olive",				TTC_SHOP_amountMin,	 30] call _getWeapon,	// Shemag (Olive)
	[1553, "H_Shemag_olive_hs",				TTC_SHOP_amountMin,	 45] call _getWeapon,	// Shemag (Olive, Headset)
	[1554, "H_ShemagOpen_khk",				TTC_SHOP_amountMin,	 30] call _getWeapon,	// Shemag (Khaki)
	[1555, "H_ShemagOpen_tan",				TTC_SHOP_amountMin,	 30] call _getWeapon	// Shemag (Tan)
];

TTC_SHOP_articles_berets = [
	[1560, "H_Beret_blk",					TTC_SHOP_amountMin,	 50] call _getWeapon,	// Beret (Black)
	[1561, "H_Beret_red",					TTC_SHOP_amountMin,	 50] call _getWeapon,	// Beret (Red)
	[1562, "H_Beret_grn",					TTC_SHOP_amountMin,	 50] call _getWeapon,	// Beret (Green)
	[1563, "H_Beret_02",					TTC_SHOP_amountMin,	 50] call _getWeapon,	// Beret [NATO]
	[1564, "H_Beret_Colonel",				TTC_SHOP_amountMin,	 50] call _getWeapon	// Beret [NATO] (Colonel)
];

TTC_SHOP_articles_headgear = TTC_SHOP_articles_goggles + TTC_SHOP_articles_bandanna + TTC_SHOP_articles_balaclava + TTC_SHOP_articles_shemags + TTC_SHOP_articles_berets;


/*
	UNIFORMS format: [_id, _name, _maxAmount, _price]
*/
TTC_SHOP_articles_uniforms_GhillieSuit_WEST = [
	[1600, "U_B_GhillieSuit",			TTC_SHOP_amountMin,  800] call _getUniform	// Ghillie Suit [NATO]
];

TTC_SHOP_articles_uniforms_GhillieSuit_GUER = [
	[1601, "U_I_GhillieSuit",			TTC_SHOP_amountMin,  800] call _getUniform	// Ghillie Suit [AAF]
];

TTC_SHOP_articles_uniforms = TTC_SHOP_articles_uniforms_GhillieSuit_WEST + TTC_SHOP_articles_uniforms_GhillieSuit_GUER;


/*
	VESTS format: [_id, _name, _maxAmount, _price]
*/
TTC_SHOP_articles_vests_WEST = [
	[1700, "V_Rangemaster_belt",			TTC_SHOP_amountMin,  100] call _getVest,	// Rangemaster Belt
	[1701, "V_Chestrig_rgr",				TTC_SHOP_amountMin,  200] call _getVest,	// Chest rig (Green)
	[1702, "V_Chestrig_blk",				TTC_SHOP_amountMin,  200] call _getVest,	// Fighter Chestrig (Black)
	[1703, "V_Chestrig_oli",				TTC_SHOP_amountMin,  200] call _getVest		// Fighter Chestrig (Olive)
];

TTC_SHOP_articles_vests_GUER = [
	[1710, "V_BandollierB_khk",				TTC_SHOP_amountMin,  200] call _getVest,	// Slash Bandolier (Khaki)
	[1711, "V_BandollierB_cbr",				TTC_SHOP_amountMin,  200] call _getVest,	// Slash Bandolier (Coyote)
	[1712, "V_BandollierB_blk",				TTC_SHOP_amountMin,  200] call _getVest,	// Slash Bandolier (Black)
	[1713, "V_BandollierB_oli",				TTC_SHOP_amountMin,  200] call _getVest		// Slash Bandolier (Olive)
];

TTC_SHOP_articles_vests = TTC_SHOP_articles_vests_WEST + TTC_SHOP_articles_vests_GUER;


/*
	BACKPACKS format: [_id, _name, _maxAmount, _price]
*/
TTC_SHOP_articles_fieldPacks = [
	[1800, "B_FieldPack_khk",				TTC_SHOP_amountMin,  200] call _getBackpack,	// Field Pack (Khaki)
	[1801, "B_FieldPack_ocamo",				TTC_SHOP_amountMin,  200] call _getBackpack,	// Field Pack (Hex)
	[1802, "B_FieldPack_oucamo",			TTC_SHOP_amountMin,  200] call _getBackpack,	// Field Pack (Urban)
	[1803, "B_FieldPack_cbr",				TTC_SHOP_amountMin,  200] call _getBackpack,	// Field Pack (Coyote)
	[1804, "B_FieldPack_blk",				TTC_SHOP_amountMin,  200] call _getBackpack		// Field Pack (Black)
];

TTC_SHOP_articles_assaultPacks = [
	[1810, "B_AssaultPack_khk",				TTC_SHOP_amountMin,  250] call _getBackpack,	// Assault Pack (Khaki)
	[1811, "B_AssaultPack_dgtl",			TTC_SHOP_amountMin,  250] call _getBackpack,	// Assault Pack (Digi)
	[1812, "B_AssaultPack_rgr",				TTC_SHOP_amountMin,  250] call _getBackpack,	// Assault Pack (Green)
	[1813, "B_AssaultPack_blk",				TTC_SHOP_amountMin,  250] call _getBackpack,	// Assault Pack (Black)
	[1814, "B_AssaultPack_cbr",				TTC_SHOP_amountMin,  250] call _getBackpack,	// Assault Pack (Coyote)
	[1815, "B_AssaultPack_mcamo",			TTC_SHOP_amountMin,  250] call _getBackpack,	// Assault Pack (MTP)
	[1816, "B_AssaultPack_ocamo",			TTC_SHOP_amountMin,  250] call _getBackpack		// Assault Pack (Hex)
];

TTC_SHOP_articles_kitbags = [
	[1820, "B_Kitbag_rgr",					TTC_SHOP_amountMin,  375] call _getBackpack,	// Kitbag (Green)
	[1821, "B_Kitbag_mcamo",				TTC_SHOP_amountMin,  375] call _getBackpack,	// Kitbag (MTP)
	[1822, "B_Kitbag_cbr",					TTC_SHOP_amountMin,  375] call _getBackpack		// Kitbag (Coyote)
];

TTC_SHOP_articles_carryalls = [
	[1830, "B_Carryall_ocamo",				TTC_SHOP_amountMin,  450] call _getBackpack,	// Carryall Backpack (Hex)
	[1831, "B_Carryall_oucamo",				TTC_SHOP_amountMin,  450] call _getBackpack,	// Carryall Backpack (Urban)
	[1832, "B_Carryall_mcamo",				TTC_SHOP_amountMin,  450] call _getBackpack,	// Carryall Backpack (MTP)
	[1833, "B_Carryall_khk",				TTC_SHOP_amountMin,  450] call _getBackpack,	// Carryall Backpack (Khaki)
	[1834, "B_Carryall_cbr",				TTC_SHOP_amountMin,  450] call _getBackpack		// Carryall Backpack (Coyote)
];

TTC_SHOP_articles_uavBackpack_WEST = [
	[1840, "B_UAV_01_backpack_F",			TTC_SHOP_amountMin,  900] call _getBackpack	// UAV Backpack
];

TTC_SHOP_articles_uavBackpack_GUER = [
	[1841, "I_UAV_01_backpack_F",			TTC_SHOP_amountMin,  900] call _getBackpack	// UAV Backpack
];

TTC_SHOP_articles_uavBackpacks = TTC_SHOP_articles_uavBackpack_WEST + TTC_SHOP_articles_uavBackpack_GUER;

TTC_SHOP_articles_backpacks = TTC_SHOP_articles_fieldPacks + TTC_SHOP_articles_assaultPacks + TTC_SHOP_articles_kitbags + TTC_SHOP_articles_carryalls + TTC_SHOP_articles_uavBackpacks;


/*
	VEHICLES format: [_id, _name, _maxAmount, _price]
*/
TTC_SHOP_articles_vehicles_WEST = [
	[1900, "B_Quadbike_01_F",				TTC_SHOP_amountMax,  100] call _getVehicle,		// Quadbike
	[1901, "B_G_Offroad_01_F",				TTC_SHOP_amountMax,  250] call _getVehicle,		// Offroad
	[1902, "B_G_Offroad_01_armed_F",		TTC_SHOP_amountMax,  400] call _getVehicle,		// Offroad (Armed)
	[1903, "B_MRAP_01_F",					TTC_SHOP_amountMax,  500] call _getVehicle,		// Hunter
	[1904, "B_MRAP_01_hmg_F",				TTC_SHOP_amountMax,  750] call _getVehicle,		// Hunter HMG
	[1905, "B_MRAP_01_gmg_F",				TTC_SHOP_amountMax,  1000] call _getVehicle,	// Hunter GMG
	[1906, "B_Truck_01_transport_F",		TTC_SHOP_amountMax,  625] call _getVehicle,		// HEMTT Transport
	[1907, "B_Truck_01_covered_F",			TTC_SHOP_amountMax,  625] call _getVehicle,		// HEMTT Transport (Covered)
	[1908, "B_APC_Tracked_01_rcws_F",		TTC_SHOP_amountMax,  2250] call _getVehicle,	// IFV-6c Panther
	[1909, "B_APC_Tracked_01_CRV_F",		TTC_SHOP_amountMax,  2250] call _getVehicle,	// CRV-6e Bobcat
	[1910, "B_APC_Tracked_01_AA_F",			TTC_SHOP_amountMax,  3000] call _getVehicle,	// IFV-6a Cheetah
	[1911, "B_APC_Wheeled_01_cannon_F",		TTC_SHOP_amountMax,  3750] call _getVehicle,	// AMV-7 Marshall
	[1912, "B_MBT_01_cannon_F",				TTC_SHOP_amountMax,  5250] call _getVehicle,	// M2A1 Slammer
	[1913, "B_MBT_01_TUSK_F",				TTC_SHOP_amountMax,  5250] call _getVehicle		// M2A4 Slammer UP
];

TTC_SHOP_articles_vehicles_GUER = [
	[1920, "I_Quadbike_01_F",				TTC_SHOP_amountMax,  100] call _getVehicle,		// Quadbike
	[1921, "I_G_Offroad_01_F",				TTC_SHOP_amountMax,  250] call _getVehicle,		// Offroad
	[1922, "I_G_Offroad_01_armed_F",		TTC_SHOP_amountMax,  400] call _getVehicle,		// Offroad (Armed)
	[1923, "I_MRAP_03_F",					TTC_SHOP_amountMax,  500] call _getVehicle,		// Strider
	[1924, "I_MRAP_03_hmg_F",				TTC_SHOP_amountMax,  750] call _getVehicle,		// Strider HMG
	[1925, "I_MRAP_03_gmg_F",				TTC_SHOP_amountMax,  1000] call _getVehicle,	// Strider GMG
	[1926, "I_Truck_02_transport_F",		TTC_SHOP_amountMax,  625] call _getVehicle,		// Zamak Transport
	[1927, "I_Truck_02_covered_F",			TTC_SHOP_amountMax,  625] call _getVehicle,		// Zamak Transport (Covered)
	[1928, "I_APC_tracked_03_cannon_F",		TTC_SHOP_amountMax,  2250] call _getVehicle,	// FV-720 Mora
	[1929, "I_APC_Wheeled_03_cannon_F",		TTC_SHOP_amountMax,  3750] call _getVehicle,	// AFV-4 Gorgon
	[1930, "I_MBT_03_cannon_F",				TTC_SHOP_amountMax,  5250] call _getVehicle		// MBT-52 Kuma
];

TTC_SHOP_articles_vehicles_EAST = [
	[1940, "O_APC_Tracked_02_AA_F",			TTC_SHOP_amountMax,  3000] call _getVehicle	// ZSU-39 Tigris
];

TTC_SHOP_articles_vehicles = TTC_SHOP_articles_vehicles_WEST + TTC_SHOP_articles_vehicles_GUER + TTC_SHOP_articles_vehicles_EAST;


/*
	HELICOPTERS format: [_id, _name, _maxAmount, _price]
*/
TTC_SHOP_articles_helicopters_hummingbird = [
	[2000, "B_Heli_Light_01_F",						TTC_SHOP_amountMax,  750] call _getVehicle	// MH-9 Hummingbird
];

TTC_SHOP_articles_helicopters_huron = [
	[2010, "B_Heli_Transport_03_unarmed_F",			TTC_SHOP_amountMax,  1350] call _getVehicle,	// CH-67 Huron (Unarmed)
	[2011, "B_Heli_Transport_03_unarmed_green_F",	TTC_SHOP_amountMax,  1350] call _getVehicle,	// CH-67 Huron Unarmed (Green)
	[2012, "B_Heli_Transport_03_F",					TTC_SHOP_amountMax,  1875] call _getVehicle,	// CH-67 Huron
	[2013, "B_Heli_Transport_03_black_F",			TTC_SHOP_amountMax,  1875] call _getVehicle	// CH-67 Huron (Black)
];

TTC_SHOP_articles_helicopters_ghosthawk = [
	[2020, "B_Heli_Transport_01_F",					TTC_SHOP_amountMax,  1875] call _getVehicle,	// UH-80 Ghost Hawk
	[2021, "B_Heli_Transport_01_camo_F",			TTC_SHOP_amountMax,  1875] call _getVehicle	// UH-80 Ghost Hawk (Camo)
];

TTC_SHOP_articles_helicopters_pawnee = [
	[2030, "B_Heli_Light_01_armed_F",				TTC_SHOP_amountMax,  3750] call _getVehicle		// AH-9 Pawnee
];

TTC_SHOP_articles_helicopters_hellcat = [
	[2040, "I_Heli_light_03_F",						TTC_SHOP_amountMax,  750] call _getVehicle,		// WY-55 Hellcat
	[2041, "I_Heli_Transport_02_F",					TTC_SHOP_amountMax,  1350] call _getVehicle,	// WY-55 Hellcat
	[2042, "I_Heli_light_03_unarmed_F",				TTC_SHOP_amountMax,  3750] call _getVehicle		// WY-55 Hellcat (Unarmed)
];

TTC_SHOP_articles_helicopters_orca = [
	[2050, "O_Heli_Light_02_unarmed_F",				TTC_SHOP_amountMax,  2250] call _getVehicle,	// PO-30 Orca
	[2051, "O_Heli_Light_02_F",						TTC_SHOP_amountMax,  3750] call _getVehicle		// PO-30 Orca (Unarmed)
];

TTC_SHOP_articles_helicopters_taru = [
	[2060, "O_Heli_Transport_04_F",					TTC_SHOP_amountMax,  1350] call _getVehicle,	// Mi-290 Taru
	[2061, "O_Heli_Transport_04_ammo_F",			TTC_SHOP_amountMax,  1350] call _getVehicle,	// Mi-290 Taru (Ammo)
	[2062, "O_Heli_Transport_04_bench_F",			TTC_SHOP_amountMax,  1350] call _getVehicle,	// Mi-290 Taru (Bench)
	[2063, "O_Heli_Transport_04_box_F",				TTC_SHOP_amountMax,  1350] call _getVehicle,	// Mi-290 Taru (Cargo)
	[2064, "O_Heli_Transport_04_covered_F",			TTC_SHOP_amountMax,  1350] call _getVehicle,	// Mi-290 Taru (Transport)
	[2065, "O_Heli_Transport_04_fuel_F",			TTC_SHOP_amountMax,  1350] call _getVehicle,	// Mi-290 Taru (Fuel)
	[2066, "O_Heli_Transport_04_medevac_F",			TTC_SHOP_amountMax,  1350] call _getVehicle,	// Mi-290 Taru (Medical)
	[2067, "O_Heli_Transport_04_repair_F",			TTC_SHOP_amountMax,  1350] call _getVehicle		// Mi-290 Taru (Repair)
];

TTC_SHOP_articles_helicopters_taru_black = [
	[2070, "O_Heli_Transport_04_black_F",			TTC_SHOP_amountMax,  1350] call _getVehicle,	// Mi-290 Taru (Black)
	[2071, "O_Heli_Transport_04_ammo_black_F",		TTC_SHOP_amountMax,  1350] call _getVehicle,	// Mi-290 Taru (Ammo, Black)
	[2072, "O_Heli_Transport_04_bench_black_F",		TTC_SHOP_amountMax,  1350] call _getVehicle,	// Mi-290 Taru (Bench, Black)
	[2073, "O_Heli_Transport_04_box_black_F",		TTC_SHOP_amountMax,  1350] call _getVehicle,	// Mi-290 Taru (Cargo, Black)
	[2074, "O_Heli_Transport_04_covered_black_F",	TTC_SHOP_amountMax,  1350] call _getVehicle,	// Mi-290 Taru (Transport, Black)
	[2075, "O_Heli_Transport_04_fuel_black_F",		TTC_SHOP_amountMax,  1350] call _getVehicle,	// Mi-290 Taru (Fuel, Black)
	[2076, "O_Heli_Transport_04_medevac_black_F",	TTC_SHOP_amountMax,  1350] call _getVehicle,	// Mi-290 Taru (Medical, Black)
	[2077, "O_Heli_Transport_04_repair_black_F",	TTC_SHOP_amountMax,  1350] call _getVehicle		// Mi-290 Taru (Repair, Black)
];

TTC_SHOP_articles_helicopters = (
	TTC_SHOP_articles_helicopters_hummingbird + TTC_SHOP_articles_helicopters_ghosthawk + TTC_SHOP_articles_helicopters_pawnee + TTC_SHOP_articles_helicopters_hellcat +
	TTC_SHOP_articles_helicopters_orca + TTC_SHOP_articles_helicopters_huron + TTC_SHOP_articles_helicopters_taru + TTC_SHOP_articles_helicopters_taru_black
);


/*
	UAVs format: [_id, _name, _maxAmount, _price]
*/
TTC_SHOP_articles_ugvs_WEST = [
	[2100, "B_UGV_01_F",					TTC_SHOP_amountMax,  600] call _getUGV,	// UGV Stomper
	[2101, "B_UGV_01_rcws_F",				TTC_SHOP_amountMax,  1125] call _getUGV	// UGV Stomper RCWS
];

TTC_SHOP_articles_ugvs_GUER = [
	[2110, "I_UGV_01_F",					TTC_SHOP_amountMax,  600] call _getUGV,	// UGV Stomper
	[2111, "I_UGV_01_rcws_F",				TTC_SHOP_amountMax,  1125] call _getUGV	// UGV Stomper RCWS
];

TTC_SHOP_articles_ugvs = TTC_SHOP_articles_ugvs_WEST + TTC_SHOP_articles_ugvs_GUER;


/*
	UGVs format: [_id, _name, _maxAmount, _price]
*/
TTC_SHOP_articles_uavs_WEST = [
	[2200, "B_UAV_02_F",					TTC_SHOP_amountMax,  6750] call _getUAV,	// MQ4A Greyhawk
	[2201, "B_UAV_02_CAS_F",				TTC_SHOP_amountMax,  6750] call _getUAV		// MQ4A Greyhawk (CAS)
];

TTC_SHOP_articles_uavs_GUER = [
	[2210, "I_UAV_02_F",					TTC_SHOP_amountMax,  6750] call _getUAV,	// K40 Ababil-3
	[2211, "I_UAV_02_CAS_F",				TTC_SHOP_amountMax,  6750] call _getUAV		// K40 Ababil-3 (CAS)
];

TTC_SHOP_articles_uavs = TTC_SHOP_articles_uavs_WEST + TTC_SHOP_articles_uavs_GUER;


/*
	Array containing all articles
*/
TTC_SHOP_articles = (
	TTC_SHOP_articles_weapons +
	TTC_SHOP_articles_attachments +
	TTC_SHOP_articles_ammunition +
	TTC_SHOP_articles_explosives +
	TTC_SHOP_articles_items +
	TTC_SHOP_articles_headgear +
	TTC_SHOP_articles_uniforms +
	TTC_SHOP_articles_vests +
	TTC_SHOP_articles_backpacks +
	TTC_SHOP_articles_vehicles +
	TTC_SHOP_articles_helicopters +
	TTC_SHOP_articles_uavs +
	TTC_SHOP_articles_ugvs
);