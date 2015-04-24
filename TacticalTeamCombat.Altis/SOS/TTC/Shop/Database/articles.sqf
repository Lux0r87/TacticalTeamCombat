/////////////////////////////////////////////
//// Auto generated code. DO NOT MODIFY! ////
/////////////////////////////////////////////


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

	_name	    = [_this, 0] call BIS_fnc_param;
	_container	= getText	(configFile >> "CfgWeapons" >> _name >> "ItemInfo" >> "containerClass");
	_capacity	= getNumber	(configFile >> "CfgVehicles" >> _container >> "maximumLoad");

	_capacity;
};

_getWeapon = {

	private ["_name","_text"];

	_name   = [_this, 1] call BIS_fnc_param;
	_short	= getText	(configFile >> "CfgWeapons" >> _name >> "descriptionShort");
	_text   = getText	(configFile >> "CfgWeapons" >> _name >> "Library" >> "libTextDesc");

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

	_name	    = [_this, 0] call BIS_fnc_param;
	_hasDriver	= getNumber	(configFile >> "CfgVehicles" >> _name >> "hasDriver");
	_transport	= getNumber	(configFile >> "CfgVehicles" >> _name >> "transportSoldier");
	_seats		= _hasDriver + _transport;
	_turrets	= (configFile >> "CfgVehicles" >> _name >> "Turrets");

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

	private ["_name","_mass","_capacity","_description"];

	_name	        = [_this, 1] call BIS_fnc_param;
	_mass		    = getNumber	(configFile >> "CfgWeapons" >> _name >> "ItemInfo" >> "mass");
	_capacity	    = [_name] call _getCapacity;
	_description	= format["Mass: %1<br/>Capacity: %2", _mass, _capacity];

	(_this + ["CfgWeapons", _description]) call _getArticle;
};

_getVest = {

	private ["_name","_mass","_capacity","_armor","_description"];

	_name	        = [_this, 1] call BIS_fnc_param;
	_mass		    = getNumber	(configFile >> "CfgWeapons" >> _name >> "ItemInfo" >> "mass");
	_capacity	    = [_name] call _getCapacity;
	_armor		    = getNumber	(configFile >> "CfgWeapons" >> _name >> "ItemInfo" >> "armor");
	_description	= format["Mass: %1<br/>Capacity: %2<br/>Armor: %3", _mass, _capacity, _armor];

	(_this + ["CfgWeapons", _description]) call _getArticle;
};

_getBackpack = {

	private ["_name","_mass","_capacity","_description"];

	_name	        = [_this, 1] call BIS_fnc_param;
	_mass		    = getNumber	(configFile >> "CfgVehicles" >> _name >> "mass");
	_capacity	    = getNumber	(configFile >> "CfgVehicles" >> _name >> "maximumLoad");
	_description	= format["Mass: %1<br/>Capacity: %2", _mass, _capacity];

	(_this + ["CfgVehicles", _description]) call _getArticle;
};

_getVehicle = {

	private ["_name","_capacity","_armor","_seats","_maxSpeed","_text","_description"];

	_name	        = [_this, 1] call BIS_fnc_param;
	_capacity	    = getNumber	(configFile >> "CfgVehicles" >> _name >> "maximumLoad");
	_armor		    = getNumber	(configFile >> "CfgVehicles" >> _name >> "armor");
	_seats		    = [_name] call _countVehicleSeats;
	_maxSpeed	    = getNumber	(configFile >> "CfgVehicles" >> _name >> "maxSpeed");
	_text		    = getText	(configFile >> "CfgVehicles" >> _name >> "Library" >> "libTextDesc");
	_description	= format["Capacity: %1<br/>Armor: %2<br/>Seats: %3<br/>Max Speed: %4<br/><br/>%5", _capacity, _armor, _seats, _maxSpeed, _text];

	(_this + ["CfgVehicles", _description]) call _getArticle;
};


_getUGV = {

	private ["_name","_capacity","_armor","_hasDriver","_maxSpeed","_text","_description"];

	_name	        = [_this, 1] call BIS_fnc_param;
	_capacity	    = getNumber	(configFile >> "CfgVehicles" >> _name >> "maximumLoad");
	_armor		    = getNumber	(configFile >> "CfgVehicles" >> _name >> "armor");
	_hasDriver	    = getNumber	(configFile >> "CfgVehicles" >> _name >> "hasDriver");
	_maxSpeed	    = getNumber	(configFile >> "CfgVehicles" >> _name >> "maxSpeed");
	_text		    = getText	(configFile >> "CfgVehicles" >> _name >> "Library" >> "libTextDesc");
	_description	= format["Capacity: %1<br/>Armor: %2<br/>Seats: %3<br/>Max Speed: %4<br/><br/>%5", _capacity, _armor, _hasDriver, _maxSpeed, _text];

	(_this + ["CfgVehicles", _description]) call _getArticle;
};

_getUAV = {

	private ["_name","_capacity","_armor","_maxSpeed","_text","_description"];

	_name	        = [_this, 1] call BIS_fnc_param;
	_capacity	    = getNumber	(configFile >> "CfgVehicles" >> _name >> "maximumLoad");
	_armor		    = getNumber	(configFile >> "CfgVehicles" >> _name >> "armor");
	_maxSpeed	    = getNumber	(configFile >> "CfgVehicles" >> _name >> "maxSpeed");
	_text		    = getText	(configFile >> "CfgVehicles" >> _name >> "Armory" >> "description");
	_description	= format["Capacity: %1<br/>Armor: %2<br/>Max Speed: %3<br/><br/>%4", _capacity, _armor, _maxSpeed, _text];

	(_this + ["CfgVehicles", _description]) call _getArticle;
};


/*
  Article variables.
  Name:  TTC_SHOP_article_<ArmaClassName>
  Data:  [id, armaClassName, price]
*/
TTC_SHOP_article_SMG_01_F = [-6, "SMG_01_F", 42, 300] call _getWeapon;
TTC_SHOP_article_hgun_PDW2000_F = [-7, "hgun_PDW2000_F", 42, 300] call _getWeapon;
TTC_SHOP_article_SMG_02_F = [-8, "SMG_02_F", 42, 300] call _getWeapon;
TTC_SHOP_article_arifle_MXC_F = [-9, "arifle_MXC_F", 42, 450] call _getWeapon;
TTC_SHOP_article_arifle_TRG20_F = [-10, "arifle_TRG20_F", 42, 450] call _getWeapon;
TTC_SHOP_article_arifle_Mk20C_F = [-11, "arifle_Mk20C_F", 42, 450] call _getWeapon;
TTC_SHOP_article_arifle_Katiba_C_F = [-12, "arifle_Katiba_C_F", 42, 450] call _getWeapon;
TTC_SHOP_article_arifle_MX_F = [-13, "arifle_MX_F", 42, 600] call _getWeapon;
TTC_SHOP_article_arifle_TRG21_F = [-14, "arifle_TRG21_F", 42, 600] call _getWeapon;
TTC_SHOP_article_arifle_Mk20_F = [-15, "arifle_Mk20_F", 42, 600] call _getWeapon;
TTC_SHOP_article_arifle_Katiba_F = [-16, "arifle_Katiba_F", 42, 600] call _getWeapon;
TTC_SHOP_article_arifle_MX_GL_F = [-17, "arifle_MX_GL_F", 42, 750] call _getWeapon;
TTC_SHOP_article_arifle_TRG21_GL_F = [-18, "arifle_TRG21_GL_F", 42, 750] call _getWeapon;
TTC_SHOP_article_arifle_Katiba_GL_F = [-19, "arifle_Katiba_GL_F", 42, 750] call _getWeapon;
TTC_SHOP_article_arifle_MX_SW_F = [-20, "arifle_MX_SW_F", 42, 700] call _getWeapon;
TTC_SHOP_article_LMG_Mk200_F = [-21, "LMG_Mk200_F", 42, 875] call _getWeapon;
TTC_SHOP_article_LMG_Zafir_F = [-22, "LMG_Zafir_F", 42, 1050] call _getWeapon;
TTC_SHOP_article_MMG_01_hex_F = [-23, "MMG_01_hex_F", 42, 1225] call _getWeapon;
TTC_SHOP_article_MMG_01_tan_F = [-24, "MMG_01_tan_F", 42, 1225] call _getWeapon;
TTC_SHOP_article_MMG_02_camo_F = [-25, "MMG_02_camo_F", 42, 1225] call _getWeapon;
TTC_SHOP_article_MMG_02_black_F = [-26, "MMG_02_black_F", 42, 1225] call _getWeapon;
TTC_SHOP_article_MMG_02_sand_F = [-27, "MMG_02_sand_F", 42, 1225] call _getWeapon;
TTC_SHOP_article_arifle_MXM_F = [-28, "arifle_MXM_F", 42, 840] call _getWeapon;
TTC_SHOP_article_srifle_EBR_F = [-29, "srifle_EBR_F", 42, 1050] call _getWeapon;
TTC_SHOP_article_srifle_DMR_01_F = [-30, "srifle_DMR_01_F", 42, 1050] call _getWeapon;
TTC_SHOP_article_srifle_DMR_03_F = [-31, "srifle_DMR_03_F", 42, 1050] call _getWeapon;
TTC_SHOP_article_srifle_DMR_03_khaki_F = [-32, "srifle_DMR_03_khaki_F", 42, 1050] call _getWeapon;
TTC_SHOP_article_srifle_DMR_03_tan_F = [-33, "srifle_DMR_03_tan_F", 42, 1050] call _getWeapon;
TTC_SHOP_article_srifle_DMR_03_multicam_F = [-34, "srifle_DMR_03_multicam_F", 42, 1050] call _getWeapon;
TTC_SHOP_article_srifle_DMR_03_woodland_F = [-35, "srifle_DMR_03_woodland_F", 42, 1050] call _getWeapon;
TTC_SHOP_article_srifle_DMR_05_blk_F = [-36, "srifle_DMR_05_blk_F", 42, 1050] call _getWeapon;
TTC_SHOP_article_srifle_DMR_05_hex_F = [-37, "srifle_DMR_05_hex_F", 42, 1050] call _getWeapon;
TTC_SHOP_article_srifle_DMR_05_tan_f = [-38, "srifle_DMR_05_tan_f", 42, 1050] call _getWeapon;
TTC_SHOP_article_srifle_DMR_06_camo_F = [-39, "srifle_DMR_06_camo_F", 42, 1050] call _getWeapon;
TTC_SHOP_article_srifle_DMR_06_olive_F = [-40, "srifle_DMR_06_olive_F", 42, 1050] call _getWeapon;
TTC_SHOP_article_srifle_GM6_F = [-41, "srifle_GM6_F", 42, 1365] call _getWeapon;
TTC_SHOP_article_srifle_LRR_F = [-42, "srifle_LRR_F", 42, 1365] call _getWeapon;
TTC_SHOP_article_srifle_DMR_02_F = [-43, "srifle_DMR_02_F", 42, 1365] call _getWeapon;
TTC_SHOP_article_srifle_DMR_02_camo_F = [-44, "srifle_DMR_02_camo_F", 42, 1365] call _getWeapon;
TTC_SHOP_article_srifle_DMR_04_F = [-45, "srifle_DMR_04_F", 42, 1365] call _getWeapon;
TTC_SHOP_article_srifle_DMR_04_Tan_F = [-46, "srifle_DMR_04_Tan_F", 42, 1365] call _getWeapon;
TTC_SHOP_article_hgun_P07_F = [-1, "hgun_P07_F", 42, 80] call _getWeapon;
TTC_SHOP_article_hgun_ACPC2_F = [-2, "hgun_ACPC2_F", 42, 80] call _getWeapon;
TTC_SHOP_article_hgun_Rook40_F = [-3, "hgun_Rook40_F", 42, 80] call _getWeapon;
TTC_SHOP_article_hgun_Pistol_heavy_01_F = [-4, "hgun_Pistol_heavy_01_F", 42, 150] call _getWeapon;
TTC_SHOP_article_hgun_Pistol_heavy_02_F = [-5, "hgun_Pistol_heavy_02_F", 42, 150] call _getWeapon;
TTC_SHOP_article_launch_RPG32_F = [-47, "launch_RPG32_F", 42, 750] call _getWeapon;
TTC_SHOP_article_launch_NLAW_F = [-48, "launch_NLAW_F", 42, 1125] call _getWeapon;
TTC_SHOP_article_launch_B_Titan_short_F = [-49, "launch_B_Titan_short_F", 42, 1500] call _getWeapon;
TTC_SHOP_article_launch_I_Titan_short_F = [-50, "launch_I_Titan_short_F", 42, 1500] call _getWeapon;
TTC_SHOP_article_launch_B_Titan_F = [-51, "launch_B_Titan_F", 42, 1500] call _getWeapon;
TTC_SHOP_article_launch_I_Titan_F = [-52, "launch_I_Titan_F", 42, 1500] call _getWeapon;
TTC_SHOP_article_optic_MRD = [-121, "optic_MRD", 42, 75] call _getItem;
TTC_SHOP_article_optic_Yorris = [-122, "optic_Yorris", 42, 75] call _getItem;
TTC_SHOP_article_optic_Aco_smg = [-123, "optic_Aco_smg", 42, 100] call _getItem;
TTC_SHOP_article_optic_ACO_grn_smg = [-124, "optic_ACO_grn_smg", 42, 100] call _getItem;
TTC_SHOP_article_optic_Holosight_smg = [-125, "optic_Holosight_smg", 42, 125] call _getItem;
TTC_SHOP_article_optic_Aco = [-126, "optic_Aco", 42, 100] call _getItem;
TTC_SHOP_article_optic_ACO_grn = [-127, "optic_ACO_grn", 42, 100] call _getItem;
TTC_SHOP_article_optic_Holosight = [-128, "optic_Holosight", 42, 125] call _getItem;
TTC_SHOP_article_optic_MRCO = [-129, "optic_MRCO", 42, 200] call _getItem;
TTC_SHOP_article_optic_Hamr = [-130, "optic_Hamr", 42, 300] call _getItem;
TTC_SHOP_article_optic_Arco = [-131, "optic_Arco", 42, 300] call _getItem;
TTC_SHOP_article_optic_NVS = [-132, "optic_NVS", 42, 300] call _getItem;
TTC_SHOP_article_optic_AMS = [-133, "optic_AMS", 42, 375] call _getItem;
TTC_SHOP_article_optic_AMS_khk = [-134, "optic_AMS_khk", 42, 375] call _getItem;
TTC_SHOP_article_optic_AMS_snd = [-135, "optic_AMS_snd", 42, 375] call _getItem;
TTC_SHOP_article_optic_KHS_blk = [-136, "optic_KHS_blk", 42, 375] call _getItem;
TTC_SHOP_article_optic_KHS_hex = [-137, "optic_KHS_hex", 42, 375] call _getItem;
TTC_SHOP_article_optic_KHS_old = [-138, "optic_KHS_old", 42, 375] call _getItem;
TTC_SHOP_article_optic_KHS_tan = [-139, "optic_KHS_tan", 42, 375] call _getItem;
TTC_SHOP_article_optic_DMS = [-140, "optic_DMS", 42, 450] call _getItem;
TTC_SHOP_article_optic_LRPS = [-141, "optic_LRPS", 42, 750] call _getItem;
TTC_SHOP_article_optic_SOS = [-142, "optic_SOS", 42, 525] call _getItem;
TTC_SHOP_article_muzzle_snds_L = [-143, "muzzle_snds_L", 42, 120] call _getItem;
TTC_SHOP_article_muzzle_snds_acp = [-144, "muzzle_snds_acp", 42, 120] call _getItem;
TTC_SHOP_article_muzzle_snds_M = [-145, "muzzle_snds_M", 42, 180] call _getItem;
TTC_SHOP_article_muzzle_snds_H = [-146, "muzzle_snds_H", 42, 180] call _getItem;
TTC_SHOP_article_muzzle_snds_H_SW = [-147, "muzzle_snds_H_SW", 42, 180] call _getItem;
TTC_SHOP_article_muzzle_snds_H_MG = [-148, "muzzle_snds_H_MG", 42, 180] call _getItem;
TTC_SHOP_article_muzzle_snds_B = [-149, "muzzle_snds_B", 42, 270] call _getItem;
TTC_SHOP_article_muzzle_snds_338_black = [-150, "muzzle_snds_338_black", 42, 405] call _getItem;
TTC_SHOP_article_muzzle_snds_338_green = [-151, "muzzle_snds_338_green", 42, 405] call _getItem;
TTC_SHOP_article_muzzle_snds_93mmg = [-152, "muzzle_snds_93mmg", 42, 405] call _getItem;
TTC_SHOP_article_muzzle_snds_93mmg_tan = [-153, "muzzle_snds_93mmg_tan", 42, 405] call _getItem;
TTC_SHOP_article_acc_flashlight = [-119, "acc_flashlight", 42, 25] call _getItem;
TTC_SHOP_article_acc_pointer_IR = [-120, "acc_pointer_IR", 42, 50] call _getItem;
TTC_SHOP_article_16Rnd_9x21_Mag = [-53, "16Rnd_9x21_Mag", 42, 20] call _getMagazine;
TTC_SHOP_article_30Rnd_9x21_Mag = [-54, "30Rnd_9x21_Mag", 42, 40] call _getMagazine;
TTC_SHOP_article_6Rnd_45ACP_Cylinder = [-55, "6Rnd_45ACP_Cylinder", 42, 15] call _getMagazine;
TTC_SHOP_article_9Rnd_45ACP_Mag = [-56, "9Rnd_45ACP_Mag", 42, 20] call _getMagazine;
TTC_SHOP_article_11Rnd_45ACP_Mag = [-57, "11Rnd_45ACP_Mag", 42, 25] call _getMagazine;
TTC_SHOP_article_30Rnd_45ACP_Mag_SMG_01 = [-58, "30Rnd_45ACP_Mag_SMG_01", 42, 50] call _getMagazine;
TTC_SHOP_article_30Rnd_45ACP_Mag_SMG_01_Tracer_Green = [-59, "30Rnd_45ACP_Mag_SMG_01_Tracer_Green", 42, 25] call _getMagazine;
TTC_SHOP_article_30Rnd_556x45_Stanag = [-60, "30Rnd_556x45_Stanag", 42, 60] call _getMagazine;
TTC_SHOP_article_30Rnd_556x45_Stanag_Tracer_Yellow = [-61, "30Rnd_556x45_Stanag_Tracer_Yellow", 42, 30] call _getMagazine;
TTC_SHOP_article_30Rnd_65x39_caseless_mag = [-62, "30Rnd_65x39_caseless_mag", 42, 60] call _getMagazine;
TTC_SHOP_article_30Rnd_65x39_caseless_mag_Tracer = [-63, "30Rnd_65x39_caseless_mag_Tracer", 42, 30] call _getMagazine;
TTC_SHOP_article_100Rnd_65x39_caseless_mag = [-64, "100Rnd_65x39_caseless_mag", 42, 80] call _getMagazine;
TTC_SHOP_article_100Rnd_65x39_caseless_mag_Tracer = [-65, "100Rnd_65x39_caseless_mag_Tracer", 42, 40] call _getMagazine;
TTC_SHOP_article_200Rnd_65x39_cased_Box = [-66, "200Rnd_65x39_cased_Box", 42, 160] call _getMagazine;
TTC_SHOP_article_200Rnd_65x39_cased_Box_Tracer = [-67, "200Rnd_65x39_cased_Box_Tracer", 42, 80] call _getMagazine;
TTC_SHOP_article_20Rnd_762x51_Mag = [-68, "20Rnd_762x51_Mag", 42, 60] call _getMagazine;
TTC_SHOP_article_150Rnd_762x54_Box = [-69, "150Rnd_762x54_Box", 42, 120] call _getMagazine;
TTC_SHOP_article_150Rnd_762x54_Box_Tracer = [-70, "150Rnd_762x54_Box_Tracer", 42, 60] call _getMagazine;
TTC_SHOP_article_10Rnd_338_Mag = [-71, "10Rnd_338_Mag", 42, 70] call _getMagazine;
TTC_SHOP_article_130Rnd_338_Mag = [-72, "130Rnd_338_Mag", 42, 140] call _getMagazine;
TTC_SHOP_article_10Rnd_93x64_DMR_05_Mag = [-73, "10Rnd_93x64_DMR_05_Mag", 42, 70] call _getMagazine;
TTC_SHOP_article_150Rnd_93x64_Mag = [-74, "150Rnd_93x64_Mag", 42, 150] call _getMagazine;
TTC_SHOP_article_7Rnd_408_Mag = [-75, "7Rnd_408_Mag", 42, 120] call _getMagazine;
TTC_SHOP_article_5Rnd_127x108_Mag = [-76, "5Rnd_127x108_Mag", 42, 90] call _getMagazine;
TTC_SHOP_article_10Rnd_127x54_Mag = [-77, "10Rnd_127x54_Mag", 42, 180] call _getMagazine;
TTC_SHOP_article_RPG32_F = [-78, "RPG32_F", 42, 500] call _getMagazine;
TTC_SHOP_article_RPG32_HE_F = [-79, "RPG32_HE_F", 42, 500] call _getMagazine;
TTC_SHOP_article_NLAW_F = [-80, "NLAW_F", 42, 1000] call _getMagazine;
TTC_SHOP_article_Titan_AA = [-81, "Titan_AA", 42, 1500] call _getMagazine;
TTC_SHOP_article_Titan_AP = [-82, "Titan_AP", 42, 1500] call _getMagazine;
TTC_SHOP_article_Titan_AT = [-83, "Titan_AT", 42, 1500] call _getMagazine;
TTC_SHOP_article_DemoCharge_Remote_Mag = [-154, "DemoCharge_Remote_Mag", 42, 200] call _getMagazine;
TTC_SHOP_article_SatchelCharge_Remote_Mag = [-155, "SatchelCharge_Remote_Mag", 42, 400] call _getMagazine;
TTC_SHOP_article_APERSMine_Range_Mag = [-156, "APERSMine_Range_Mag", 42, 150] call _getMagazine;
TTC_SHOP_article_APERSBoundingMine_Range_Mag = [-157, "APERSBoundingMine_Range_Mag", 42, 225] call _getMagazine;
TTC_SHOP_article_APERSTripMine_Wire_Mag = [-158, "APERSTripMine_Wire_Mag", 42, 225] call _getMagazine;
TTC_SHOP_article_SLAMDirectionalMine_Wire_Mag = [-159, "SLAMDirectionalMine_Wire_Mag", 42, 300] call _getMagazine;
TTC_SHOP_article_ATMine_Range_Mag = [-160, "ATMine_Range_Mag", 42, 375] call _getMagazine;
TTC_SHOP_article_ItemCompass = [-161, "ItemCompass", 42, 5] call _getWeapon;
TTC_SHOP_article_ItemMap = [-162, "ItemMap", 42, 5] call _getWeapon;
TTC_SHOP_article_ItemRadio = [-163, "ItemRadio", 42, 5] call _getWeapon;
TTC_SHOP_article_ItemWatch = [-164, "ItemWatch", 42, 5] call _getWeapon;
TTC_SHOP_article_Binocular = [-165, "Binocular", 42, 60] call _getWeapon;
TTC_SHOP_article_Rangefinder = [-166, "Rangefinder", 42, 600] call _getWeapon;
TTC_SHOP_article_B_UavTerminal = [-174, "B_UavTerminal", 42, 750] call _getWeapon;
TTC_SHOP_article_I_UavTerminal = [-175, "I_UavTerminal", 42, 750] call _getWeapon;
TTC_SHOP_article_FirstAidKit = [-167, "FirstAidKit", 42, 50] call _getWeapon;
TTC_SHOP_article_Medikit = [-168, "Medikit", 42, 200] call _getWeapon;
TTC_SHOP_article_ToolKit = [-169, "ToolKit", 42, 200] call _getWeapon;
TTC_SHOP_article_MineDetector = [-170, "MineDetector", 42, 150] call _getWeapon;
TTC_SHOP_article_NVGoggles = [-171, "NVGoggles", 42, 400] call _getWeapon;
TTC_SHOP_article_NVGoggles_OPFOR = [-172, "NVGoggles_OPFOR", 42, 400] call _getWeapon;
TTC_SHOP_article_NVGoggles_INDEP = [-173, "NVGoggles_INDEP", 42, 400] call _getWeapon;
TTC_SHOP_article_H_Shemag_khk = [-211, "H_Shemag_khk", 42, 30] call _getWeapon;
TTC_SHOP_article_H_Shemag_tan = [-212, "H_Shemag_tan", 42, 30] call _getWeapon;
TTC_SHOP_article_H_Shemag_olive = [-213, "H_Shemag_olive", 42, 30] call _getWeapon;
TTC_SHOP_article_H_Shemag_olive_hs = [-214, "H_Shemag_olive_hs", 42, 45] call _getWeapon;
TTC_SHOP_article_H_ShemagOpen_khk = [-215, "H_ShemagOpen_khk", 42, 30] call _getWeapon;
TTC_SHOP_article_H_ShemagOpen_tan = [-216, "H_ShemagOpen_tan", 42, 30] call _getWeapon;
TTC_SHOP_article_H_Beret_blk = [-217, "H_Beret_blk", 42, 50] call _getWeapon;
TTC_SHOP_article_H_Beret_red = [-218, "H_Beret_red", 42, 50] call _getWeapon;
TTC_SHOP_article_H_Beret_grn = [-219, "H_Beret_grn", 42, 50] call _getWeapon;
TTC_SHOP_article_H_Beret_02 = [-220, "H_Beret_02", 42, 50] call _getWeapon;
TTC_SHOP_article_H_Beret_Colonel = [-221, "H_Beret_Colonel", 42, 50] call _getWeapon;
TTC_SHOP_article_G_Spectacles = [-190, "G_Spectacles", 42, 10] call _getGlasses;
TTC_SHOP_article_G_Spectacles_Tinted = [-191, "G_Spectacles_Tinted", 42, 10] call _getGlasses;
TTC_SHOP_article_G_Squares = [-192, "G_Squares", 42, 10] call _getGlasses;
TTC_SHOP_article_G_Squares_Tinted = [-193, "G_Squares_Tinted", 42, 10] call _getGlasses;
TTC_SHOP_article_G_Lowprofile = [-194, "G_Lowprofile", 42, 10] call _getGlasses;
TTC_SHOP_article_G_Diving = [-195, "G_Diving", 42, 10] call _getGlasses;
TTC_SHOP_article_G_Tactical_Clear = [-196, "G_Tactical_Clear", 42, 15] call _getGlasses;
TTC_SHOP_article_G_Tactical_Black = [-197, "G_Tactical_Black", 42, 15] call _getGlasses;
TTC_SHOP_article_G_Combat = [-198, "G_Combat", 42, 15] call _getGlasses;
TTC_SHOP_article_G_Aviator = [-199, "G_Aviator", 42, 20] call _getGlasses;
TTC_SHOP_article_G_Shades_Black = [-176, "G_Shades_Black", 42, 5] call _getGlasses;
TTC_SHOP_article_G_Shades_Blue = [-177, "G_Shades_Blue", 42, 5] call _getGlasses;
TTC_SHOP_article_G_Shades_Green = [-178, "G_Shades_Green", 42, 5] call _getGlasses;
TTC_SHOP_article_G_Shades_Red = [-179, "G_Shades_Red", 42, 5] call _getGlasses;
TTC_SHOP_article_G_Sport_Blackred = [-180, "G_Sport_Blackred", 42, 5] call _getGlasses;
TTC_SHOP_article_G_Sport_BlackWhite = [-181, "G_Sport_BlackWhite", 42, 5] call _getGlasses;
TTC_SHOP_article_G_Sport_Blackyellow = [-182, "G_Sport_Blackyellow", 42, 5] call _getGlasses;
TTC_SHOP_article_G_Sport_Checkered = [-183, "G_Sport_Checkered", 42, 5] call _getGlasses;
TTC_SHOP_article_G_Sport_Greenblack = [-184, "G_Sport_Greenblack", 42, 5] call _getGlasses;
TTC_SHOP_article_G_Sport_Red = [-185, "G_Sport_Red", 42, 5] call _getGlasses;
TTC_SHOP_article_G_Lady_Mirror = [-186, "G_Lady_Mirror", 42, 5] call _getGlasses;
TTC_SHOP_article_G_Lady_Dark = [-187, "G_Lady_Dark", 42, 5] call _getGlasses;
TTC_SHOP_article_G_Lady_Red = [-188, "G_Lady_Red", 42, 5] call _getGlasses;
TTC_SHOP_article_G_Lady_Blue = [-189, "G_Lady_Blue", 42, 5] call _getGlasses;
TTC_SHOP_article_G_Bandanna_aviator = [-200, "G_Bandanna_aviator", 42, 15] call _getGlasses;
TTC_SHOP_article_G_Bandanna_beast = [-201, "G_Bandanna_beast", 42, 15] call _getGlasses;
TTC_SHOP_article_G_Bandanna_tan = [-202, "G_Bandanna_tan", 42, 15] call _getGlasses;
TTC_SHOP_article_G_Bandanna_sport = [-203, "G_Bandanna_sport", 42, 15] call _getGlasses;
TTC_SHOP_article_G_Bandanna_blk = [-204, "G_Bandanna_blk", 42, 15] call _getGlasses;
TTC_SHOP_article_G_Bandanna_oli = [-205, "G_Bandanna_oli", 42, 15] call _getGlasses;
TTC_SHOP_article_G_Bandanna_shades = [-206, "G_Bandanna_shades", 42, 15] call _getGlasses;
TTC_SHOP_article_G_Balaclava_blk = [-207, "G_Balaclava_blk", 42, 25] call _getGlasses;
TTC_SHOP_article_G_Balaclava_lowprofile = [-208, "G_Balaclava_lowprofile", 42, 25] call _getGlasses;
TTC_SHOP_article_G_Balaclava_combat = [-209, "G_Balaclava_combat", 42, 25] call _getGlasses;
TTC_SHOP_article_G_Balaclava_oli = [-210, "G_Balaclava_oli", 42, 25] call _getGlasses;
TTC_SHOP_article_U_B_GhillieSuit = [-222, "U_B_GhillieSuit", 42, 800] call _getUniform;
TTC_SHOP_article_U_I_GhillieSuit = [-223, "U_I_GhillieSuit", 42, 800] call _getUniform;
TTC_SHOP_article_V_Rangemaster_belt = [-224, "V_Rangemaster_belt", 42, 100] call _getVest;
TTC_SHOP_article_V_BandollierB_khk = [-228, "V_BandollierB_khk", 42, 200] call _getVest;
TTC_SHOP_article_V_BandollierB_cbr = [-229, "V_BandollierB_cbr", 42, 200] call _getVest;
TTC_SHOP_article_V_BandollierB_blk = [-230, "V_BandollierB_blk", 42, 200] call _getVest;
TTC_SHOP_article_V_BandollierB_oli = [-231, "V_BandollierB_oli", 42, 200] call _getVest;
TTC_SHOP_article_V_Chestrig_rgr = [-225, "V_Chestrig_rgr", 42, 200] call _getVest;
TTC_SHOP_article_V_Chestrig_blk = [-226, "V_Chestrig_blk", 42, 200] call _getVest;
TTC_SHOP_article_V_Chestrig_oli = [-227, "V_Chestrig_oli", 42, 200] call _getVest;
TTC_SHOP_article_B_Parachute = [-252, "B_Parachute", 42, 100] call _getBackpack;
TTC_SHOP_article_B_UAV_01_backpack_F = [-253, "B_UAV_01_backpack_F", 42, 900] call _getBackpack;
TTC_SHOP_article_I_UAV_01_backpack_F = [-254, "I_UAV_01_backpack_F", 42, 900] call _getBackpack;
TTC_SHOP_article_B_FieldPack_khk = [-232, "B_FieldPack_khk", 42, 200] call _getBackpack;
TTC_SHOP_article_B_FieldPack_ocamo = [-233, "B_FieldPack_ocamo", 42, 200] call _getBackpack;
TTC_SHOP_article_B_FieldPack_oucamo = [-234, "B_FieldPack_oucamo", 42, 200] call _getBackpack;
TTC_SHOP_article_B_FieldPack_cbr = [-235, "B_FieldPack_cbr", 42, 200] call _getBackpack;
TTC_SHOP_article_B_FieldPack_blk = [-236, "B_FieldPack_blk", 42, 200] call _getBackpack;
TTC_SHOP_article_B_AssaultPack_khk = [-237, "B_AssaultPack_khk", 42, 250] call _getBackpack;
TTC_SHOP_article_B_AssaultPack_dgtl = [-238, "B_AssaultPack_dgtl", 42, 250] call _getBackpack;
TTC_SHOP_article_B_AssaultPack_rgr = [-239, "B_AssaultPack_rgr", 42, 250] call _getBackpack;
TTC_SHOP_article_B_AssaultPack_blk = [-240, "B_AssaultPack_blk", 42, 250] call _getBackpack;
TTC_SHOP_article_B_AssaultPack_cbr = [-241, "B_AssaultPack_cbr", 42, 250] call _getBackpack;
TTC_SHOP_article_B_AssaultPack_mcamo = [-242, "B_AssaultPack_mcamo", 42, 250] call _getBackpack;
TTC_SHOP_article_B_AssaultPack_ocamo = [-243, "B_AssaultPack_ocamo", 42, 250] call _getBackpack;
TTC_SHOP_article_B_Kitbag_rgr = [-244, "B_Kitbag_rgr", 42, 375] call _getBackpack;
TTC_SHOP_article_B_Kitbag_mcamo = [-245, "B_Kitbag_mcamo", 42, 375] call _getBackpack;
TTC_SHOP_article_B_Kitbag_cbr = [-246, "B_Kitbag_cbr", 42, 375] call _getBackpack;
TTC_SHOP_article_B_Carryall_ocamo = [-247, "B_Carryall_ocamo", 42, 450] call _getBackpack;
TTC_SHOP_article_B_Carryall_oucamo = [-248, "B_Carryall_oucamo", 42, 450] call _getBackpack;
TTC_SHOP_article_B_Carryall_mcamo = [-249, "B_Carryall_mcamo", 42, 450] call _getBackpack;
TTC_SHOP_article_B_Carryall_khk = [-250, "B_Carryall_khk", 42, 450] call _getBackpack;
TTC_SHOP_article_B_Carryall_cbr = [-251, "B_Carryall_cbr", 42, 450] call _getBackpack;
TTC_SHOP_article_B_Quadbike_01_F = [-255, "B_Quadbike_01_F", 42, 100] call _getVehicle;
TTC_SHOP_article_B_G_Offroad_01_F = [-256, "B_G_Offroad_01_F", 42, 250] call _getVehicle;
TTC_SHOP_article_B_G_Offroad_01_armed_F = [-257, "B_G_Offroad_01_armed_F", 42, 400] call _getVehicle;
TTC_SHOP_article_B_Truck_01_transport_F = [-261, "B_Truck_01_transport_F", 42, 625] call _getVehicle;
TTC_SHOP_article_B_Truck_01_covered_F = [-262, "B_Truck_01_covered_F", 42, 625] call _getVehicle;
TTC_SHOP_article_I_Quadbike_01_F = [-269, "I_Quadbike_01_F", 42, 100] call _getVehicle;
TTC_SHOP_article_I_G_Offroad_01_F = [-270, "I_G_Offroad_01_F", 42, 250] call _getVehicle;
TTC_SHOP_article_I_G_Offroad_01_armed_F = [-271, "I_G_Offroad_01_armed_F", 42, 400] call _getVehicle;
TTC_SHOP_article_I_Truck_02_transport_F = [-275, "I_Truck_02_transport_F", 42, 625] call _getVehicle;
TTC_SHOP_article_I_Truck_02_covered_F = [-276, "I_Truck_02_covered_F", 42, 625] call _getVehicle;
TTC_SHOP_article_B_MRAP_01_F = [-258, "B_MRAP_01_F", 42, 500] call _getVehicle;
TTC_SHOP_article_B_MRAP_01_hmg_F = [-259, "B_MRAP_01_hmg_F", 42, 750] call _getVehicle;
TTC_SHOP_article_B_MRAP_01_gmg_F = [-260, "B_MRAP_01_gmg_F", 42, 1000] call _getVehicle;
TTC_SHOP_article_I_MRAP_03_F = [-272, "I_MRAP_03_F", 42, 500] call _getVehicle;
TTC_SHOP_article_I_MRAP_03_hmg_F = [-273, "I_MRAP_03_hmg_F", 42, 750] call _getVehicle;
TTC_SHOP_article_I_MRAP_03_gmg_F = [-274, "I_MRAP_03_gmg_F", 42, 1000] call _getVehicle;
TTC_SHOP_article_B_APC_Tracked_01_rcws_F = [-263, "B_APC_Tracked_01_rcws_F", 42, 2250] call _getVehicle;
TTC_SHOP_article_B_APC_Tracked_01_CRV_F = [-264, "B_APC_Tracked_01_CRV_F", 42, 2250] call _getVehicle;
TTC_SHOP_article_B_APC_Wheeled_01_cannon_F = [-266, "B_APC_Wheeled_01_cannon_F", 42, 3750] call _getVehicle;
TTC_SHOP_article_I_APC_tracked_03_cannon_F = [-277, "I_APC_tracked_03_cannon_F", 42, 2250] call _getVehicle;
TTC_SHOP_article_I_APC_Wheeled_03_cannon_F = [-278, "I_APC_Wheeled_03_cannon_F", 42, 3750] call _getVehicle;
TTC_SHOP_article_B_APC_Tracked_01_AA_F = [-265, "B_APC_Tracked_01_AA_F", 42, 3000] call _getVehicle;
TTC_SHOP_article_O_APC_Tracked_02_AA_F = [-280, "O_APC_Tracked_02_AA_F", 42, 3000] call _getVehicle;
TTC_SHOP_article_B_MBT_01_cannon_F = [-267, "B_MBT_01_cannon_F", 42, 5250] call _getVehicle;
TTC_SHOP_article_B_MBT_01_TUSK_F = [-268, "B_MBT_01_TUSK_F", 42, 5250] call _getVehicle;
TTC_SHOP_article_I_MBT_03_cannon_F = [-279, "I_MBT_03_cannon_F", 42, 5250] call _getVehicle;
TTC_SHOP_article_B_Heli_Light_01_F = [-281, "B_Heli_Light_01_F", 42, 750] call _getVehicle;
TTC_SHOP_article_I_Heli_light_03_unarmed_F = [-289, "I_Heli_light_03_unarmed_F", 42, 750] call _getVehicle;
TTC_SHOP_article_I_Heli_Transport_02_F = [-291, "I_Heli_Transport_02_F", 42, 1350] call _getVehicle;
TTC_SHOP_article_B_Heli_Transport_03_unarmed_F = [-282, "B_Heli_Transport_03_unarmed_F", 42, 1350] call _getVehicle;
TTC_SHOP_article_B_Heli_Transport_03_unarmed_green_F = [-283, "B_Heli_Transport_03_unarmed_green_F", 42, 1350] call _getVehicle;
TTC_SHOP_article_B_Heli_Transport_03_F = [-284, "B_Heli_Transport_03_F", 42, 1875] call _getVehicle;
TTC_SHOP_article_B_Heli_Transport_03_black_F = [-285, "B_Heli_Transport_03_black_F", 42, 1875] call _getVehicle;
TTC_SHOP_article_B_Heli_Transport_01_F = [-286, "B_Heli_Transport_01_F", 42, 1875] call _getVehicle;
TTC_SHOP_article_B_Heli_Transport_01_camo_F = [-287, "B_Heli_Transport_01_camo_F", 42, 1875] call _getVehicle;
TTC_SHOP_article_O_Heli_Transport_04_F = [-294, "O_Heli_Transport_04_F", 42, 1350] call _getVehicle;
TTC_SHOP_article_O_Heli_Transport_04_ammo_F = [-295, "O_Heli_Transport_04_ammo_F", 42, 1350] call _getVehicle;
TTC_SHOP_article_O_Heli_Transport_04_bench_F = [-296, "O_Heli_Transport_04_bench_F", 42, 1350] call _getVehicle;
TTC_SHOP_article_O_Heli_Transport_04_box_F = [-297, "O_Heli_Transport_04_box_F", 42, 1350] call _getVehicle;
TTC_SHOP_article_O_Heli_Transport_04_covered_F = [-298, "O_Heli_Transport_04_covered_F", 42, 1350] call _getVehicle;
TTC_SHOP_article_O_Heli_Transport_04_fuel_F = [-299, "O_Heli_Transport_04_fuel_F", 42, 1350] call _getVehicle;
TTC_SHOP_article_O_Heli_Transport_04_medevac_F = [-300, "O_Heli_Transport_04_medevac_F", 42, 1350] call _getVehicle;
TTC_SHOP_article_O_Heli_Transport_04_repair_F = [-301, "O_Heli_Transport_04_repair_F", 42, 1350] call _getVehicle;
TTC_SHOP_article_O_Heli_Transport_04_black_F = [-302, "O_Heli_Transport_04_black_F", 42, 1350] call _getVehicle;
TTC_SHOP_article_O_Heli_Transport_04_ammo_black_F = [-303, "O_Heli_Transport_04_ammo_black_F", 42, 1350] call _getVehicle;
TTC_SHOP_article_O_Heli_Transport_04_bench_black_F = [-304, "O_Heli_Transport_04_bench_black_F", 42, 1350] call _getVehicle;
TTC_SHOP_article_O_Heli_Transport_04_box_black_F = [-305, "O_Heli_Transport_04_box_black_F", 42, 1350] call _getVehicle;
TTC_SHOP_article_O_Heli_Transport_04_covered_black_F = [-306, "O_Heli_Transport_04_covered_black_F", 42, 1350] call _getVehicle;
TTC_SHOP_article_O_Heli_Transport_04_fuel_black_F = [-307, "O_Heli_Transport_04_fuel_black_F", 42, 1350] call _getVehicle;
TTC_SHOP_article_O_Heli_Transport_04_medevac_black_F = [-308, "O_Heli_Transport_04_medevac_black_F", 42, 1350] call _getVehicle;
TTC_SHOP_article_O_Heli_Transport_04_repair_black_F = [-309, "O_Heli_Transport_04_repair_black_F", 42, 1350] call _getVehicle;
TTC_SHOP_article_B_Heli_Light_01_armed_F = [-288, "B_Heli_Light_01_armed_F", 42, 3750] call _getVehicle;
TTC_SHOP_article_I_Heli_light_03_F = [-290, "I_Heli_light_03_F", 42, 3750] call _getVehicle;
TTC_SHOP_article_O_Heli_Light_02_unarmed_F = [-292, "O_Heli_Light_02_unarmed_F", 42, 2250] call _getVehicle;
TTC_SHOP_article_O_Heli_Light_02_F = [-293, "O_Heli_Light_02_F", 42, 3750] call _getVehicle;
TTC_SHOP_article_B_UGV_01_F = [-310, "B_UGV_01_F", 42, 600] call _getUGV;
TTC_SHOP_article_B_UGV_01_rcws_F = [-311, "B_UGV_01_rcws_F", 42, 1125] call _getUGV;
TTC_SHOP_article_I_UGV_01_F = [-312, "I_UGV_01_F", 42, 600] call _getUGV;
TTC_SHOP_article_I_UGV_01_rcws_F = [-313, "I_UGV_01_rcws_F", 42, 1125] call _getUGV;
TTC_SHOP_article_B_UAV_02_F = [-314, "B_UAV_02_F", 42, 6750] call _getUAV;
TTC_SHOP_article_B_UAV_02_CAS_F = [-315, "B_UAV_02_CAS_F", 42, 6750] call _getUAV;
TTC_SHOP_article_I_UAV_02_F = [-316, "I_UAV_02_F", 42, 6750] call _getUAV;
TTC_SHOP_article_I_UAV_02_CAS_F = [-317, "I_UAV_02_CAS_F", 42, 6750] call _getUAV;


/*
  Article array containing all articles.
  The articles are ordered by id
*/
TTC_SHOP_articles = [
  TTC_SHOP_article_SMG_01_F,
  TTC_SHOP_article_hgun_PDW2000_F,
  TTC_SHOP_article_SMG_02_F,
  TTC_SHOP_article_arifle_MXC_F,
  TTC_SHOP_article_arifle_TRG20_F,
  TTC_SHOP_article_arifle_Mk20C_F,
  TTC_SHOP_article_arifle_Katiba_C_F,
  TTC_SHOP_article_arifle_MX_F,
  TTC_SHOP_article_arifle_TRG21_F,
  TTC_SHOP_article_arifle_Mk20_F,
  TTC_SHOP_article_arifle_Katiba_F,
  TTC_SHOP_article_arifle_MX_GL_F,
  TTC_SHOP_article_arifle_TRG21_GL_F,
  TTC_SHOP_article_arifle_Katiba_GL_F,
  TTC_SHOP_article_arifle_MX_SW_F,
  TTC_SHOP_article_LMG_Mk200_F,
  TTC_SHOP_article_LMG_Zafir_F,
  TTC_SHOP_article_MMG_01_hex_F,
  TTC_SHOP_article_MMG_01_tan_F,
  TTC_SHOP_article_MMG_02_camo_F,
  TTC_SHOP_article_MMG_02_black_F,
  TTC_SHOP_article_MMG_02_sand_F,
  TTC_SHOP_article_arifle_MXM_F,
  TTC_SHOP_article_srifle_EBR_F,
  TTC_SHOP_article_srifle_DMR_01_F,
  TTC_SHOP_article_srifle_DMR_03_F,
  TTC_SHOP_article_srifle_DMR_03_khaki_F,
  TTC_SHOP_article_srifle_DMR_03_tan_F,
  TTC_SHOP_article_srifle_DMR_03_multicam_F,
  TTC_SHOP_article_srifle_DMR_03_woodland_F,
  TTC_SHOP_article_srifle_DMR_05_blk_F,
  TTC_SHOP_article_srifle_DMR_05_hex_F,
  TTC_SHOP_article_srifle_DMR_05_tan_f,
  TTC_SHOP_article_srifle_DMR_06_camo_F,
  TTC_SHOP_article_srifle_DMR_06_olive_F,
  TTC_SHOP_article_srifle_GM6_F,
  TTC_SHOP_article_srifle_LRR_F,
  TTC_SHOP_article_srifle_DMR_02_F,
  TTC_SHOP_article_srifle_DMR_02_camo_F,
  TTC_SHOP_article_srifle_DMR_04_F,
  TTC_SHOP_article_srifle_DMR_04_Tan_F,
  TTC_SHOP_article_hgun_P07_F,
  TTC_SHOP_article_hgun_ACPC2_F,
  TTC_SHOP_article_hgun_Rook40_F,
  TTC_SHOP_article_hgun_Pistol_heavy_01_F,
  TTC_SHOP_article_hgun_Pistol_heavy_02_F,
  TTC_SHOP_article_launch_RPG32_F,
  TTC_SHOP_article_launch_NLAW_F,
  TTC_SHOP_article_launch_B_Titan_short_F,
  TTC_SHOP_article_launch_I_Titan_short_F,
  TTC_SHOP_article_launch_B_Titan_F,
  TTC_SHOP_article_launch_I_Titan_F,
  TTC_SHOP_article_optic_MRD,
  TTC_SHOP_article_optic_Yorris,
  TTC_SHOP_article_optic_Aco_smg,
  TTC_SHOP_article_optic_ACO_grn_smg,
  TTC_SHOP_article_optic_Holosight_smg,
  TTC_SHOP_article_optic_Aco,
  TTC_SHOP_article_optic_ACO_grn,
  TTC_SHOP_article_optic_Holosight,
  TTC_SHOP_article_optic_MRCO,
  TTC_SHOP_article_optic_Hamr,
  TTC_SHOP_article_optic_Arco,
  TTC_SHOP_article_optic_NVS,
  TTC_SHOP_article_optic_AMS,
  TTC_SHOP_article_optic_AMS_khk,
  TTC_SHOP_article_optic_AMS_snd,
  TTC_SHOP_article_optic_KHS_blk,
  TTC_SHOP_article_optic_KHS_hex,
  TTC_SHOP_article_optic_KHS_old,
  TTC_SHOP_article_optic_KHS_tan,
  TTC_SHOP_article_optic_DMS,
  TTC_SHOP_article_optic_LRPS,
  TTC_SHOP_article_optic_SOS,
  TTC_SHOP_article_muzzle_snds_L,
  TTC_SHOP_article_muzzle_snds_acp,
  TTC_SHOP_article_muzzle_snds_M,
  TTC_SHOP_article_muzzle_snds_H,
  TTC_SHOP_article_muzzle_snds_H_SW,
  TTC_SHOP_article_muzzle_snds_H_MG,
  TTC_SHOP_article_muzzle_snds_B,
  TTC_SHOP_article_muzzle_snds_338_black,
  TTC_SHOP_article_muzzle_snds_338_green,
  TTC_SHOP_article_muzzle_snds_93mmg,
  TTC_SHOP_article_muzzle_snds_93mmg_tan,
  TTC_SHOP_article_acc_flashlight,
  TTC_SHOP_article_acc_pointer_IR,
  TTC_SHOP_article_16Rnd_9x21_Mag,
  TTC_SHOP_article_30Rnd_9x21_Mag,
  TTC_SHOP_article_6Rnd_45ACP_Cylinder,
  TTC_SHOP_article_9Rnd_45ACP_Mag,
  TTC_SHOP_article_11Rnd_45ACP_Mag,
  TTC_SHOP_article_30Rnd_45ACP_Mag_SMG_01,
  TTC_SHOP_article_30Rnd_45ACP_Mag_SMG_01_Tracer_Green,
  TTC_SHOP_article_30Rnd_556x45_Stanag,
  TTC_SHOP_article_30Rnd_556x45_Stanag_Tracer_Yellow,
  TTC_SHOP_article_30Rnd_65x39_caseless_mag,
  TTC_SHOP_article_30Rnd_65x39_caseless_mag_Tracer,
  TTC_SHOP_article_100Rnd_65x39_caseless_mag,
  TTC_SHOP_article_100Rnd_65x39_caseless_mag_Tracer,
  TTC_SHOP_article_200Rnd_65x39_cased_Box,
  TTC_SHOP_article_200Rnd_65x39_cased_Box_Tracer,
  TTC_SHOP_article_20Rnd_762x51_Mag,
  TTC_SHOP_article_150Rnd_762x54_Box,
  TTC_SHOP_article_150Rnd_762x54_Box_Tracer,
  TTC_SHOP_article_10Rnd_338_Mag,
  TTC_SHOP_article_130Rnd_338_Mag,
  TTC_SHOP_article_10Rnd_93x64_DMR_05_Mag,
  TTC_SHOP_article_150Rnd_93x64_Mag,
  TTC_SHOP_article_7Rnd_408_Mag,
  TTC_SHOP_article_5Rnd_127x108_Mag,
  TTC_SHOP_article_10Rnd_127x54_Mag,
  TTC_SHOP_article_RPG32_F,
  TTC_SHOP_article_RPG32_HE_F,
  TTC_SHOP_article_NLAW_F,
  TTC_SHOP_article_Titan_AA,
  TTC_SHOP_article_Titan_AP,
  TTC_SHOP_article_Titan_AT,
  TTC_SHOP_article_DemoCharge_Remote_Mag,
  TTC_SHOP_article_SatchelCharge_Remote_Mag,
  TTC_SHOP_article_APERSMine_Range_Mag,
  TTC_SHOP_article_APERSBoundingMine_Range_Mag,
  TTC_SHOP_article_APERSTripMine_Wire_Mag,
  TTC_SHOP_article_SLAMDirectionalMine_Wire_Mag,
  TTC_SHOP_article_ATMine_Range_Mag,
  TTC_SHOP_article_ItemCompass,
  TTC_SHOP_article_ItemMap,
  TTC_SHOP_article_ItemRadio,
  TTC_SHOP_article_ItemWatch,
  TTC_SHOP_article_Binocular,
  TTC_SHOP_article_Rangefinder,
  TTC_SHOP_article_B_UavTerminal,
  TTC_SHOP_article_I_UavTerminal,
  TTC_SHOP_article_FirstAidKit,
  TTC_SHOP_article_Medikit,
  TTC_SHOP_article_ToolKit,
  TTC_SHOP_article_MineDetector,
  TTC_SHOP_article_NVGoggles,
  TTC_SHOP_article_NVGoggles_OPFOR,
  TTC_SHOP_article_NVGoggles_INDEP,
  TTC_SHOP_article_H_Shemag_khk,
  TTC_SHOP_article_H_Shemag_tan,
  TTC_SHOP_article_H_Shemag_olive,
  TTC_SHOP_article_H_Shemag_olive_hs,
  TTC_SHOP_article_H_ShemagOpen_khk,
  TTC_SHOP_article_H_ShemagOpen_tan,
  TTC_SHOP_article_H_Beret_blk,
  TTC_SHOP_article_H_Beret_red,
  TTC_SHOP_article_H_Beret_grn,
  TTC_SHOP_article_H_Beret_02,
  TTC_SHOP_article_H_Beret_Colonel,
  TTC_SHOP_article_G_Spectacles,
  TTC_SHOP_article_G_Spectacles_Tinted,
  TTC_SHOP_article_G_Squares,
  TTC_SHOP_article_G_Squares_Tinted,
  TTC_SHOP_article_G_Lowprofile,
  TTC_SHOP_article_G_Diving,
  TTC_SHOP_article_G_Tactical_Clear,
  TTC_SHOP_article_G_Tactical_Black,
  TTC_SHOP_article_G_Combat,
  TTC_SHOP_article_G_Aviator,
  TTC_SHOP_article_G_Shades_Black,
  TTC_SHOP_article_G_Shades_Blue,
  TTC_SHOP_article_G_Shades_Green,
  TTC_SHOP_article_G_Shades_Red,
  TTC_SHOP_article_G_Sport_Blackred,
  TTC_SHOP_article_G_Sport_BlackWhite,
  TTC_SHOP_article_G_Sport_Blackyellow,
  TTC_SHOP_article_G_Sport_Checkered,
  TTC_SHOP_article_G_Sport_Greenblack,
  TTC_SHOP_article_G_Sport_Red,
  TTC_SHOP_article_G_Lady_Mirror,
  TTC_SHOP_article_G_Lady_Dark,
  TTC_SHOP_article_G_Lady_Red,
  TTC_SHOP_article_G_Lady_Blue,
  TTC_SHOP_article_G_Bandanna_aviator,
  TTC_SHOP_article_G_Bandanna_beast,
  TTC_SHOP_article_G_Bandanna_tan,
  TTC_SHOP_article_G_Bandanna_sport,
  TTC_SHOP_article_G_Bandanna_blk,
  TTC_SHOP_article_G_Bandanna_oli,
  TTC_SHOP_article_G_Bandanna_shades,
  TTC_SHOP_article_G_Balaclava_blk,
  TTC_SHOP_article_G_Balaclava_lowprofile,
  TTC_SHOP_article_G_Balaclava_combat,
  TTC_SHOP_article_G_Balaclava_oli,
  TTC_SHOP_article_U_B_GhillieSuit,
  TTC_SHOP_article_U_I_GhillieSuit,
  TTC_SHOP_article_V_Rangemaster_belt,
  TTC_SHOP_article_V_BandollierB_khk,
  TTC_SHOP_article_V_BandollierB_cbr,
  TTC_SHOP_article_V_BandollierB_blk,
  TTC_SHOP_article_V_BandollierB_oli,
  TTC_SHOP_article_V_Chestrig_rgr,
  TTC_SHOP_article_V_Chestrig_blk,
  TTC_SHOP_article_V_Chestrig_oli,
  TTC_SHOP_article_B_Parachute,
  TTC_SHOP_article_B_UAV_01_backpack_F,
  TTC_SHOP_article_I_UAV_01_backpack_F,
  TTC_SHOP_article_B_FieldPack_khk,
  TTC_SHOP_article_B_FieldPack_ocamo,
  TTC_SHOP_article_B_FieldPack_oucamo,
  TTC_SHOP_article_B_FieldPack_cbr,
  TTC_SHOP_article_B_FieldPack_blk,
  TTC_SHOP_article_B_AssaultPack_khk,
  TTC_SHOP_article_B_AssaultPack_dgtl,
  TTC_SHOP_article_B_AssaultPack_rgr,
  TTC_SHOP_article_B_AssaultPack_blk,
  TTC_SHOP_article_B_AssaultPack_cbr,
  TTC_SHOP_article_B_AssaultPack_mcamo,
  TTC_SHOP_article_B_AssaultPack_ocamo,
  TTC_SHOP_article_B_Kitbag_rgr,
  TTC_SHOP_article_B_Kitbag_mcamo,
  TTC_SHOP_article_B_Kitbag_cbr,
  TTC_SHOP_article_B_Carryall_ocamo,
  TTC_SHOP_article_B_Carryall_oucamo,
  TTC_SHOP_article_B_Carryall_mcamo,
  TTC_SHOP_article_B_Carryall_khk,
  TTC_SHOP_article_B_Carryall_cbr,
  TTC_SHOP_article_B_Quadbike_01_F,
  TTC_SHOP_article_B_G_Offroad_01_F,
  TTC_SHOP_article_B_G_Offroad_01_armed_F,
  TTC_SHOP_article_B_Truck_01_transport_F,
  TTC_SHOP_article_B_Truck_01_covered_F,
  TTC_SHOP_article_I_Quadbike_01_F,
  TTC_SHOP_article_I_G_Offroad_01_F,
  TTC_SHOP_article_I_G_Offroad_01_armed_F,
  TTC_SHOP_article_I_Truck_02_transport_F,
  TTC_SHOP_article_I_Truck_02_covered_F,
  TTC_SHOP_article_B_MRAP_01_F,
  TTC_SHOP_article_B_MRAP_01_hmg_F,
  TTC_SHOP_article_B_MRAP_01_gmg_F,
  TTC_SHOP_article_I_MRAP_03_F,
  TTC_SHOP_article_I_MRAP_03_hmg_F,
  TTC_SHOP_article_I_MRAP_03_gmg_F,
  TTC_SHOP_article_B_APC_Tracked_01_rcws_F,
  TTC_SHOP_article_B_APC_Tracked_01_CRV_F,
  TTC_SHOP_article_B_APC_Wheeled_01_cannon_F,
  TTC_SHOP_article_I_APC_tracked_03_cannon_F,
  TTC_SHOP_article_I_APC_Wheeled_03_cannon_F,
  TTC_SHOP_article_B_APC_Tracked_01_AA_F,
  TTC_SHOP_article_O_APC_Tracked_02_AA_F,
  TTC_SHOP_article_B_MBT_01_cannon_F,
  TTC_SHOP_article_B_MBT_01_TUSK_F,
  TTC_SHOP_article_I_MBT_03_cannon_F,
  TTC_SHOP_article_B_Heli_Light_01_F,
  TTC_SHOP_article_I_Heli_light_03_unarmed_F,
  TTC_SHOP_article_I_Heli_Transport_02_F,
  TTC_SHOP_article_B_Heli_Transport_03_unarmed_F,
  TTC_SHOP_article_B_Heli_Transport_03_unarmed_green_F,
  TTC_SHOP_article_B_Heli_Transport_03_F,
  TTC_SHOP_article_B_Heli_Transport_03_black_F,
  TTC_SHOP_article_B_Heli_Transport_01_F,
  TTC_SHOP_article_B_Heli_Transport_01_camo_F,
  TTC_SHOP_article_O_Heli_Transport_04_F,
  TTC_SHOP_article_O_Heli_Transport_04_ammo_F,
  TTC_SHOP_article_O_Heli_Transport_04_bench_F,
  TTC_SHOP_article_O_Heli_Transport_04_box_F,
  TTC_SHOP_article_O_Heli_Transport_04_covered_F,
  TTC_SHOP_article_O_Heli_Transport_04_fuel_F,
  TTC_SHOP_article_O_Heli_Transport_04_medevac_F,
  TTC_SHOP_article_O_Heli_Transport_04_repair_F,
  TTC_SHOP_article_O_Heli_Transport_04_black_F,
  TTC_SHOP_article_O_Heli_Transport_04_ammo_black_F,
  TTC_SHOP_article_O_Heli_Transport_04_bench_black_F,
  TTC_SHOP_article_O_Heli_Transport_04_box_black_F,
  TTC_SHOP_article_O_Heli_Transport_04_covered_black_F,
  TTC_SHOP_article_O_Heli_Transport_04_fuel_black_F,
  TTC_SHOP_article_O_Heli_Transport_04_medevac_black_F,
  TTC_SHOP_article_O_Heli_Transport_04_repair_black_F,
  TTC_SHOP_article_B_Heli_Light_01_armed_F,
  TTC_SHOP_article_I_Heli_light_03_F,
  TTC_SHOP_article_O_Heli_Light_02_unarmed_F,
  TTC_SHOP_article_O_Heli_Light_02_F,
  TTC_SHOP_article_B_UGV_01_F,
  TTC_SHOP_article_B_UGV_01_rcws_F,
  TTC_SHOP_article_I_UGV_01_F,
  TTC_SHOP_article_I_UGV_01_rcws_F,
  TTC_SHOP_article_B_UAV_02_F,
  TTC_SHOP_article_B_UAV_02_CAS_F,
  TTC_SHOP_article_I_UAV_02_F,
  TTC_SHOP_article_I_UAV_02_CAS_F
];
