/////////////////////////////////////////////
//// Auto generated code. DO NOT MODIFY! ////
/////////////////////////////////////////////


TTC_SHOP_ARTICLE_id					= 0;
TTC_SHOP_ARTICLE_name				= 1;
TTC_SHOP_ARTICLE_price				= 2;
TTC_SHOP_ARTICLE_availableAtSectors	= 3;
TTC_SHOP_ARTICLE_displayName		= 4;
TTC_SHOP_ARTICLE_description		= 5;
TTC_SHOP_ARTICLE_picture			= 6;

TTC_SHOP_CATEGORY_id				= 0;
TTC_SHOP_CATEGORY_name				= 1;
TTC_SHOP_CATEGORY_icon				= 2;
TTC_SHOP_CATEGORY_articles			= 3;


_getArticle = {

	private["_id","_name","_price","_config","_availableAtSectors","_descriptionShort","_descriptionLong","_descriptionUse","_displayName","_picture","_description","_data"];

	_id					= [_this, 0] call BIS_fnc_param;
	_name				= [_this, 1] call BIS_fnc_param;
	_price				= [_this, 3] call BIS_fnc_param;
	_config				= [_this, 4] call BIS_fnc_param;
	_availableAtSectors	= [_this, 5] call BIS_fnc_param;
	_descriptionShort	= [_this, 6, (getText(configFile >> _config >> _name >> "descriptionShort")), [""]] call BIS_fnc_param;
	_descriptionLong	= [_this, 7, "", [""]] call BIS_fnc_param;
	_descriptionUse		= [_this, 8, (getText(configFile >> _config >> _name >> "descriptionUse")), [""]] call BIS_fnc_param;
	_displayName		= [_this, 9, (getText(configFile >> _config >> _name >> "displayName")), [""]] call BIS_fnc_param;
	_picture			= [_this, 10, (getText(configFile >> _config >> _name >> "picture")), [""]] call BIS_fnc_param;

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
	_data set [TTC_SHOP_ARTICLE_price, _price];
	_data set [TTC_SHOP_ARTICLE_availableAtSectors, _availableAtSectors];
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
  Article constants.
  Name:  TTC_SHOP_ARTICLE_<Class>
  Data:  [id, class, price, availableAtSectors]
*/
TTC_SHOP_ARTICLE_hgun_P07_F = [-1, "hgun_P07_F", 80, false] call _getWeapon;
TTC_SHOP_ARTICLE_hgun_Rook40_F = [-3, "hgun_Rook40_F", 80, false] call _getWeapon;
TTC_SHOP_ARTICLE_hgun_Pistol_heavy_01_F = [-4, "hgun_Pistol_heavy_01_F", 150, false] call _getWeapon;
TTC_SHOP_ARTICLE_SMG_01_F = [-6, "SMG_01_F", 250, false] call _getWeapon;
TTC_SHOP_ARTICLE_SMG_02_F = [-8, "SMG_02_F", 250, false] call _getWeapon;
TTC_SHOP_ARTICLE_arifle_MXC_F = [-9, "arifle_MXC_F", 450, false] call _getWeapon;
TTC_SHOP_ARTICLE_arifle_Katiba_C_F = [-12, "arifle_Katiba_C_F", 450, false] call _getWeapon;
TTC_SHOP_ARTICLE_arifle_MX_F = [-13, "arifle_MX_F", 600, false] call _getWeapon;
TTC_SHOP_ARTICLE_arifle_Katiba_F = [-16, "arifle_Katiba_F", 600, false] call _getWeapon;
TTC_SHOP_ARTICLE_arifle_MXM_F = [-28, "arifle_MXM_F", 850, false] call _getWeapon;
TTC_SHOP_ARTICLE_srifle_EBR_F = [-29, "srifle_EBR_F", 1300, false] call _getWeapon;
TTC_SHOP_ARTICLE_srifle_DMR_03_F = [-31, "srifle_DMR_03_F", 1300, false] call _getWeapon;
TTC_SHOP_ARTICLE_srifle_DMR_03_khaki_F = [-32, "srifle_DMR_03_khaki_F", 1300, false] call _getWeapon;
TTC_SHOP_ARTICLE_srifle_DMR_03_tan_F = [-33, "srifle_DMR_03_tan_F", 1300, false] call _getWeapon;
TTC_SHOP_ARTICLE_srifle_DMR_03_multicam_F = [-34, "srifle_DMR_03_multicam_F", 1300, false] call _getWeapon;
TTC_SHOP_ARTICLE_srifle_DMR_03_woodland_F = [-35, "srifle_DMR_03_woodland_F", 1300, false] call _getWeapon;
TTC_SHOP_ARTICLE_srifle_DMR_05_blk_F = [-36, "srifle_DMR_05_blk_F", 1300, false] call _getWeapon;
TTC_SHOP_ARTICLE_srifle_DMR_05_hex_F = [-37, "srifle_DMR_05_hex_F", 1300, false] call _getWeapon;
TTC_SHOP_ARTICLE_srifle_DMR_05_tan_f = [-38, "srifle_DMR_05_tan_f", 1300, false] call _getWeapon;
TTC_SHOP_ARTICLE_launch_RPG32_F = [-47, "launch_RPG32_F", 500, false] call _getWeapon;
TTC_SHOP_ARTICLE_launch_NLAW_F = [-48, "launch_NLAW_F", 800, false] call _getWeapon;
TTC_SHOP_ARTICLE_launch_B_Titan_short_F = [-49, "launch_B_Titan_short_F", 1500, false] call _getWeapon;
TTC_SHOP_ARTICLE_launch_B_Titan_F = [-51, "launch_B_Titan_F", 1500, false] call _getWeapon;
TTC_SHOP_ARTICLE_16Rnd_9x21_Mag = [-53, "16Rnd_9x21_Mag", 20, true] call _getMagazine;
TTC_SHOP_ARTICLE_30Rnd_9x21_Mag = [-54, "30Rnd_9x21_Mag", 40, true] call _getMagazine;
TTC_SHOP_ARTICLE_11Rnd_45ACP_Mag = [-57, "11Rnd_45ACP_Mag", 25, true] call _getMagazine;
TTC_SHOP_ARTICLE_30Rnd_45ACP_Mag_SMG_01 = [-58, "30Rnd_45ACP_Mag_SMG_01", 50, true] call _getMagazine;
TTC_SHOP_ARTICLE_30Rnd_45ACP_Mag_SMG_01_Tracer_Green = [-59, "30Rnd_45ACP_Mag_SMG_01_Tracer_Green", 25, true] call _getMagazine;
TTC_SHOP_ARTICLE_30Rnd_65x39_caseless_mag = [-62, "30Rnd_65x39_caseless_mag", 60, true] call _getMagazine;
TTC_SHOP_ARTICLE_30Rnd_65x39_caseless_mag_Tracer = [-63, "30Rnd_65x39_caseless_mag_Tracer", 30, true] call _getMagazine;
TTC_SHOP_ARTICLE_20Rnd_762x51_Mag = [-68, "20Rnd_762x51_Mag", 60, true] call _getMagazine;
TTC_SHOP_ARTICLE_10Rnd_93x64_DMR_05_Mag = [-73, "10Rnd_93x64_DMR_05_Mag", 70, true] call _getMagazine;
TTC_SHOP_ARTICLE_RPG32_F = [-78, "RPG32_F", 200, true] call _getMagazine;
TTC_SHOP_ARTICLE_RPG32_HE_F = [-79, "RPG32_HE_F", 200, true] call _getMagazine;
TTC_SHOP_ARTICLE_NLAW_F = [-80, "NLAW_F", 400, true] call _getMagazine;
TTC_SHOP_ARTICLE_Titan_AA = [-81, "Titan_AA", 750, true] call _getMagazine;
TTC_SHOP_ARTICLE_Titan_AP = [-82, "Titan_AP", 750, true] call _getMagazine;
TTC_SHOP_ARTICLE_Titan_AT = [-83, "Titan_AT", 750, true] call _getMagazine;
TTC_SHOP_ARTICLE_acc_flashlight = [-119, "acc_flashlight", 25, false] call _getItem;
TTC_SHOP_ARTICLE_acc_pointer_IR = [-120, "acc_pointer_IR", 50, false] call _getItem;
TTC_SHOP_ARTICLE_optic_MRD = [-121, "optic_MRD", 50, false] call _getItem;
TTC_SHOP_ARTICLE_optic_Aco_smg = [-123, "optic_Aco_smg", 100, false] call _getItem;
TTC_SHOP_ARTICLE_optic_ACO_grn_smg = [-124, "optic_ACO_grn_smg", 100, false] call _getItem;
TTC_SHOP_ARTICLE_optic_Holosight_smg = [-125, "optic_Holosight_smg", 125, false] call _getItem;
TTC_SHOP_ARTICLE_optic_Aco = [-126, "optic_Aco", 100, false] call _getItem;
TTC_SHOP_ARTICLE_optic_ACO_grn = [-127, "optic_ACO_grn", 100, false] call _getItem;
TTC_SHOP_ARTICLE_optic_Holosight = [-128, "optic_Holosight", 125, false] call _getItem;
TTC_SHOP_ARTICLE_optic_MRCO = [-129, "optic_MRCO", 300, false] call _getItem;
TTC_SHOP_ARTICLE_optic_Hamr = [-130, "optic_Hamr", 400, false] call _getItem;
TTC_SHOP_ARTICLE_optic_Arco = [-131, "optic_Arco", 400, false] call _getItem;
TTC_SHOP_ARTICLE_optic_AMS = [-133, "optic_AMS", 500, false] call _getItem;
TTC_SHOP_ARTICLE_optic_AMS_khk = [-134, "optic_AMS_khk", 500, false] call _getItem;
TTC_SHOP_ARTICLE_optic_AMS_snd = [-135, "optic_AMS_snd", 500, false] call _getItem;
TTC_SHOP_ARTICLE_optic_KHS_blk = [-136, "optic_KHS_blk", 500, false] call _getItem;
TTC_SHOP_ARTICLE_optic_KHS_hex = [-137, "optic_KHS_hex", 500, false] call _getItem;
TTC_SHOP_ARTICLE_optic_KHS_old = [-138, "optic_KHS_old", 500, false] call _getItem;
TTC_SHOP_ARTICLE_optic_KHS_tan = [-139, "optic_KHS_tan", 500, false] call _getItem;
TTC_SHOP_ARTICLE_optic_DMS = [-140, "optic_DMS", 650, false] call _getItem;
TTC_SHOP_ARTICLE_muzzle_snds_L = [-143, "muzzle_snds_L", 120, false] call _getItem;
TTC_SHOP_ARTICLE_muzzle_snds_acp = [-144, "muzzle_snds_acp", 120, false] call _getItem;
TTC_SHOP_ARTICLE_muzzle_snds_H = [-146, "muzzle_snds_H", 180, false] call _getItem;
TTC_SHOP_ARTICLE_muzzle_snds_B = [-149, "muzzle_snds_B", 270, false] call _getItem;
TTC_SHOP_ARTICLE_muzzle_snds_93mmg = [-152, "muzzle_snds_93mmg", 400, false] call _getItem;
TTC_SHOP_ARTICLE_muzzle_snds_93mmg_tan = [-153, "muzzle_snds_93mmg_tan", 400, false] call _getItem;
TTC_SHOP_ARTICLE_Binocular = [-165, "Binocular", 100, true] call _getWeapon;
TTC_SHOP_ARTICLE_FirstAidKit = [-167, "FirstAidKit", 50, true] call _getWeapon;
TTC_SHOP_ARTICLE_NVGoggles = [-171, "NVGoggles", 300, true] call _getWeapon;
TTC_SHOP_ARTICLE_G_Shades_Black = [-176, "G_Shades_Black", 5, false] call _getGlasses;
TTC_SHOP_ARTICLE_G_Shades_Blue = [-177, "G_Shades_Blue", 5, false] call _getGlasses;
TTC_SHOP_ARTICLE_G_Shades_Green = [-178, "G_Shades_Green", 5, false] call _getGlasses;
TTC_SHOP_ARTICLE_G_Shades_Red = [-179, "G_Shades_Red", 5, false] call _getGlasses;
TTC_SHOP_ARTICLE_G_Sport_Blackred = [-180, "G_Sport_Blackred", 5, false] call _getGlasses;
TTC_SHOP_ARTICLE_G_Sport_BlackWhite = [-181, "G_Sport_BlackWhite", 5, false] call _getGlasses;
TTC_SHOP_ARTICLE_G_Sport_Blackyellow = [-182, "G_Sport_Blackyellow", 5, false] call _getGlasses;
TTC_SHOP_ARTICLE_G_Sport_Checkered = [-183, "G_Sport_Checkered", 5, false] call _getGlasses;
TTC_SHOP_ARTICLE_G_Sport_Greenblack = [-184, "G_Sport_Greenblack", 5, false] call _getGlasses;
TTC_SHOP_ARTICLE_G_Sport_Red = [-185, "G_Sport_Red", 5, false] call _getGlasses;
TTC_SHOP_ARTICLE_G_Lady_Mirror = [-186, "G_Lady_Mirror", 5, false] call _getGlasses;
TTC_SHOP_ARTICLE_G_Lady_Dark = [-187, "G_Lady_Dark", 5, false] call _getGlasses;
TTC_SHOP_ARTICLE_G_Lady_Red = [-188, "G_Lady_Red", 5, false] call _getGlasses;
TTC_SHOP_ARTICLE_G_Lady_Blue = [-189, "G_Lady_Blue", 5, false] call _getGlasses;
TTC_SHOP_ARTICLE_G_Spectacles = [-190, "G_Spectacles", 10, false] call _getGlasses;
TTC_SHOP_ARTICLE_G_Spectacles_Tinted = [-191, "G_Spectacles_Tinted", 10, false] call _getGlasses;
TTC_SHOP_ARTICLE_G_Squares = [-192, "G_Squares", 10, false] call _getGlasses;
TTC_SHOP_ARTICLE_G_Squares_Tinted = [-193, "G_Squares_Tinted", 10, false] call _getGlasses;
TTC_SHOP_ARTICLE_G_Lowprofile = [-194, "G_Lowprofile", 10, false] call _getGlasses;
TTC_SHOP_ARTICLE_G_Diving = [-195, "G_Diving", 10, false] call _getGlasses;
TTC_SHOP_ARTICLE_G_Tactical_Clear = [-196, "G_Tactical_Clear", 15, false] call _getGlasses;
TTC_SHOP_ARTICLE_G_Tactical_Black = [-197, "G_Tactical_Black", 15, false] call _getGlasses;
TTC_SHOP_ARTICLE_G_Combat = [-198, "G_Combat", 15, false] call _getGlasses;
TTC_SHOP_ARTICLE_G_Aviator = [-199, "G_Aviator", 20, false] call _getGlasses;
TTC_SHOP_ARTICLE_G_Bandanna_aviator = [-200, "G_Bandanna_aviator", 15, false] call _getGlasses;
TTC_SHOP_ARTICLE_G_Bandanna_beast = [-201, "G_Bandanna_beast", 15, false] call _getGlasses;
TTC_SHOP_ARTICLE_G_Bandanna_tan = [-202, "G_Bandanna_tan", 15, false] call _getGlasses;
TTC_SHOP_ARTICLE_G_Bandanna_sport = [-203, "G_Bandanna_sport", 15, false] call _getGlasses;
TTC_SHOP_ARTICLE_G_Bandanna_blk = [-204, "G_Bandanna_blk", 15, false] call _getGlasses;
TTC_SHOP_ARTICLE_G_Bandanna_oli = [-205, "G_Bandanna_oli", 15, false] call _getGlasses;
TTC_SHOP_ARTICLE_G_Bandanna_shades = [-206, "G_Bandanna_shades", 15, false] call _getGlasses;
TTC_SHOP_ARTICLE_G_Balaclava_blk = [-207, "G_Balaclava_blk", 25, false] call _getGlasses;
TTC_SHOP_ARTICLE_G_Balaclava_lowprofile = [-208, "G_Balaclava_lowprofile", 25, false] call _getGlasses;
TTC_SHOP_ARTICLE_G_Balaclava_combat = [-209, "G_Balaclava_combat", 25, false] call _getGlasses;
TTC_SHOP_ARTICLE_G_Balaclava_oli = [-210, "G_Balaclava_oli", 25, false] call _getGlasses;
TTC_SHOP_ARTICLE_V_Chestrig_rgr = [-225, "V_Chestrig_rgr", 250, false] call _getVest;
TTC_SHOP_ARTICLE_V_Chestrig_blk = [-226, "V_Chestrig_blk", 250, false] call _getVest;
TTC_SHOP_ARTICLE_V_Chestrig_oli = [-227, "V_Chestrig_oli", 250, false] call _getVest;
TTC_SHOP_ARTICLE_B_FieldPack_khk = [-232, "B_FieldPack_khk", 200, false] call _getBackpack;
TTC_SHOP_ARTICLE_B_FieldPack_ocamo = [-233, "B_FieldPack_ocamo", 200, false] call _getBackpack;
TTC_SHOP_ARTICLE_B_FieldPack_oucamo = [-234, "B_FieldPack_oucamo", 200, false] call _getBackpack;
TTC_SHOP_ARTICLE_B_FieldPack_cbr = [-235, "B_FieldPack_cbr", 200, false] call _getBackpack;
TTC_SHOP_ARTICLE_B_FieldPack_blk = [-236, "B_FieldPack_blk", 200, false] call _getBackpack;
TTC_SHOP_ARTICLE_B_AssaultPack_khk = [-237, "B_AssaultPack_khk", 250, false] call _getBackpack;
TTC_SHOP_ARTICLE_B_AssaultPack_dgtl = [-238, "B_AssaultPack_dgtl", 250, false] call _getBackpack;
TTC_SHOP_ARTICLE_B_AssaultPack_rgr = [-239, "B_AssaultPack_rgr", 250, false] call _getBackpack;
TTC_SHOP_ARTICLE_B_AssaultPack_blk = [-240, "B_AssaultPack_blk", 250, false] call _getBackpack;
TTC_SHOP_ARTICLE_B_AssaultPack_cbr = [-241, "B_AssaultPack_cbr", 250, false] call _getBackpack;
TTC_SHOP_ARTICLE_B_AssaultPack_mcamo = [-242, "B_AssaultPack_mcamo", 250, false] call _getBackpack;
TTC_SHOP_ARTICLE_B_AssaultPack_ocamo = [-243, "B_AssaultPack_ocamo", 250, false] call _getBackpack;
TTC_SHOP_ARTICLE_B_Kitbag_rgr = [-244, "B_Kitbag_rgr", 375, false] call _getBackpack;
TTC_SHOP_ARTICLE_B_Kitbag_mcamo = [-245, "B_Kitbag_mcamo", 375, false] call _getBackpack;
TTC_SHOP_ARTICLE_B_Kitbag_cbr = [-246, "B_Kitbag_cbr", 375, false] call _getBackpack;
TTC_SHOP_ARTICLE_B_Carryall_ocamo = [-247, "B_Carryall_ocamo", 450, false] call _getBackpack;
TTC_SHOP_ARTICLE_B_Carryall_oucamo = [-248, "B_Carryall_oucamo", 450, false] call _getBackpack;
TTC_SHOP_ARTICLE_B_Carryall_mcamo = [-249, "B_Carryall_mcamo", 450, false] call _getBackpack;
TTC_SHOP_ARTICLE_B_Carryall_khk = [-250, "B_Carryall_khk", 450, false] call _getBackpack;
TTC_SHOP_ARTICLE_B_Carryall_cbr = [-251, "B_Carryall_cbr", 450, false] call _getBackpack;
TTC_SHOP_ARTICLE_B_Parachute = [-252, "B_Parachute", 100, false] call _getBackpack;
TTC_SHOP_ARTICLE_B_Quadbike_01_F = [-255, "B_Quadbike_01_F", 50, false] call _getVehicle;
TTC_SHOP_ARTICLE_B_G_Offroad_01_F = [-256, "B_G_Offroad_01_F", 250, false] call _getVehicle;
TTC_SHOP_ARTICLE_B_G_Offroad_01_armed_F = [-257, "B_G_Offroad_01_armed_F", 400, false] call _getVehicle;
TTC_SHOP_ARTICLE_B_MRAP_01_F = [-258, "B_MRAP_01_F", 500, false] call _getVehicle;
TTC_SHOP_ARTICLE_B_MRAP_01_hmg_F = [-259, "B_MRAP_01_hmg_F", 1500, false] call _getVehicle;
TTC_SHOP_ARTICLE_B_MRAP_01_gmg_F = [-260, "B_MRAP_01_gmg_F", 2000, false] call _getVehicle;
TTC_SHOP_ARTICLE_B_Truck_01_transport_F = [-261, "B_Truck_01_transport_F", 625, false] call _getVehicle;
TTC_SHOP_ARTICLE_B_Truck_01_covered_F = [-262, "B_Truck_01_covered_F", 625, false] call _getVehicle;
TTC_SHOP_ARTICLE_B_APC_Tracked_01_rcws_F = [-263, "B_APC_Tracked_01_rcws_F", 4000, false] call _getVehicle;
TTC_SHOP_ARTICLE_B_APC_Tracked_01_CRV_F = [-264, "B_APC_Tracked_01_CRV_F", 4000, false] call _getVehicle;
TTC_SHOP_ARTICLE_B_APC_Tracked_01_AA_F = [-265, "B_APC_Tracked_01_AA_F", 4500, false] call _getVehicle;
TTC_SHOP_ARTICLE_B_Heli_Light_01_F = [-281, "B_Heli_Light_01_F", 1250, false] call _getVehicle;
TTC_SHOP_ARTICLE_V_Chestrig_khk = [-320, "V_Chestrig_khk", 250, false] call _getVest;
TTC_SHOP_ARTICLE_HandGrenade = [-340, "HandGrenade", 40, true] call _getMagazine;
TTC_SHOP_ARTICLE_MiniGrenade = [-341, "MiniGrenade", 25, true] call _getMagazine;
TTC_SHOP_ARTICLE_SmokeShell = [-342, "SmokeShell", 20, true] call _getMagazine;
TTC_SHOP_ARTICLE_SmokeShellPurple = [-346, "SmokeShellPurple", 20, true] call _getMagazine;
TTC_SHOP_ARTICLE_SmokeShellBlue = [-347, "SmokeShellBlue", 10, true] call _getMagazine;
TTC_SHOP_ARTICLE_SmokeShellOrange = [-348, "SmokeShellOrange", 20, true] call _getMagazine;
TTC_SHOP_ARTICLE_B_IR_Grenade = [-349, "B_IR_Grenade", 20, true] call _getMagazine;
TTC_SHOP_ARTICLE_Chemlight_green = [-383, "Chemlight_green", 5, true] call _getMagazine;
TTC_SHOP_ARTICLE_Chemlight_red = [-384, "Chemlight_red", 5, true] call _getMagazine;
TTC_SHOP_ARTICLE_Chemlight_yellow = [-385, "Chemlight_yellow", 5, true] call _getMagazine;
TTC_SHOP_ARTICLE_Chemlight_blue = [-386, "Chemlight_blue", 5, true] call _getMagazine;
TTC_SHOP_ARTICLE_bipod_01_F_snd = [-387, "bipod_01_F_snd", 200, false] call _getItem;
TTC_SHOP_ARTICLE_bipod_01_F_blk = [-388, "bipod_01_F_blk", 200, false] call _getItem;
TTC_SHOP_ARTICLE_bipod_01_F_mtp = [-389, "bipod_01_F_mtp", 200, false] call _getItem;
TTC_SHOP_ARTICLE_30Rnd_65x39_caseless_green = [-397, "30Rnd_65x39_caseless_green", 60, true] call _getMagazine;
TTC_SHOP_ARTICLE_30Rnd_65x39_caseless_green_mag_Tracer = [-398, "30Rnd_65x39_caseless_green_mag_Tracer", 30, true] call _getMagazine;
TTC_SHOP_ARTICLE_V_PlateCarrier1_rgr = [-472, "V_PlateCarrier1_rgr", 1000, false] call _getVest;
TTC_SHOP_ARTICLE_V_PlateCarrier1_blk = [-476, "V_PlateCarrier1_blk", 1000, false] call _getVest;
TTC_SHOP_ARTICLE_V_TacVest_khk = [-478, "V_TacVest_khk", 500, false] call _getVest;
TTC_SHOP_ARTICLE_V_TacVest_brn = [-479, "V_TacVest_brn", 500, false] call _getVest;
TTC_SHOP_ARTICLE_V_TacVest_oli = [-480, "V_TacVest_oli", 500, false] call _getVest;
TTC_SHOP_ARTICLE_V_TacVest_blk = [-481, "V_TacVest_blk", 500, false] call _getVest;
TTC_SHOP_ARTICLE_V_TacVest_camo = [-482, "V_TacVest_camo", 500, false] call _getVest;
TTC_SHOP_ARTICLE_V_TacVestCamo_khk = [-484, "V_TacVestCamo_khk", 500, false] call _getVest;


/*
  Array containing all articles.
  The articles are ordered by id.
*/
TTC_SHOP_ARTICLES = [
  TTC_SHOP_ARTICLE_hgun_P07_F,
  TTC_SHOP_ARTICLE_hgun_Rook40_F,
  TTC_SHOP_ARTICLE_hgun_Pistol_heavy_01_F,
  TTC_SHOP_ARTICLE_SMG_01_F,
  TTC_SHOP_ARTICLE_SMG_02_F,
  TTC_SHOP_ARTICLE_arifle_MXC_F,
  TTC_SHOP_ARTICLE_arifle_Katiba_C_F,
  TTC_SHOP_ARTICLE_arifle_MX_F,
  TTC_SHOP_ARTICLE_arifle_Katiba_F,
  TTC_SHOP_ARTICLE_arifle_MXM_F,
  TTC_SHOP_ARTICLE_srifle_EBR_F,
  TTC_SHOP_ARTICLE_srifle_DMR_03_F,
  TTC_SHOP_ARTICLE_srifle_DMR_03_khaki_F,
  TTC_SHOP_ARTICLE_srifle_DMR_03_tan_F,
  TTC_SHOP_ARTICLE_srifle_DMR_03_multicam_F,
  TTC_SHOP_ARTICLE_srifle_DMR_03_woodland_F,
  TTC_SHOP_ARTICLE_srifle_DMR_05_blk_F,
  TTC_SHOP_ARTICLE_srifle_DMR_05_hex_F,
  TTC_SHOP_ARTICLE_srifle_DMR_05_tan_f,
  TTC_SHOP_ARTICLE_launch_RPG32_F,
  TTC_SHOP_ARTICLE_launch_NLAW_F,
  TTC_SHOP_ARTICLE_launch_B_Titan_short_F,
  TTC_SHOP_ARTICLE_launch_B_Titan_F,
  TTC_SHOP_ARTICLE_16Rnd_9x21_Mag,
  TTC_SHOP_ARTICLE_30Rnd_9x21_Mag,
  TTC_SHOP_ARTICLE_11Rnd_45ACP_Mag,
  TTC_SHOP_ARTICLE_30Rnd_45ACP_Mag_SMG_01,
  TTC_SHOP_ARTICLE_30Rnd_45ACP_Mag_SMG_01_Tracer_Green,
  TTC_SHOP_ARTICLE_30Rnd_65x39_caseless_mag,
  TTC_SHOP_ARTICLE_30Rnd_65x39_caseless_mag_Tracer,
  TTC_SHOP_ARTICLE_20Rnd_762x51_Mag,
  TTC_SHOP_ARTICLE_10Rnd_93x64_DMR_05_Mag,
  TTC_SHOP_ARTICLE_RPG32_F,
  TTC_SHOP_ARTICLE_RPG32_HE_F,
  TTC_SHOP_ARTICLE_NLAW_F,
  TTC_SHOP_ARTICLE_Titan_AA,
  TTC_SHOP_ARTICLE_Titan_AP,
  TTC_SHOP_ARTICLE_Titan_AT,
  TTC_SHOP_ARTICLE_acc_flashlight,
  TTC_SHOP_ARTICLE_acc_pointer_IR,
  TTC_SHOP_ARTICLE_optic_MRD,
  TTC_SHOP_ARTICLE_optic_Aco_smg,
  TTC_SHOP_ARTICLE_optic_ACO_grn_smg,
  TTC_SHOP_ARTICLE_optic_Holosight_smg,
  TTC_SHOP_ARTICLE_optic_Aco,
  TTC_SHOP_ARTICLE_optic_ACO_grn,
  TTC_SHOP_ARTICLE_optic_Holosight,
  TTC_SHOP_ARTICLE_optic_MRCO,
  TTC_SHOP_ARTICLE_optic_Hamr,
  TTC_SHOP_ARTICLE_optic_Arco,
  TTC_SHOP_ARTICLE_optic_AMS,
  TTC_SHOP_ARTICLE_optic_AMS_khk,
  TTC_SHOP_ARTICLE_optic_AMS_snd,
  TTC_SHOP_ARTICLE_optic_KHS_blk,
  TTC_SHOP_ARTICLE_optic_KHS_hex,
  TTC_SHOP_ARTICLE_optic_KHS_old,
  TTC_SHOP_ARTICLE_optic_KHS_tan,
  TTC_SHOP_ARTICLE_optic_DMS,
  TTC_SHOP_ARTICLE_muzzle_snds_L,
  TTC_SHOP_ARTICLE_muzzle_snds_acp,
  TTC_SHOP_ARTICLE_muzzle_snds_H,
  TTC_SHOP_ARTICLE_muzzle_snds_B,
  TTC_SHOP_ARTICLE_muzzle_snds_93mmg,
  TTC_SHOP_ARTICLE_muzzle_snds_93mmg_tan,
  TTC_SHOP_ARTICLE_Binocular,
  TTC_SHOP_ARTICLE_FirstAidKit,
  TTC_SHOP_ARTICLE_NVGoggles,
  TTC_SHOP_ARTICLE_G_Shades_Black,
  TTC_SHOP_ARTICLE_G_Shades_Blue,
  TTC_SHOP_ARTICLE_G_Shades_Green,
  TTC_SHOP_ARTICLE_G_Shades_Red,
  TTC_SHOP_ARTICLE_G_Sport_Blackred,
  TTC_SHOP_ARTICLE_G_Sport_BlackWhite,
  TTC_SHOP_ARTICLE_G_Sport_Blackyellow,
  TTC_SHOP_ARTICLE_G_Sport_Checkered,
  TTC_SHOP_ARTICLE_G_Sport_Greenblack,
  TTC_SHOP_ARTICLE_G_Sport_Red,
  TTC_SHOP_ARTICLE_G_Lady_Mirror,
  TTC_SHOP_ARTICLE_G_Lady_Dark,
  TTC_SHOP_ARTICLE_G_Lady_Red,
  TTC_SHOP_ARTICLE_G_Lady_Blue,
  TTC_SHOP_ARTICLE_G_Spectacles,
  TTC_SHOP_ARTICLE_G_Spectacles_Tinted,
  TTC_SHOP_ARTICLE_G_Squares,
  TTC_SHOP_ARTICLE_G_Squares_Tinted,
  TTC_SHOP_ARTICLE_G_Lowprofile,
  TTC_SHOP_ARTICLE_G_Diving,
  TTC_SHOP_ARTICLE_G_Tactical_Clear,
  TTC_SHOP_ARTICLE_G_Tactical_Black,
  TTC_SHOP_ARTICLE_G_Combat,
  TTC_SHOP_ARTICLE_G_Aviator,
  TTC_SHOP_ARTICLE_G_Bandanna_aviator,
  TTC_SHOP_ARTICLE_G_Bandanna_beast,
  TTC_SHOP_ARTICLE_G_Bandanna_tan,
  TTC_SHOP_ARTICLE_G_Bandanna_sport,
  TTC_SHOP_ARTICLE_G_Bandanna_blk,
  TTC_SHOP_ARTICLE_G_Bandanna_oli,
  TTC_SHOP_ARTICLE_G_Bandanna_shades,
  TTC_SHOP_ARTICLE_G_Balaclava_blk,
  TTC_SHOP_ARTICLE_G_Balaclava_lowprofile,
  TTC_SHOP_ARTICLE_G_Balaclava_combat,
  TTC_SHOP_ARTICLE_G_Balaclava_oli,
  TTC_SHOP_ARTICLE_V_Chestrig_rgr,
  TTC_SHOP_ARTICLE_V_Chestrig_blk,
  TTC_SHOP_ARTICLE_V_Chestrig_oli,
  TTC_SHOP_ARTICLE_B_FieldPack_khk,
  TTC_SHOP_ARTICLE_B_FieldPack_ocamo,
  TTC_SHOP_ARTICLE_B_FieldPack_oucamo,
  TTC_SHOP_ARTICLE_B_FieldPack_cbr,
  TTC_SHOP_ARTICLE_B_FieldPack_blk,
  TTC_SHOP_ARTICLE_B_AssaultPack_khk,
  TTC_SHOP_ARTICLE_B_AssaultPack_dgtl,
  TTC_SHOP_ARTICLE_B_AssaultPack_rgr,
  TTC_SHOP_ARTICLE_B_AssaultPack_blk,
  TTC_SHOP_ARTICLE_B_AssaultPack_cbr,
  TTC_SHOP_ARTICLE_B_AssaultPack_mcamo,
  TTC_SHOP_ARTICLE_B_AssaultPack_ocamo,
  TTC_SHOP_ARTICLE_B_Kitbag_rgr,
  TTC_SHOP_ARTICLE_B_Kitbag_mcamo,
  TTC_SHOP_ARTICLE_B_Kitbag_cbr,
  TTC_SHOP_ARTICLE_B_Carryall_ocamo,
  TTC_SHOP_ARTICLE_B_Carryall_oucamo,
  TTC_SHOP_ARTICLE_B_Carryall_mcamo,
  TTC_SHOP_ARTICLE_B_Carryall_khk,
  TTC_SHOP_ARTICLE_B_Carryall_cbr,
  TTC_SHOP_ARTICLE_B_Parachute,
  TTC_SHOP_ARTICLE_B_Quadbike_01_F,
  TTC_SHOP_ARTICLE_B_G_Offroad_01_F,
  TTC_SHOP_ARTICLE_B_G_Offroad_01_armed_F,
  TTC_SHOP_ARTICLE_B_MRAP_01_F,
  TTC_SHOP_ARTICLE_B_MRAP_01_hmg_F,
  TTC_SHOP_ARTICLE_B_MRAP_01_gmg_F,
  TTC_SHOP_ARTICLE_B_Truck_01_transport_F,
  TTC_SHOP_ARTICLE_B_Truck_01_covered_F,
  TTC_SHOP_ARTICLE_B_APC_Tracked_01_rcws_F,
  TTC_SHOP_ARTICLE_B_APC_Tracked_01_CRV_F,
  TTC_SHOP_ARTICLE_B_APC_Tracked_01_AA_F,
  TTC_SHOP_ARTICLE_B_Heli_Light_01_F,
  TTC_SHOP_ARTICLE_V_Chestrig_khk,
  TTC_SHOP_ARTICLE_HandGrenade,
  TTC_SHOP_ARTICLE_MiniGrenade,
  TTC_SHOP_ARTICLE_SmokeShell,
  TTC_SHOP_ARTICLE_SmokeShellPurple,
  TTC_SHOP_ARTICLE_SmokeShellBlue,
  TTC_SHOP_ARTICLE_SmokeShellOrange,
  TTC_SHOP_ARTICLE_B_IR_Grenade,
  TTC_SHOP_ARTICLE_Chemlight_green,
  TTC_SHOP_ARTICLE_Chemlight_red,
  TTC_SHOP_ARTICLE_Chemlight_yellow,
  TTC_SHOP_ARTICLE_Chemlight_blue,
  TTC_SHOP_ARTICLE_bipod_01_F_snd,
  TTC_SHOP_ARTICLE_bipod_01_F_blk,
  TTC_SHOP_ARTICLE_bipod_01_F_mtp,
  TTC_SHOP_ARTICLE_30Rnd_65x39_caseless_green,
  TTC_SHOP_ARTICLE_30Rnd_65x39_caseless_green_mag_Tracer,
  TTC_SHOP_ARTICLE_V_PlateCarrier1_rgr,
  TTC_SHOP_ARTICLE_V_PlateCarrier1_blk,
  TTC_SHOP_ARTICLE_V_TacVest_khk,
  TTC_SHOP_ARTICLE_V_TacVest_brn,
  TTC_SHOP_ARTICLE_V_TacVest_oli,
  TTC_SHOP_ARTICLE_V_TacVest_blk,
  TTC_SHOP_ARTICLE_V_TacVest_camo,
  TTC_SHOP_ARTICLE_V_TacVestCamo_khk
];


/* BASE SHOP */

TTC_SHOP_BASE_RIFLES = [
	TTC_SHOP_ARTICLE_SMG_02_F,
	TTC_SHOP_ARTICLE_SMG_01_F,
	TTC_SHOP_ARTICLE_arifle_Katiba_C_F,
	TTC_SHOP_ARTICLE_arifle_MXC_F,
	TTC_SHOP_ARTICLE_arifle_Katiba_F,
	TTC_SHOP_ARTICLE_arifle_MX_F,
	TTC_SHOP_ARTICLE_arifle_MXM_F,
	TTC_SHOP_ARTICLE_srifle_DMR_05_blk_F,
	TTC_SHOP_ARTICLE_srifle_DMR_05_hex_F,
	TTC_SHOP_ARTICLE_srifle_DMR_05_tan_f,
	TTC_SHOP_ARTICLE_srifle_DMR_03_F,
	TTC_SHOP_ARTICLE_srifle_DMR_03_multicam_F,
	TTC_SHOP_ARTICLE_srifle_DMR_03_khaki_F,
	TTC_SHOP_ARTICLE_srifle_DMR_03_tan_F,
	TTC_SHOP_ARTICLE_srifle_DMR_03_woodland_F,
	TTC_SHOP_ARTICLE_srifle_EBR_F
];

TTC_SHOP_BASE_HANDGUNS = [
	TTC_SHOP_ARTICLE_hgun_P07_F,
	TTC_SHOP_ARTICLE_hgun_Rook40_F,
	TTC_SHOP_ARTICLE_hgun_Pistol_heavy_01_F
];

TTC_SHOP_BASE_LAUNCHERS = [
	TTC_SHOP_ARTICLE_launch_RPG32_F,
	TTC_SHOP_ARTICLE_launch_NLAW_F,
	TTC_SHOP_ARTICLE_launch_B_Titan_short_F,
	TTC_SHOP_ARTICLE_launch_B_Titan_F
];

TTC_SHOP_BASE_SCOPES = [
	TTC_SHOP_ARTICLE_optic_MRD,
	TTC_SHOP_ARTICLE_optic_ACO_grn_smg,
	TTC_SHOP_ARTICLE_optic_Aco_smg,
	TTC_SHOP_ARTICLE_optic_Holosight_smg,
	TTC_SHOP_ARTICLE_optic_ACO_grn,
	TTC_SHOP_ARTICLE_optic_Aco,
	TTC_SHOP_ARTICLE_optic_Holosight,
	TTC_SHOP_ARTICLE_optic_MRCO,
	TTC_SHOP_ARTICLE_optic_Arco,
	TTC_SHOP_ARTICLE_optic_Hamr,
	TTC_SHOP_ARTICLE_optic_AMS,
	TTC_SHOP_ARTICLE_optic_AMS_khk,
	TTC_SHOP_ARTICLE_optic_AMS_snd,
	TTC_SHOP_ARTICLE_optic_KHS_blk,
	TTC_SHOP_ARTICLE_optic_KHS_hex,
	TTC_SHOP_ARTICLE_optic_KHS_old,
	TTC_SHOP_ARTICLE_optic_KHS_tan,
	TTC_SHOP_ARTICLE_optic_DMS
];

TTC_SHOP_BASE_ATTACHMENTS = [
	TTC_SHOP_ARTICLE_bipod_01_F_blk,
	TTC_SHOP_ARTICLE_bipod_01_F_mtp,
	TTC_SHOP_ARTICLE_bipod_01_F_snd,
	TTC_SHOP_ARTICLE_muzzle_snds_acp,
	TTC_SHOP_ARTICLE_muzzle_snds_L,
	TTC_SHOP_ARTICLE_muzzle_snds_H,
	TTC_SHOP_ARTICLE_muzzle_snds_B,
	TTC_SHOP_ARTICLE_muzzle_snds_93mmg,
	TTC_SHOP_ARTICLE_muzzle_snds_93mmg_tan,
	TTC_SHOP_ARTICLE_acc_flashlight,
	TTC_SHOP_ARTICLE_acc_pointer_IR
];

TTC_SHOP_BASE_AMMUNITION = [
	TTC_SHOP_ARTICLE_16Rnd_9x21_Mag,
	TTC_SHOP_ARTICLE_11Rnd_45ACP_Mag,
	TTC_SHOP_ARTICLE_30Rnd_45ACP_Mag_SMG_01_Tracer_Green,
	TTC_SHOP_ARTICLE_30Rnd_9x21_Mag,
	TTC_SHOP_ARTICLE_30Rnd_45ACP_Mag_SMG_01,
	TTC_SHOP_ARTICLE_30Rnd_65x39_caseless_green_mag_Tracer,
	TTC_SHOP_ARTICLE_30Rnd_65x39_caseless_mag_Tracer,
	TTC_SHOP_ARTICLE_30Rnd_65x39_caseless_green,
	TTC_SHOP_ARTICLE_30Rnd_65x39_caseless_mag,
	TTC_SHOP_ARTICLE_20Rnd_762x51_Mag,
	TTC_SHOP_ARTICLE_10Rnd_93x64_DMR_05_Mag,
	TTC_SHOP_ARTICLE_RPG32_HE_F,
	TTC_SHOP_ARTICLE_RPG32_F,
	TTC_SHOP_ARTICLE_NLAW_F,
	TTC_SHOP_ARTICLE_Titan_AA,
	TTC_SHOP_ARTICLE_Titan_AP,
	TTC_SHOP_ARTICLE_Titan_AT
];

TTC_SHOP_BASE_GRENADES = [
	TTC_SHOP_ARTICLE_B_IR_Grenade,
	TTC_SHOP_ARTICLE_MiniGrenade,
	TTC_SHOP_ARTICLE_HandGrenade,
	TTC_SHOP_ARTICLE_SmokeShellBlue,
	TTC_SHOP_ARTICLE_SmokeShellOrange,
	TTC_SHOP_ARTICLE_SmokeShellPurple,
	TTC_SHOP_ARTICLE_SmokeShell,
	TTC_SHOP_ARTICLE_Chemlight_blue,
	TTC_SHOP_ARTICLE_Chemlight_green,
	TTC_SHOP_ARTICLE_Chemlight_red,
	TTC_SHOP_ARTICLE_Chemlight_yellow
];

TTC_SHOP_BASE_ITEMS = [
	TTC_SHOP_ARTICLE_Binocular,
	TTC_SHOP_ARTICLE_FirstAidKit,
	TTC_SHOP_ARTICLE_NVGoggles
];

TTC_SHOP_BASE_FACEWEAR = [
	TTC_SHOP_ARTICLE_G_Diving,
	TTC_SHOP_ARTICLE_G_Lowprofile,
	TTC_SHOP_ARTICLE_G_Spectacles,
	TTC_SHOP_ARTICLE_G_Squares_Tinted,
	TTC_SHOP_ARTICLE_G_Squares,
	TTC_SHOP_ARTICLE_G_Spectacles_Tinted,
	TTC_SHOP_ARTICLE_G_Combat,
	TTC_SHOP_ARTICLE_G_Tactical_Clear,
	TTC_SHOP_ARTICLE_G_Tactical_Black,
	TTC_SHOP_ARTICLE_G_Aviator,
	TTC_SHOP_ARTICLE_G_Shades_Black,
	TTC_SHOP_ARTICLE_G_Shades_Blue,
	TTC_SHOP_ARTICLE_G_Shades_Green,
	TTC_SHOP_ARTICLE_G_Shades_Red,
	TTC_SHOP_ARTICLE_G_Sport_Red,
	TTC_SHOP_ARTICLE_G_Sport_Blackyellow,
	TTC_SHOP_ARTICLE_G_Sport_BlackWhite,
	TTC_SHOP_ARTICLE_G_Sport_Checkered,
	TTC_SHOP_ARTICLE_G_Sport_Blackred,
	TTC_SHOP_ARTICLE_G_Sport_Greenblack,
	TTC_SHOP_ARTICLE_G_Lady_Red,
	TTC_SHOP_ARTICLE_G_Lady_Blue,
	TTC_SHOP_ARTICLE_G_Lady_Mirror,
	TTC_SHOP_ARTICLE_G_Lady_Dark,
	TTC_SHOP_ARTICLE_G_Bandanna_aviator,
	TTC_SHOP_ARTICLE_G_Bandanna_beast,
	TTC_SHOP_ARTICLE_G_Bandanna_tan,
	TTC_SHOP_ARTICLE_G_Bandanna_sport,
	TTC_SHOP_ARTICLE_G_Bandanna_blk,
	TTC_SHOP_ARTICLE_G_Bandanna_oli,
	TTC_SHOP_ARTICLE_G_Bandanna_shades,
	TTC_SHOP_ARTICLE_G_Balaclava_blk,
	TTC_SHOP_ARTICLE_G_Balaclava_lowprofile,
	TTC_SHOP_ARTICLE_G_Balaclava_combat,
	TTC_SHOP_ARTICLE_G_Balaclava_oli
];

TTC_SHOP_BASE_VESTS = [
	TTC_SHOP_ARTICLE_V_Chestrig_rgr,
	TTC_SHOP_ARTICLE_V_Chestrig_khk,
	TTC_SHOP_ARTICLE_V_Chestrig_blk,
	TTC_SHOP_ARTICLE_V_Chestrig_oli,
	TTC_SHOP_ARTICLE_V_PlateCarrier1_blk,
	TTC_SHOP_ARTICLE_V_PlateCarrier1_rgr,
	TTC_SHOP_ARTICLE_V_TacVestCamo_khk,
	TTC_SHOP_ARTICLE_V_TacVest_blk,
	TTC_SHOP_ARTICLE_V_TacVest_brn,
	TTC_SHOP_ARTICLE_V_TacVest_camo,
	TTC_SHOP_ARTICLE_V_TacVest_khk,
	TTC_SHOP_ARTICLE_V_TacVest_oli
];

TTC_SHOP_BASE_BACKPACKS = [
	TTC_SHOP_ARTICLE_B_Parachute,
	TTC_SHOP_ARTICLE_B_FieldPack_blk,
	TTC_SHOP_ARTICLE_B_FieldPack_cbr,
	TTC_SHOP_ARTICLE_B_FieldPack_ocamo,
	TTC_SHOP_ARTICLE_B_FieldPack_khk,
	TTC_SHOP_ARTICLE_B_FieldPack_oucamo,
	TTC_SHOP_ARTICLE_B_AssaultPack_blk,
	TTC_SHOP_ARTICLE_B_AssaultPack_cbr,
	TTC_SHOP_ARTICLE_B_AssaultPack_dgtl,
	TTC_SHOP_ARTICLE_B_AssaultPack_rgr,
	TTC_SHOP_ARTICLE_B_AssaultPack_ocamo,
	TTC_SHOP_ARTICLE_B_AssaultPack_khk,
	TTC_SHOP_ARTICLE_B_AssaultPack_mcamo,
	TTC_SHOP_ARTICLE_B_Kitbag_cbr,
	TTC_SHOP_ARTICLE_B_Kitbag_rgr,
	TTC_SHOP_ARTICLE_B_Kitbag_mcamo,
	TTC_SHOP_ARTICLE_B_Carryall_cbr,
	TTC_SHOP_ARTICLE_B_Carryall_ocamo,
	TTC_SHOP_ARTICLE_B_Carryall_khk,
	TTC_SHOP_ARTICLE_B_Carryall_mcamo,
	TTC_SHOP_ARTICLE_B_Carryall_oucamo
];

TTC_SHOP_BASE_VEHICLES = [
	TTC_SHOP_ARTICLE_B_Quadbike_01_F,
	TTC_SHOP_ARTICLE_B_G_Offroad_01_F,
	TTC_SHOP_ARTICLE_B_G_Offroad_01_armed_F,
	TTC_SHOP_ARTICLE_B_Truck_01_transport_F,
	TTC_SHOP_ARTICLE_B_Truck_01_covered_F,
	TTC_SHOP_ARTICLE_B_MRAP_01_F,
	TTC_SHOP_ARTICLE_B_MRAP_01_hmg_F,
	TTC_SHOP_ARTICLE_B_MRAP_01_gmg_F,
	TTC_SHOP_ARTICLE_B_APC_Tracked_01_CRV_F,
	TTC_SHOP_ARTICLE_B_APC_Tracked_01_rcws_F,
	TTC_SHOP_ARTICLE_B_APC_Tracked_01_AA_F
];

TTC_SHOP_BASE_HELICOPTERS = [
	TTC_SHOP_ARTICLE_B_Heli_Light_01_F
];


TTC_SHOP_BASE_CATEGORIES = [
  [1, "Rifles", "\A3\ui_f\data\gui\Rsc\RscDisplayArsenal\primaryweapon_ca.paa", TTC_SHOP_BASE_RIFLES],
  [2, "Handguns", "\A3\ui_f\data\gui\Rsc\RscDisplayArsenal\handgun_ca.paa", TTC_SHOP_BASE_HANDGUNS],
  [3, "Launchers", "\A3\ui_f\data\gui\Rsc\RscDisplayArsenal\secondaryweapon_ca.paa", TTC_SHOP_BASE_LAUNCHERS],
  [4, "Scopes", "\A3\ui_f\data\gui\Rsc\RscDisplayArsenal\itemoptic_ca.paa", TTC_SHOP_BASE_SCOPES],
  [5, "Attachments", "\A3\ui_f\data\gui\Rsc\RscDisplayArsenal\itemmuzzle_ca.paa", TTC_SHOP_BASE_ATTACHMENTS],
  [7, "Ammunition", "\A3\ui_f\data\gui\Rsc\RscDisplayArsenal\cargomag_ca.paa", TTC_SHOP_BASE_AMMUNITION],
  [75, "Grenades", "\A3\ui_f\data\gui\Rsc\RscDisplayArsenal\cargothrow_ca.paa", TTC_SHOP_BASE_GRENADES],
  [9, "Items", "\A3\ui_f\data\gui\Rsc\RscDisplayArsenal\cargomisc_ca.paa", TTC_SHOP_BASE_ITEMS],
  [11, "Facewear", "\A3\ui_f\data\gui\Rsc\RscDisplayArsenal\goggles_ca.paa", TTC_SHOP_BASE_FACEWEAR],
  [13, "Vests", "\A3\ui_f\data\gui\Rsc\RscDisplayArsenal\vest_ca.paa", TTC_SHOP_BASE_VESTS],
  [14, "Backpacks", "\A3\ui_f\data\gui\Rsc\RscDisplayArsenal\backpack_ca.paa", TTC_SHOP_BASE_BACKPACKS],
  [15, "Vehicles", "SOS\TTC\Shop\Icons\vehicle.paa", TTC_SHOP_BASE_VEHICLES],
  [16, "Helicopters", "SOS\TTC\Shop\Icons\helicopter.paa", TTC_SHOP_BASE_HELICOPTERS]
];


/* SECTOR SHOP */

TTC_SHOP_SECTOR_AMMUNITION = [
	TTC_SHOP_ARTICLE_16Rnd_9x21_Mag,
	TTC_SHOP_ARTICLE_11Rnd_45ACP_Mag,
	TTC_SHOP_ARTICLE_30Rnd_45ACP_Mag_SMG_01_Tracer_Green,
	TTC_SHOP_ARTICLE_30Rnd_9x21_Mag,
	TTC_SHOP_ARTICLE_30Rnd_45ACP_Mag_SMG_01,
	TTC_SHOP_ARTICLE_30Rnd_65x39_caseless_green_mag_Tracer,
	TTC_SHOP_ARTICLE_30Rnd_65x39_caseless_mag_Tracer,
	TTC_SHOP_ARTICLE_30Rnd_65x39_caseless_green,
	TTC_SHOP_ARTICLE_30Rnd_65x39_caseless_mag,
	TTC_SHOP_ARTICLE_20Rnd_762x51_Mag,
	TTC_SHOP_ARTICLE_10Rnd_93x64_DMR_05_Mag,
	TTC_SHOP_ARTICLE_RPG32_HE_F,
	TTC_SHOP_ARTICLE_RPG32_F,
	TTC_SHOP_ARTICLE_NLAW_F,
	TTC_SHOP_ARTICLE_Titan_AA,
	TTC_SHOP_ARTICLE_Titan_AP,
	TTC_SHOP_ARTICLE_Titan_AT
];

TTC_SHOP_SECTOR_GRENADES = [
	TTC_SHOP_ARTICLE_B_IR_Grenade,
	TTC_SHOP_ARTICLE_MiniGrenade,
	TTC_SHOP_ARTICLE_HandGrenade,
	TTC_SHOP_ARTICLE_SmokeShellBlue,
	TTC_SHOP_ARTICLE_SmokeShellOrange,
	TTC_SHOP_ARTICLE_SmokeShellPurple,
	TTC_SHOP_ARTICLE_SmokeShell,
	TTC_SHOP_ARTICLE_Chemlight_blue,
	TTC_SHOP_ARTICLE_Chemlight_green,
	TTC_SHOP_ARTICLE_Chemlight_red,
	TTC_SHOP_ARTICLE_Chemlight_yellow
];

TTC_SHOP_SECTOR_ITEMS = [
	TTC_SHOP_ARTICLE_Binocular,
	TTC_SHOP_ARTICLE_FirstAidKit,
	TTC_SHOP_ARTICLE_NVGoggles
];


TTC_SHOP_SECTOR_CATEGORIES = [
  [7, "Ammunition", "\A3\ui_f\data\gui\Rsc\RscDisplayArsenal\cargomag_ca.paa", TTC_SHOP_SECTOR_AMMUNITION],
  [75, "Grenades", "\A3\ui_f\data\gui\Rsc\RscDisplayArsenal\cargothrow_ca.paa", TTC_SHOP_SECTOR_GRENADES],
  [9, "Items", "\A3\ui_f\data\gui\Rsc\RscDisplayArsenal\cargomisc_ca.paa", TTC_SHOP_SECTOR_ITEMS]
];
