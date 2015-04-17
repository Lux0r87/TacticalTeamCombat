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
	private["_id","_name","_maxAmount","_price","_config","_displayName","_descriptionShort","_picture","_data"];

	_id					= [_this, 0] call BIS_fnc_param;
	_name				= [_this, 1] call BIS_fnc_param;
	_maxAmount			= [_this, 2] call BIS_fnc_param;
	_price				= [_this, 3] call BIS_fnc_param;
	_config				= [_this, 4] call BIS_fnc_param;

	_displayName		= getText(configFile >> _config >> _name >> "displayName");
	_descriptionShort	= getText(configFile >> _config >> _name >> "descriptionShort");
	_picture			= getText(configFile >> _config >> _name >> "picture");

	_data = [];
	_data set [TTC_SHOP_ARTICLE_id, _id];
	_data set [TTC_SHOP_ARTICLE_name, _name];
	_data set [TTC_SHOP_ARTICLE_maxAmount, _maxAmount];
	_data set [TTC_SHOP_ARTICLE_price, _price];
	_data set [TTC_SHOP_ARTICLE_displayName, _displayName];
	_data set [TTC_SHOP_ARTICLE_description, _descriptionShort];
	_data set [TTC_SHOP_ARTICLE_picture, _picture];
	_data;
};

_getWeapon = {
	(_this + ["CfgWeapons"]) call _getArticle;
};

_getMagazine = {
	(_this + ["CfgMagazines"]) call _getArticle;
};

_getGlasses = {
	(_this + ["CfgGlasses"]) call _getArticle;
};

_getVehicle = {
	(_this + ["CfgVehicles"]) call _getArticle;
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
TTC_SHOP_articles_magazines = [
	[1100, "16Rnd_9x21_Mag",					TTC_SHOP_amountMax,	 25] call _getMagazine,		// 9mm 16Rnd Mag
	[1101, "30Rnd_9x21_Mag",					TTC_SHOP_amountMax,	50] call _getMagazine,		// 9mm 30Rnd Mag
	[1102, "6Rnd_45ACP_Cylinder",				TTC_SHOP_amountMax,	 20] call _getMagazine,		// .45 ACP 6Rnd Cylinder
	[1103, "9Rnd_45ACP_Mag",					TTC_SHOP_amountMax,  30] call _getMagazine,		// .45 ACP 9Rnd Mag
	[1104, "11Rnd_45ACP_Mag",					TTC_SHOP_amountMax,  40] call _getMagazine,		// .45 ACP 11Rnd Mag
	[1105, "30Rnd_45ACP_Mag_SMG_01",			TTC_SHOP_amountMax,  50] call _getMagazine,		// .45 ACP 30Rnd Vermin Mag
	[1106, "30Rnd_45ACP_Mag_SMG_01_Tracer_Green",	TTC_SHOP_amountMax,  25] call _getMagazine,	// .// .45 30Rnd VerminTracers (Green) Mag
	[1107, "30Rnd_556x45_Stanag",				TTC_SHOP_amountMax,  80] call _getMagazine,		// 5.56mm 30rnd STANAG Mag
	[1108, "30Rnd_556x45_Stanag_Tracer_Yellow",	TTC_SHOP_amountMax,  40] call _getMagazine,		// 5.56mm 30rnd Tracer (Yellow) Mag
	[1109, "30Rnd_65x39_caseless_mag",			TTC_SHOP_amountMax,  80] call _getMagazine,		// 6.5mm 30Rnd STANAG Mag
	[1110, "30Rnd_65x39_caseless_mag_Tracer",	TTC_SHOP_amountMax,  40] call _getMagazine,		// 6.5mm 30Rnd Tracer (Red) Mag
	[1111, "100Rnd_65x39_caseless_mag",			TTC_SHOP_amountMax,  120] call _getMagazine,	// 6.5mm 100Rnd Belt Case
	[1112, "100Rnd_65x39_caseless_mag_Tracer",	TTC_SHOP_amountMax,  60] call _getMagazine,		// 6.5mm 100Rnd Tracer (Red) Belt Case
	[1113, "200Rnd_65x39_cased_Box",			TTC_SHOP_amountMax,  180] call _getMagazine,	// 6.5mm 200Rnd Belt Case
	[1114, "200Rnd_65x39_cased_Box_Tracer",		TTC_SHOP_amountMax,  90] call _getMagazine,		// 6.5mm 200Rnd Belt Case Tracer (Yellow)
	[1115, "20Rnd_762x51_Mag",					TTC_SHOP_amountMax,  80] call _getMagazine,		// 7.62mm 20Rnd Mag
	[1116, "5Rnd_127x108_Mag",					TTC_SHOP_amountMax,  120] call _getMagazine,	// 12.7mm 5Rnd Mag
	[1117, "7Rnd_408_Mag",						TTC_SHOP_amountMax,  140] call _getMagazine		// .408 7Rnd LRR Mag
];

TTC_SHOP_articles_rockets = [
	[1120, "RPG32_F",						TTC_SHOP_amountMax,  500] call _getMagazine,	// RPG-42 Rocket
	[1121, "RPG32_HE_F",					TTC_SHOP_amountMax,  500] call _getMagazine,	// RPG-42 HE Rocket
	[1122, "NLAW_F",						TTC_SHOP_amountMax,  1000] call _getMagazine,	// PCML Missile
	[1123, "Titan_AA",						TTC_SHOP_amountMax,  2000] call _getMagazine,	// Titan AA Missile
	[1124, "Titan_AP",						TTC_SHOP_amountMax,  2000] call _getMagazine,	// Titan AP Missile
	[1125, "Titan_AT",						TTC_SHOP_amountMax,  2000] call _getMagazine	// Titan AT Missile
];

TTC_SHOP_articles_ammunition = TTC_SHOP_articles_magazines + TTC_SHOP_articles_rockets;

/*
	EXPLOSIVES format: [_id, _name, _maxAmount, _price]
*/
TTC_SHOP_articles_charges = [
	[1200, "DemoCharge_Remote_Mag",			TTC_SHOP_amountMax,  200] call _getMagazine,	// Explosive Charge
	[1201, "SatchelCharge_Remote_Mag",		TTC_SHOP_amountMax,  400] call _getMagazine		// Explosive Satchel
];

TTC_SHOP_articles_mines = [
	[1210, "APERSMine_Range_Mag",			TTC_SHOP_amountMax,  150] call _getMagazine,	// APERS Mine
	[1211, "APERSBoundingMine_Range_Mag",	TTC_SHOP_amountMax,  225] call _getMagazine,	// APERS Bounding Mine
	[1212, "APERSTripMine_Wire_Mag",		TTC_SHOP_amountMax,  225] call _getMagazine,	// APERS Tripwire Mine
	[1213, "SLAMDirectionalMine_Wire_Mag",	TTC_SHOP_amountMax,  300] call _getMagazine,	// M6 SLAM Mine
	[1214, "ATMine_Range_Mag",				TTC_SHOP_amountMax,  375] call _getMagazine		// AT Mine
];

TTC_SHOP_articles_explosives = TTC_SHOP_articles_charges + TTC_SHOP_articles_mines;


/*
	ITEMS format: [_id, _name, _maxAmount, _price]
*/
TTC_SHOP_articles_basicItems = [
	[1300, "ItemCompass",					TTC_SHOP_amountMin,  5] call _getWeapon,	// Compass
	[1301, "ItemMap",						TTC_SHOP_amountMin,  5] call _getWeapon,	// Map
	[1302, "ItemRadio",						TTC_SHOP_amountMin,  5] call _getWeapon,	// Radio
	[1303, "ItemWatch",						TTC_SHOP_amountMin,  5] call _getWeapon		// Watch
];

TTC_SHOP_articles_medic = [
	[1310, "FirstAidKit",					TTC_SHOP_amountMax,  50] call _getWeapon,	// First Aid Kit
	[1311, "Medikit",						TTC_SHOP_amountMax,  200] call _getWeapon	// Medikit
];

TTC_SHOP_articles_engineer = [
	[1320, "ToolKit",						TTC_SHOP_amountMax,  200] call _getWeapon,	// Tool Kit
	[1321, "MineDetector",					TTC_SHOP_amountMax,  150] call _getWeapon	// Mine Detector
];

TTC_SHOP_articles_nightvision = [
	[1330, "NVGoggles",						TTC_SHOP_amountMin,  500] call _getWeapon,	// NV Goggles (Brown)
	[1331, "NVGoggles_OPFOR",				TTC_SHOP_amountMin,  500] call _getWeapon,	// NV Goggles (Black)
	[1332, "NVGoggles_INDEP",				TTC_SHOP_amountMin,  500] call _getWeapon	// NV Goggles (Green)
];

TTC_SHOP_articles_uavTerminal_WEST = [
	[1340, "B_UavTerminal",					TTC_SHOP_amountMin,  750] call _getWeapon	// UAV Terminal
];

TTC_SHOP_articles_uavTerminal_GUER = [
	[1341, "I_UavTerminal",					TTC_SHOP_amountMin,  750] call _getWeapon	// UAV Terminal
];

TTC_SHOP_articles_uavTerminals = TTC_SHOP_articles_uavTerminal_WEST + TTC_SHOP_articles_uavTerminal_GUER;

TTC_SHOP_articles_items = TTC_SHOP_articles_basicItems + TTC_SHOP_articles_medic + TTC_SHOP_articles_engineer + TTC_SHOP_articles_nightvision + TTC_SHOP_articles_uavTerminals;


/*
	HEADGEAR format: [_id, _name, _maxAmount, _price]
*/
// Shemags
TTC_SHOP_articles_goggles = [
	[1400, "G_Shades_Black",				TTC_SHOP_amountMin,	 5] call _getGlasses,	// Shades (Black)
	[1401, "G_Shades_Blue",					TTC_SHOP_amountMin,	 5] call _getGlasses,	// Shades (Blue)
	[1402, "G_Shades_Green",				TTC_SHOP_amountMin,	 5] call _getGlasses,	// Shades (Green)
	[1403, "G_Shades_Red",					TTC_SHOP_amountMin,	 5] call _getGlasses,	// Shades (Red)
	[1404, "G_Sport_Blackred",				TTC_SHOP_amountMin,	 5] call _getGlasses,	// Sport Shades (Vulcan)
	[1405, "G_Sport_BlackWhite",			TTC_SHOP_amountMin,	 5] call _getGlasses,	// Sport Shades (Shadow)
	[1406, "G_Sport_Blackyellow",			TTC_SHOP_amountMin,	 5] call _getGlasses,	// Sport Shades (Poison)
	[1407, "G_Sport_Checkered",				TTC_SHOP_amountMin,	 5] call _getGlasses,	// Sport Shades (Style)
	[1408, "G_Sport_Greenblack",			TTC_SHOP_amountMin,	 5] call _getGlasses,	// Sport Shades (Yetti)
	[1409, "G_Sport_Red",					TTC_SHOP_amountMin,	 5] call _getGlasses,	// Sport Shades (Fire)
	[1410, "G_Lady_Mirror",					TTC_SHOP_amountMin,	 5] call _getGlasses,	// Ladies Shades (Iridium)
	[1411, "G_Lady_Dark",					TTC_SHOP_amountMin,	 5] call _getGlasses,	// Ladies Shades (Sea)
	[1412, "G_Lady_Red",					TTC_SHOP_amountMin,	 5] call _getGlasses,	// Ladies Shades (Fire)
	[1413, "G_Lady_Blue",					TTC_SHOP_amountMin,	 5] call _getGlasses,	// Ladies Shades (Ice)
	[1414, "G_Spectacles",					TTC_SHOP_amountMin,	 10] call _getGlasses,	// Spectacle Glasses
	[1415, "G_Spectacles_Tinted",			TTC_SHOP_amountMin,	 10] call _getGlasses,	// Tinted Spectacles
	[1416, "G_Squares",						TTC_SHOP_amountMin,	 10] call _getGlasses,	// Square Spectacles
	[1417, "G_Squares_Tinted",				TTC_SHOP_amountMin,	 10] call _getGlasses,	// Square Shades
	[1418, "G_Lowprofile",					TTC_SHOP_amountMin,	 10] call _getGlasses,	// Low Profile Goggles
	[1423, "G_Diving",						TTC_SHOP_amountMin,	 10] call _getGlasses,	// Diving Goggles
	[1419, "G_Tactical_Clear",				TTC_SHOP_amountMin,	 15] call _getGlasses,	// Tactical Glasses
	[1420, "G_Tactical_Black",				TTC_SHOP_amountMin,	 15] call _getGlasses,	// Tactical Shades
	[1421, "G_Combat",						TTC_SHOP_amountMin,	 15] call _getGlasses,	// Combat Goggles
	[1422, "G_Aviator",						TTC_SHOP_amountMin,	 20] call _getGlasses	// Aviator Glasses
];

TTC_SHOP_articles_bandanna = [
	[1430, "G_Bandanna_aviator",			TTC_SHOP_amountMin,	 15] call _getGlasses,	// Bandanna
	[1431, "G_Bandanna_beast",				TTC_SHOP_amountMin,	 15] call _getGlasses,	// Bandanna
	[1432, "G_Bandanna_tan",				TTC_SHOP_amountMin,	 15] call _getGlasses,	// Bandanna
	[1433, "G_Bandanna_sport",				TTC_SHOP_amountMin,	 15] call _getGlasses,	// Bandanna
	[1434, "G_Bandanna_blk",				TTC_SHOP_amountMin,	 15] call _getGlasses,	// Bandanna
	[1435, "G_Bandanna_oli",				TTC_SHOP_amountMin,	 15] call _getGlasses,	// Bandanna
	[1436, "G_Bandanna_shades",				TTC_SHOP_amountMin,	 15] call _getGlasses	// Bandanna
];

TTC_SHOP_articles_balaclava = [
	[1440, "G_Balaclava_blk",				TTC_SHOP_amountMin,	 25] call _getGlasses,	// Balaclava
	[1441, "G_Balaclava_lowprofile",		TTC_SHOP_amountMin,	 25] call _getGlasses,	// Balaclava
	[1442, "G_Balaclava_combat",			TTC_SHOP_amountMin,	 25] call _getGlasses,	// Balaclava
	[1443, "G_Balaclava_oli",				TTC_SHOP_amountMin,	 25] call _getGlasses	// Balaclava
];

TTC_SHOP_articles_shemags = [
	[1450, "H_Shemag_khk",					TTC_SHOP_amountMin,	 30] call _getWeapon,	// Shemag mask (Khaki)
	[1451, "H_Shemag_tan",					TTC_SHOP_amountMin,	 30] call _getWeapon,	// Shemag mask (Tan)
	[1452, "H_Shemag_olive",				TTC_SHOP_amountMin,	 30] call _getWeapon,	// Shemag (Olive)
	[1453, "H_Shemag_olive_hs",				TTC_SHOP_amountMin,	 45] call _getWeapon,	// Shemag (Olive, Headset)
	[1454, "H_ShemagOpen_khk",				TTC_SHOP_amountMin,	 30] call _getWeapon,	// Shemag (Khaki)
	[1455, "H_ShemagOpen_tan",				TTC_SHOP_amountMin,	 30] call _getWeapon	// Shemag (Tan)
];

TTC_SHOP_articles_berets = [
	[1460, "H_Beret_blk",					TTC_SHOP_amountMin,	 50] call _getWeapon,	// Beret (Black)
	[1461, "H_Beret_red",					TTC_SHOP_amountMin,	 50] call _getWeapon,	// Beret (Red)
	[1462, "H_Beret_grn",					TTC_SHOP_amountMin,	 50] call _getWeapon,	// Beret (Green)
	[1463, "H_Beret_02",					TTC_SHOP_amountMin,	 50] call _getWeapon,	// Beret [NATO]
	[1464, "H_Beret_Colonel",				TTC_SHOP_amountMin,	 50] call _getWeapon	// Beret [NATO] (Colonel)
];

TTC_SHOP_articles_headgear = TTC_SHOP_articles_goggles + TTC_SHOP_articles_bandanna + TTC_SHOP_articles_balaclava + TTC_SHOP_articles_shemags + TTC_SHOP_articles_berets;


/*
	UNIFORMS format: [_id, _name, _maxAmount, _price]
*/
TTC_SHOP_articles_uniforms_GhillieSuit_WEST = [
	[1500, "U_B_GhillieSuit",			TTC_SHOP_amountMin,  800] call _getWeapon	// Ghillie Suit [NATO]
];

TTC_SHOP_articles_uniforms_GhillieSuit_GUER = [
	[1501, "U_I_GhillieSuit",			TTC_SHOP_amountMin,  800] call _getWeapon	// Ghillie Suit [AAF]
];

TTC_SHOP_articles_uniforms = TTC_SHOP_articles_uniforms_GhillieSuit_WEST + TTC_SHOP_articles_uniforms_GhillieSuit_GUER;


/*
	VESTS format: [_id, _name, _maxAmount, _price]
*/
TTC_SHOP_articles_vests_WEST = [
	[1600, "V_Rangemaster_belt",			TTC_SHOP_amountMin,  100] call _getWeapon,	// Rangemaster Belt
	[1601, "V_Chestrig_rgr",				TTC_SHOP_amountMin,  200] call _getWeapon,	// Chest rig (Green)
	[1602, "V_Chestrig_blk",				TTC_SHOP_amountMin,  200] call _getWeapon,	// Fighter Chestrig (Black)
	[1603, "V_Chestrig_oli",				TTC_SHOP_amountMin,  200] call _getWeapon	// Fighter Chestrig (Olive)
];

TTC_SHOP_articles_vests_GUER = [
	[1610, "V_BandollierB_khk",				TTC_SHOP_amountMin,  200] call _getWeapon,	// Slash Bandolier (Khaki)
	[1611, "V_BandollierB_cbr",				TTC_SHOP_amountMin,  200] call _getWeapon,	// Slash Bandolier (Coyote)
	[1612, "V_BandollierB_blk",				TTC_SHOP_amountMin,  200] call _getWeapon,	// Slash Bandolier (Black)
	[1613, "V_BandollierB_oli",				TTC_SHOP_amountMin,  200] call _getWeapon	// Slash Bandolier (Olive)
];

TTC_SHOP_articles_vests = TTC_SHOP_articles_vests_WEST + TTC_SHOP_articles_vests_GUER;


/*
	BACKPACKS format: [_id, _name, _maxAmount, _price]
*/
TTC_SHOP_articles_fieldPacks = [
	[1700, "B_FieldPack_khk",				TTC_SHOP_amountMin,  200] call _getVehicle,	// Field Pack (Khaki)
	[1701, "B_FieldPack_ocamo",				TTC_SHOP_amountMin,  200] call _getVehicle,	// Field Pack (Hex)
	[1702, "B_FieldPack_oucamo",			TTC_SHOP_amountMin,  200] call _getVehicle,	// Field Pack (Urban)
	[1703, "B_FieldPack_cbr",				TTC_SHOP_amountMin,  200] call _getVehicle,	// Field Pack (Coyote)
	[1704, "B_FieldPack_blk",				TTC_SHOP_amountMin,  200] call _getVehicle	// Field Pack (Black)
];

TTC_SHOP_articles_assaultPacks = [
	[1710, "B_AssaultPack_khk",				TTC_SHOP_amountMin,  250] call _getVehicle,	// Assault Pack (Khaki)
	[1711, "B_AssaultPack_dgtl",			TTC_SHOP_amountMin,  250] call _getVehicle,	// Assault Pack (Digi)
	[1712, "B_AssaultPack_rgr",				TTC_SHOP_amountMin,  250] call _getVehicle,	// Assault Pack (Green)
	[1713, "B_AssaultPack_blk",				TTC_SHOP_amountMin,  250] call _getVehicle,	// Assault Pack (Black)
	[1714, "B_AssaultPack_cbr",				TTC_SHOP_amountMin,  250] call _getVehicle,	// Assault Pack (Coyote)
	[1715, "B_AssaultPack_mcamo",			TTC_SHOP_amountMin,  250] call _getVehicle,	// Assault Pack (MTP)
	[1716, "B_AssaultPack_ocamo",			TTC_SHOP_amountMin,  250] call _getVehicle	// Assault Pack (Hex)
];

TTC_SHOP_articles_kitbags = [
	[1720, "B_Kitbag_rgr",					TTC_SHOP_amountMin,  375] call _getVehicle,	// Kitbag (Green)
	[1721, "B_Kitbag_mcamo",				TTC_SHOP_amountMin,  375] call _getVehicle,	// Kitbag (MTP)
	[1722, "B_Kitbag_cbr",					TTC_SHOP_amountMin,  375] call _getVehicle	// Kitbag (Coyote)
];

TTC_SHOP_articles_carryalls = [
	[1730, "B_Carryall_ocamo",				TTC_SHOP_amountMin,  450] call _getVehicle,	// Carryall Backpack (Hex)
	[1730, "B_Carryall_oucamo",				TTC_SHOP_amountMin,  450] call _getVehicle,	// Carryall Backpack (Urban)
	[1730, "B_Carryall_mcamo",				TTC_SHOP_amountMin,  450] call _getVehicle,	// Carryall Backpack (MTP)
	[1730, "B_Carryall_khk",				TTC_SHOP_amountMin,  450] call _getVehicle,	// Carryall Backpack (Khaki)
	[1730, "B_Carryall_cbr",				TTC_SHOP_amountMin,  450] call _getVehicle	// Carryall Backpack (Coyote)
];

TTC_SHOP_articles_uavBackpack_WEST = [
	[1740, "B_UAV_01_backpack_F",			TTC_SHOP_amountMin,  900] call _getVehicle	// UAV Backpack
];

TTC_SHOP_articles_uavBackpack_GUER = [
	[1741, "I_UAV_01_backpack_F",			TTC_SHOP_amountMin,  900] call _getVehicle	// UAV Backpack
];

TTC_SHOP_articles_uavBackpacks = TTC_SHOP_articles_uavBackpack_WEST + TTC_SHOP_articles_uavBackpack_GUER;

TTC_SHOP_articles_backpacks = TTC_SHOP_articles_fieldPacks + TTC_SHOP_articles_assaultPacks + TTC_SHOP_articles_kitbags + TTC_SHOP_articles_carryalls + TTC_SHOP_articles_uavBackpacks;


/*
	VEHICLES format: [_id, _name, _maxAmount, _price]
*/
TTC_SHOP_articles_vehicles_WEST = [
	[1800, "B_Quadbike_01_F",				TTC_SHOP_amountMax,  100] call _getVehicle,		// Quadbike
	[1801, "B_G_Offroad_01_F",				TTC_SHOP_amountMax,  250] call _getVehicle,		// Offroad
	[1802, "B_G_Offroad_01_armed_F",		TTC_SHOP_amountMax,  400] call _getVehicle,		// Offroad (Armed)
	[1803, "B_MRAP_01_F",					TTC_SHOP_amountMax,  500] call _getVehicle,		// Hunter
	[1804, "B_MRAP_01_hmg_F",				TTC_SHOP_amountMax,  750] call _getVehicle,		// Hunter HMG
	[1805, "B_MRAP_01_gmg_F",				TTC_SHOP_amountMax,  1000] call _getVehicle,	// Hunter GMG
	[1806, "B_Truck_01_transport_F",		TTC_SHOP_amountMax,  625] call _getVehicle,		// HEMTT Transport
	[1807, "B_Truck_01_covered_F",			TTC_SHOP_amountMax,  625] call _getVehicle,		// HEMTT Transport (Covered)
	[1808, "B_APC_Tracked_01_rcws_F",		TTC_SHOP_amountMax,  2250] call _getVehicle,	// IFV-6c Panther
	[1809, "B_APC_Tracked_01_CRV_F",		TTC_SHOP_amountMax,  2250] call _getVehicle,	// CRV-6e Bobcat
	[1810, "B_APC_Tracked_01_AA_F",			TTC_SHOP_amountMax,  3000] call _getVehicle,	// IFV-6a Cheetah
	[1811, "B_APC_Wheeled_01_cannon_F",		TTC_SHOP_amountMax,  3750] call _getVehicle,	// AMV-7 Marshall
	[1812, "B_MBT_01_cannon_F",				TTC_SHOP_amountMax,  5250] call _getVehicle,	// M2A1 Slammer
	[1813, "B_MBT_01_TUSK_F",				TTC_SHOP_amountMax,  5250] call _getVehicle		// M2A4 Slammer UP
];

TTC_SHOP_articles_vehicles_GUER = [
	[1820, "I_Quadbike_01_F",				TTC_SHOP_amountMax,  100] call _getVehicle,		// Quadbike
	[1821, "I_G_Offroad_01_F",				TTC_SHOP_amountMax,  250] call _getVehicle,		// Offroad
	[1822, "I_G_Offroad_01_armed_F",		TTC_SHOP_amountMax,  400] call _getVehicle,		// Offroad (Armed)
	[1823, "I_MRAP_03_F",					TTC_SHOP_amountMax,  500] call _getVehicle,		// Strider
	[1824, "I_MRAP_03_hmg_F",				TTC_SHOP_amountMax,  750] call _getVehicle,		// Strider HMG
	[1825, "I_MRAP_03_gmg_F",				TTC_SHOP_amountMax,  1000] call _getVehicle,	// Strider GMG
	[1826, "I_Truck_02_transport_F",		TTC_SHOP_amountMax,  625] call _getVehicle,		// Zamak Transport
	[1827, "I_Truck_02_covered_F",			TTC_SHOP_amountMax,  625] call _getVehicle,		// Zamak Transport (Covered)
	[1828, "I_APC_tracked_03_cannon_F",		TTC_SHOP_amountMax,  2250] call _getVehicle,	// FV-720 Mora
	[1829, "I_APC_Wheeled_03_cannon_F",		TTC_SHOP_amountMax,  3750] call _getVehicle,	// AFV-4 Gorgon
	[1830, "I_MBT_03_cannon_F",				TTC_SHOP_amountMax,  5250] call _getVehicle		// MBT-52 Kuma
];

TTC_SHOP_articles_vehicles_EAST = [
	[1840, "O_APC_Tracked_02_AA_F",			TTC_SHOP_amountMax,  3000] call _getVehicle	// ZSU-39 Tigris
];

TTC_SHOP_articles_vehicles = TTC_SHOP_articles_vehicles_WEST + TTC_SHOP_articles_vehicles_GUER + TTC_SHOP_articles_vehicles_EAST;


/*
	HELICOPTERS format: [_id, _name, _maxAmount, _price]
*/
TTC_SHOP_articles_helicopters_hummingbird = [
	[1900, "B_Heli_Light_01_F",						TTC_SHOP_amountMax,  750] call _getVehicle	// MH-9 Hummingbird
];

TTC_SHOP_articles_helicopters_huron = [
	[1910, "B_Heli_Transport_03_unarmed_F",			TTC_SHOP_amountMax,  1350] call _getVehicle,	// CH-67 Huron (Unarmed)
	[1911, "B_Heli_Transport_03_unarmed_green_F",	TTC_SHOP_amountMax,  1350] call _getVehicle,	// CH-67 Huron Unarmed (Green)
	[1912, "B_Heli_Transport_03_F",					TTC_SHOP_amountMax,  1875] call _getVehicle,	// CH-67 Huron
	[1913, "B_Heli_Transport_03_black_F",			TTC_SHOP_amountMax,  1875] call _getVehicle	// CH-67 Huron (Black)
];

TTC_SHOP_articles_helicopters_ghosthawk = [
	[1920, "B_Heli_Transport_01_F",					TTC_SHOP_amountMax,  1875] call _getVehicle,	// UH-80 Ghost Hawk
	[1921, "B_Heli_Transport_01_camo_F",			TTC_SHOP_amountMax,  1875] call _getVehicle	// UH-80 Ghost Hawk (Camo)
];

TTC_SHOP_articles_helicopters_pawnee = [
	[1930, "B_Heli_Light_01_armed_F",				TTC_SHOP_amountMax,  3750] call _getVehicle		// AH-9 Pawnee
];

TTC_SHOP_articles_helicopters_hellcat = [
	[1940, "I_Heli_light_03_F",						TTC_SHOP_amountMax,  750] call _getVehicle,		// WY-55 Hellcat
	[1941, "I_Heli_Transport_02_F",					TTC_SHOP_amountMax,  1350] call _getVehicle,	// WY-55 Hellcat
	[1942, "I_Heli_light_03_unarmed_F",				TTC_SHOP_amountMax,  3750] call _getVehicle		// WY-55 Hellcat (Unarmed)
];

TTC_SHOP_articles_helicopters_orca = [
	[1950, "O_Heli_Light_02_unarmed_F",				TTC_SHOP_amountMax,  2250] call _getVehicle,	// PO-30 Orca
	[1951, "O_Heli_Light_02_F",						TTC_SHOP_amountMax,  3750] call _getVehicle		// PO-30 Orca (Unarmed)
];

TTC_SHOP_articles_helicopters_taru = [
	[1960, "O_Heli_Transport_04_F",					TTC_SHOP_amountMax,  1350] call _getVehicle,	// Mi-290 Taru
	[1961, "O_Heli_Transport_04_ammo_F",			TTC_SHOP_amountMax,  1350] call _getVehicle,	// Mi-290 Taru (Ammo)
	[1962, "O_Heli_Transport_04_bench_F",			TTC_SHOP_amountMax,  1350] call _getVehicle,	// Mi-290 Taru (Bench)
	[1963, "O_Heli_Transport_04_box_F",				TTC_SHOP_amountMax,  1350] call _getVehicle,	// Mi-290 Taru (Cargo)
	[1964, "O_Heli_Transport_04_covered_F",			TTC_SHOP_amountMax,  1350] call _getVehicle,	// Mi-290 Taru (Transport)
	[1965, "O_Heli_Transport_04_fuel_F",			TTC_SHOP_amountMax,  1350] call _getVehicle,	// Mi-290 Taru (Fuel)
	[1966, "O_Heli_Transport_04_medevac_F",			TTC_SHOP_amountMax,  1350] call _getVehicle,	// Mi-290 Taru (Medical)
	[1967, "O_Heli_Transport_04_repair_F",			TTC_SHOP_amountMax,  1350] call _getVehicle		// Mi-290 Taru (Repair)
];

TTC_SHOP_articles_helicopters_taru_black = [
	[1970, "O_Heli_Transport_04_black_F",			TTC_SHOP_amountMax,  1350] call _getVehicle,	// Mi-290 Taru (Black)
	[1971, "O_Heli_Transport_04_ammo_black_F",		TTC_SHOP_amountMax,  1350] call _getVehicle,	// Mi-290 Taru (Ammo, Black)
	[1972, "O_Heli_Transport_04_bench_black_F",		TTC_SHOP_amountMax,  1350] call _getVehicle,	// Mi-290 Taru (Bench, Black)
	[1973, "O_Heli_Transport_04_box_black_F",		TTC_SHOP_amountMax,  1350] call _getVehicle,	// Mi-290 Taru (Cargo, Black)
	[1974, "O_Heli_Transport_04_covered_black_F",	TTC_SHOP_amountMax,  1350] call _getVehicle,	// Mi-290 Taru (Transport, Black)
	[1975, "O_Heli_Transport_04_fuel_black_F",		TTC_SHOP_amountMax,  1350] call _getVehicle,	// Mi-290 Taru (Fuel, Black)
	[1976, "O_Heli_Transport_04_medevac_black_F",	TTC_SHOP_amountMax,  1350] call _getVehicle,	// Mi-290 Taru (Medical, Black)
	[1977, "O_Heli_Transport_04_repair_black_F",	TTC_SHOP_amountMax,  1350] call _getVehicle		// Mi-290 Taru (Repair, Black)
];

TTC_SHOP_articles_helicopters = (
	TTC_SHOP_articles_helicopters_hummingbird + TTC_SHOP_articles_helicopters_ghosthawk + TTC_SHOP_articles_helicopters_pawnee + TTC_SHOP_articles_helicopters_hellcat +
	TTC_SHOP_articles_helicopters_orca + TTC_SHOP_articles_helicopters_huron + TTC_SHOP_articles_helicopters_taru + TTC_SHOP_articles_helicopters_taru_black
);


/*
	UAVs format: [_id, _name, _maxAmount, _price]
*/
TTC_SHOP_articles_uavs_WEST = [
	[2000, "B_UGV_01_F",					TTC_SHOP_amountMax,  600] call _getVehicle,	// UGV Stomper
	[2001, "B_UGV_01_rcws_F",				TTC_SHOP_amountMax,  1125] call _getVehicle	// UGV Stomper RCWS
];

TTC_SHOP_articles_uavs_GUER = [
	[2010, "I_UGV_01_F",					TTC_SHOP_amountMax,  600] call _getVehicle,	// UGV Stomper
	[2011, "I_UGV_01_rcws_F",				TTC_SHOP_amountMax,  1125] call _getVehicle	// UGV Stomper RCWS
];

TTC_SHOP_articles_uavs = TTC_SHOP_articles_uavs_WEST + TTC_SHOP_articles_uavs_GUER;


/*
	UGVs format: [_id, _name, _maxAmount, _price]
*/
TTC_SHOP_articles_ugvs_WEST = [
	[2100, "B_UAV_02_F",					TTC_SHOP_amountMax,  6750] call _getVehicle,	// MQ4A Greyhawk
	[2101, "B_UAV_02_CAS_F",				TTC_SHOP_amountMax,  6750] call _getVehicle		// MQ4A Greyhawk (CAS)
];

TTC_SHOP_articles_ugvs_GUER = [
	[2110, "I_UAV_02_F",					TTC_SHOP_amountMax,  6750] call _getVehicle,	// K40 Ababil-3
	[2111, "I_UAV_02_CAS_F",				TTC_SHOP_amountMax,  6750] call _getVehicle		// K40 Ababil-3 (CAS)
];

TTC_SHOP_articles_ugvs = TTC_SHOP_articles_ugvs_WEST + TTC_SHOP_articles_ugvs_GUER;


/*
	Array containing all articles
*/
TTC_SHOP_articles = (
	TTC_SHOP_articles_weapons +
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