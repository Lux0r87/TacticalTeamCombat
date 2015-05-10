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

TTC_SHOP_CATEGORY_id			= 0;
TTC_SHOP_CATEGORY_name			= 1;
TTC_SHOP_CATEGORY_icon			= 2;
TTC_SHOP_CATEGORY_articles		= 3;


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
  Article constants.
  Name:  TTC_SHOP_ARTICLE_<Class>
  Data:  [id, class, maxAmount, price]
*/
TTC_SHOP_ARTICLE_hgun_ACPC2_F = [-2, "hgun_ACPC2_F", 0, 80] call _getWeapon;
TTC_SHOP_ARTICLE_hgun_Rook40_F = [-3, "hgun_Rook40_F", 0, 80] call _getWeapon;
TTC_SHOP_ARTICLE_hgun_Pistol_heavy_02_F = [-5, "hgun_Pistol_heavy_02_F", 0, 150] call _getWeapon;
TTC_SHOP_ARTICLE_arifle_MX_SW_F = [-20, "arifle_MX_SW_F", 0, 700] call _getWeapon;
TTC_SHOP_ARTICLE_LMG_Mk200_F = [-21, "LMG_Mk200_F", 0, 875] call _getWeapon;
TTC_SHOP_ARTICLE_LMG_Zafir_F = [-22, "LMG_Zafir_F", 0, 1050] call _getWeapon;
TTC_SHOP_ARTICLE_MMG_01_hex_F = [-23, "MMG_01_hex_F", 0, 1225] call _getWeapon;
TTC_SHOP_ARTICLE_MMG_01_tan_F = [-24, "MMG_01_tan_F", 0, 1225] call _getWeapon;
TTC_SHOP_ARTICLE_MMG_02_camo_F = [-25, "MMG_02_camo_F", 0, 1225] call _getWeapon;
TTC_SHOP_ARTICLE_MMG_02_black_F = [-26, "MMG_02_black_F", 0, 1225] call _getWeapon;
TTC_SHOP_ARTICLE_MMG_02_sand_F = [-27, "MMG_02_sand_F", 0, 1225] call _getWeapon;
TTC_SHOP_ARTICLE_16Rnd_9x21_Mag = [-53, "16Rnd_9x21_Mag", 0, 20] call _getMagazine;
TTC_SHOP_ARTICLE_30Rnd_9x21_Mag = [-54, "30Rnd_9x21_Mag", 0, 40] call _getMagazine;
TTC_SHOP_ARTICLE_6Rnd_45ACP_Cylinder = [-55, "6Rnd_45ACP_Cylinder", 0, 15] call _getMagazine;
TTC_SHOP_ARTICLE_9Rnd_45ACP_Mag = [-56, "9Rnd_45ACP_Mag", 0, 20] call _getMagazine;
TTC_SHOP_ARTICLE_100Rnd_65x39_caseless_mag = [-64, "100Rnd_65x39_caseless_mag", 0, 80] call _getMagazine;
TTC_SHOP_ARTICLE_100Rnd_65x39_caseless_mag_Tracer = [-65, "100Rnd_65x39_caseless_mag_Tracer", 0, 40] call _getMagazine;
TTC_SHOP_ARTICLE_200Rnd_65x39_cased_Box = [-66, "200Rnd_65x39_cased_Box", 0, 160] call _getMagazine;
TTC_SHOP_ARTICLE_200Rnd_65x39_cased_Box_Tracer = [-67, "200Rnd_65x39_cased_Box_Tracer", 0, 80] call _getMagazine;
TTC_SHOP_ARTICLE_150Rnd_762x54_Box = [-69, "150Rnd_762x54_Box", 0, 120] call _getMagazine;
TTC_SHOP_ARTICLE_150Rnd_762x54_Box_Tracer = [-70, "150Rnd_762x54_Box_Tracer", 0, 60] call _getMagazine;
TTC_SHOP_ARTICLE_130Rnd_338_Mag = [-72, "130Rnd_338_Mag", 0, 140] call _getMagazine;
TTC_SHOP_ARTICLE_150Rnd_93x64_Mag = [-74, "150Rnd_93x64_Mag", 0, 150] call _getMagazine;
TTC_SHOP_ARTICLE_acc_flashlight = [-119, "acc_flashlight", 0, 25] call _getItem;
TTC_SHOP_ARTICLE_acc_pointer_IR = [-120, "acc_pointer_IR", 0, 50] call _getItem;
TTC_SHOP_ARTICLE_optic_Yorris = [-122, "optic_Yorris", 0, 75] call _getItem;
TTC_SHOP_ARTICLE_optic_Aco = [-126, "optic_Aco", 0, 100] call _getItem;
TTC_SHOP_ARTICLE_optic_ACO_grn = [-127, "optic_ACO_grn", 0, 100] call _getItem;
TTC_SHOP_ARTICLE_optic_Holosight = [-128, "optic_Holosight", 0, 125] call _getItem;
TTC_SHOP_ARTICLE_optic_MRCO = [-129, "optic_MRCO", 0, 200] call _getItem;
TTC_SHOP_ARTICLE_optic_Hamr = [-130, "optic_Hamr", 0, 300] call _getItem;
TTC_SHOP_ARTICLE_optic_Arco = [-131, "optic_Arco", 0, 300] call _getItem;
TTC_SHOP_ARTICLE_optic_AMS = [-133, "optic_AMS", 0, 375] call _getItem;
TTC_SHOP_ARTICLE_optic_AMS_khk = [-134, "optic_AMS_khk", 0, 375] call _getItem;
TTC_SHOP_ARTICLE_optic_AMS_snd = [-135, "optic_AMS_snd", 0, 375] call _getItem;
TTC_SHOP_ARTICLE_optic_KHS_blk = [-136, "optic_KHS_blk", 0, 375] call _getItem;
TTC_SHOP_ARTICLE_optic_KHS_hex = [-137, "optic_KHS_hex", 0, 375] call _getItem;
TTC_SHOP_ARTICLE_optic_KHS_old = [-138, "optic_KHS_old", 0, 375] call _getItem;
TTC_SHOP_ARTICLE_optic_KHS_tan = [-139, "optic_KHS_tan", 0, 375] call _getItem;
TTC_SHOP_ARTICLE_optic_DMS = [-140, "optic_DMS", 0, 450] call _getItem;
TTC_SHOP_ARTICLE_muzzle_snds_L = [-143, "muzzle_snds_L", 0, 120] call _getItem;
TTC_SHOP_ARTICLE_muzzle_snds_acp = [-144, "muzzle_snds_acp", 0, 120] call _getItem;
TTC_SHOP_ARTICLE_muzzle_snds_H_SW = [-147, "muzzle_snds_H_SW", 0, 180] call _getItem;
TTC_SHOP_ARTICLE_muzzle_snds_H_MG = [-148, "muzzle_snds_H_MG", 0, 180] call _getItem;
TTC_SHOP_ARTICLE_muzzle_snds_338_black = [-150, "muzzle_snds_338_black", 0, 405] call _getItem;
TTC_SHOP_ARTICLE_muzzle_snds_338_green = [-151, "muzzle_snds_338_green", 0, 405] call _getItem;
TTC_SHOP_ARTICLE_muzzle_snds_93mmg = [-152, "muzzle_snds_93mmg", 0, 405] call _getItem;
TTC_SHOP_ARTICLE_muzzle_snds_93mmg_tan = [-153, "muzzle_snds_93mmg_tan", 0, 405] call _getItem;
TTC_SHOP_ARTICLE_Binocular = [-165, "Binocular", 0, 60] call _getWeapon;
TTC_SHOP_ARTICLE_FirstAidKit = [-167, "FirstAidKit", 0, 50] call _getWeapon;
TTC_SHOP_ARTICLE_NVGoggles_INDEP = [-173, "NVGoggles_INDEP", 0, 400] call _getWeapon;
TTC_SHOP_ARTICLE_G_Shades_Black = [-176, "G_Shades_Black", 0, 5] call _getGlasses;
TTC_SHOP_ARTICLE_G_Shades_Blue = [-177, "G_Shades_Blue", 0, 5] call _getGlasses;
TTC_SHOP_ARTICLE_G_Shades_Green = [-178, "G_Shades_Green", 0, 5] call _getGlasses;
TTC_SHOP_ARTICLE_G_Shades_Red = [-179, "G_Shades_Red", 0, 5] call _getGlasses;
TTC_SHOP_ARTICLE_G_Sport_Blackred = [-180, "G_Sport_Blackred", 0, 5] call _getGlasses;
TTC_SHOP_ARTICLE_G_Sport_BlackWhite = [-181, "G_Sport_BlackWhite", 0, 5] call _getGlasses;
TTC_SHOP_ARTICLE_G_Sport_Blackyellow = [-182, "G_Sport_Blackyellow", 0, 5] call _getGlasses;
TTC_SHOP_ARTICLE_G_Sport_Checkered = [-183, "G_Sport_Checkered", 0, 5] call _getGlasses;
TTC_SHOP_ARTICLE_G_Sport_Greenblack = [-184, "G_Sport_Greenblack", 0, 5] call _getGlasses;
TTC_SHOP_ARTICLE_G_Sport_Red = [-185, "G_Sport_Red", 0, 5] call _getGlasses;
TTC_SHOP_ARTICLE_G_Lady_Mirror = [-186, "G_Lady_Mirror", 0, 5] call _getGlasses;
TTC_SHOP_ARTICLE_G_Lady_Dark = [-187, "G_Lady_Dark", 0, 5] call _getGlasses;
TTC_SHOP_ARTICLE_G_Lady_Red = [-188, "G_Lady_Red", 0, 5] call _getGlasses;
TTC_SHOP_ARTICLE_G_Lady_Blue = [-189, "G_Lady_Blue", 0, 5] call _getGlasses;
TTC_SHOP_ARTICLE_G_Spectacles = [-190, "G_Spectacles", 0, 10] call _getGlasses;
TTC_SHOP_ARTICLE_G_Spectacles_Tinted = [-191, "G_Spectacles_Tinted", 0, 10] call _getGlasses;
TTC_SHOP_ARTICLE_G_Squares = [-192, "G_Squares", 0, 10] call _getGlasses;
TTC_SHOP_ARTICLE_G_Squares_Tinted = [-193, "G_Squares_Tinted", 0, 10] call _getGlasses;
TTC_SHOP_ARTICLE_G_Lowprofile = [-194, "G_Lowprofile", 0, 10] call _getGlasses;
TTC_SHOP_ARTICLE_G_Diving = [-195, "G_Diving", 0, 10] call _getGlasses;
TTC_SHOP_ARTICLE_G_Tactical_Clear = [-196, "G_Tactical_Clear", 0, 15] call _getGlasses;
TTC_SHOP_ARTICLE_G_Tactical_Black = [-197, "G_Tactical_Black", 0, 15] call _getGlasses;
TTC_SHOP_ARTICLE_G_Combat = [-198, "G_Combat", 0, 15] call _getGlasses;
TTC_SHOP_ARTICLE_G_Aviator = [-199, "G_Aviator", 0, 20] call _getGlasses;
TTC_SHOP_ARTICLE_G_Bandanna_aviator = [-200, "G_Bandanna_aviator", 0, 15] call _getGlasses;
TTC_SHOP_ARTICLE_G_Bandanna_beast = [-201, "G_Bandanna_beast", 0, 15] call _getGlasses;
TTC_SHOP_ARTICLE_G_Bandanna_tan = [-202, "G_Bandanna_tan", 0, 15] call _getGlasses;
TTC_SHOP_ARTICLE_G_Bandanna_sport = [-203, "G_Bandanna_sport", 0, 15] call _getGlasses;
TTC_SHOP_ARTICLE_G_Bandanna_blk = [-204, "G_Bandanna_blk", 0, 15] call _getGlasses;
TTC_SHOP_ARTICLE_G_Bandanna_oli = [-205, "G_Bandanna_oli", 0, 15] call _getGlasses;
TTC_SHOP_ARTICLE_G_Bandanna_shades = [-206, "G_Bandanna_shades", 0, 15] call _getGlasses;
TTC_SHOP_ARTICLE_G_Balaclava_blk = [-207, "G_Balaclava_blk", 0, 25] call _getGlasses;
TTC_SHOP_ARTICLE_G_Balaclava_lowprofile = [-208, "G_Balaclava_lowprofile", 0, 25] call _getGlasses;
TTC_SHOP_ARTICLE_G_Balaclava_combat = [-209, "G_Balaclava_combat", 0, 25] call _getGlasses;
TTC_SHOP_ARTICLE_G_Balaclava_oli = [-210, "G_Balaclava_oli", 0, 25] call _getGlasses;
TTC_SHOP_ARTICLE_V_BandollierB_khk = [-228, "V_BandollierB_khk", 0, 200] call _getVest;
TTC_SHOP_ARTICLE_V_BandollierB_cbr = [-229, "V_BandollierB_cbr", 0, 200] call _getVest;
TTC_SHOP_ARTICLE_V_BandollierB_blk = [-230, "V_BandollierB_blk", 0, 200] call _getVest;
TTC_SHOP_ARTICLE_V_BandollierB_oli = [-231, "V_BandollierB_oli", 0, 200] call _getVest;
TTC_SHOP_ARTICLE_B_FieldPack_khk = [-232, "B_FieldPack_khk", 0, 200] call _getBackpack;
TTC_SHOP_ARTICLE_B_FieldPack_ocamo = [-233, "B_FieldPack_ocamo", 0, 200] call _getBackpack;
TTC_SHOP_ARTICLE_B_FieldPack_oucamo = [-234, "B_FieldPack_oucamo", 0, 200] call _getBackpack;
TTC_SHOP_ARTICLE_B_FieldPack_cbr = [-235, "B_FieldPack_cbr", 0, 200] call _getBackpack;
TTC_SHOP_ARTICLE_B_FieldPack_blk = [-236, "B_FieldPack_blk", 0, 200] call _getBackpack;
TTC_SHOP_ARTICLE_B_AssaultPack_khk = [-237, "B_AssaultPack_khk", 0, 250] call _getBackpack;
TTC_SHOP_ARTICLE_B_AssaultPack_dgtl = [-238, "B_AssaultPack_dgtl", 0, 250] call _getBackpack;
TTC_SHOP_ARTICLE_B_AssaultPack_rgr = [-239, "B_AssaultPack_rgr", 0, 250] call _getBackpack;
TTC_SHOP_ARTICLE_B_AssaultPack_blk = [-240, "B_AssaultPack_blk", 0, 250] call _getBackpack;
TTC_SHOP_ARTICLE_B_AssaultPack_cbr = [-241, "B_AssaultPack_cbr", 0, 250] call _getBackpack;
TTC_SHOP_ARTICLE_B_AssaultPack_mcamo = [-242, "B_AssaultPack_mcamo", 0, 250] call _getBackpack;
TTC_SHOP_ARTICLE_B_AssaultPack_ocamo = [-243, "B_AssaultPack_ocamo", 0, 250] call _getBackpack;
TTC_SHOP_ARTICLE_B_Kitbag_rgr = [-244, "B_Kitbag_rgr", 0, 375] call _getBackpack;
TTC_SHOP_ARTICLE_B_Kitbag_mcamo = [-245, "B_Kitbag_mcamo", 0, 375] call _getBackpack;
TTC_SHOP_ARTICLE_B_Kitbag_cbr = [-246, "B_Kitbag_cbr", 0, 375] call _getBackpack;
TTC_SHOP_ARTICLE_B_Carryall_ocamo = [-247, "B_Carryall_ocamo", 0, 450] call _getBackpack;
TTC_SHOP_ARTICLE_B_Carryall_oucamo = [-248, "B_Carryall_oucamo", 0, 450] call _getBackpack;
TTC_SHOP_ARTICLE_B_Carryall_mcamo = [-249, "B_Carryall_mcamo", 0, 450] call _getBackpack;
TTC_SHOP_ARTICLE_B_Carryall_khk = [-250, "B_Carryall_khk", 0, 450] call _getBackpack;
TTC_SHOP_ARTICLE_B_Carryall_cbr = [-251, "B_Carryall_cbr", 0, 450] call _getBackpack;
TTC_SHOP_ARTICLE_B_Parachute = [-252, "B_Parachute", 0, 100] call _getBackpack;
TTC_SHOP_ARTICLE_I_Quadbike_01_F = [-269, "I_Quadbike_01_F", 0, 100] call _getVehicle;
TTC_SHOP_ARTICLE_I_G_Offroad_01_F = [-270, "I_G_Offroad_01_F", 0, 250] call _getVehicle;
TTC_SHOP_ARTICLE_I_G_Offroad_01_armed_F = [-271, "I_G_Offroad_01_armed_F", 0, 400] call _getVehicle;
TTC_SHOP_ARTICLE_I_MRAP_03_F = [-272, "I_MRAP_03_F", 0, 500] call _getVehicle;
TTC_SHOP_ARTICLE_I_MRAP_03_hmg_F = [-273, "I_MRAP_03_hmg_F", 0, 750] call _getVehicle;
TTC_SHOP_ARTICLE_I_MRAP_03_gmg_F = [-274, "I_MRAP_03_gmg_F", 0, 1000] call _getVehicle;
TTC_SHOP_ARTICLE_I_Truck_02_transport_F = [-275, "I_Truck_02_transport_F", 0, 625] call _getVehicle;
TTC_SHOP_ARTICLE_I_Truck_02_covered_F = [-276, "I_Truck_02_covered_F", 0, 625] call _getVehicle;
TTC_SHOP_ARTICLE_I_APC_tracked_03_cannon_F = [-277, "I_APC_tracked_03_cannon_F", 0, 2250] call _getVehicle;
TTC_SHOP_ARTICLE_I_APC_Wheeled_03_cannon_F = [-278, "I_APC_Wheeled_03_cannon_F", 0, 3750] call _getVehicle;
TTC_SHOP_ARTICLE_O_APC_Tracked_02_AA_F = [-280, "O_APC_Tracked_02_AA_F", 0, 3000] call _getVehicle;
TTC_SHOP_ARTICLE_B_Heli_Light_01_F = [-281, "B_Heli_Light_01_F", 0, 750] call _getVehicle;
TTC_SHOP_ARTICLE_I_Heli_light_03_unarmed_F = [-289, "I_Heli_light_03_unarmed_F", 0, 750] call _getVehicle;
TTC_SHOP_ARTICLE_muzzle_snds_338_sand = [-318, "muzzle_snds_338_sand", 0, 405] call _getItem;
TTC_SHOP_ARTICLE_V_BandollierB_rgr = [-319, "V_BandollierB_rgr", 0, 200] call _getVest;
TTC_SHOP_ARTICLE_HandGrenade = [-340, "HandGrenade", 0, 40] call _getMagazine;
TTC_SHOP_ARTICLE_MiniGrenade = [-341, "MiniGrenade", 0, 25] call _getMagazine;
TTC_SHOP_ARTICLE_SmokeShell = [-342, "SmokeShell", 0, 20] call _getMagazine;
TTC_SHOP_ARTICLE_SmokeShellGreen = [-344, "SmokeShellGreen", 0, 30] call _getMagazine;
TTC_SHOP_ARTICLE_SmokeShellPurple = [-346, "SmokeShellPurple", 0, 20] call _getMagazine;
TTC_SHOP_ARTICLE_SmokeShellOrange = [-348, "SmokeShellOrange", 0, 20] call _getMagazine;
TTC_SHOP_ARTICLE_I_IR_Grenade = [-351, "I_IR_Grenade", 0, 20] call _getMagazine;
TTC_SHOP_ARTICLE_Chemlight_green = [-383, "Chemlight_green", 0, 5] call _getMagazine;
TTC_SHOP_ARTICLE_Chemlight_red = [-384, "Chemlight_red", 0, 5] call _getMagazine;
TTC_SHOP_ARTICLE_Chemlight_yellow = [-385, "Chemlight_yellow", 0, 5] call _getMagazine;
TTC_SHOP_ARTICLE_Chemlight_blue = [-386, "Chemlight_blue", 0, 5] call _getMagazine;
TTC_SHOP_ARTICLE_bipod_03_F_blk = [-393, "bipod_03_F_blk", 0, 250] call _getItem;
TTC_SHOP_ARTICLE_bipod_03_F_oli = [-394, "bipod_03_F_oli", 0, 250] call _getItem;


/*
  Article array containing all articles.
  The articles are ordered by id
*/
TTC_SHOP_ARTICLES = [
  TTC_SHOP_ARTICLE_hgun_ACPC2_F,
  TTC_SHOP_ARTICLE_hgun_Rook40_F,
  TTC_SHOP_ARTICLE_hgun_Pistol_heavy_02_F,
  TTC_SHOP_ARTICLE_arifle_MX_SW_F,
  TTC_SHOP_ARTICLE_LMG_Mk200_F,
  TTC_SHOP_ARTICLE_LMG_Zafir_F,
  TTC_SHOP_ARTICLE_MMG_01_hex_F,
  TTC_SHOP_ARTICLE_MMG_01_tan_F,
  TTC_SHOP_ARTICLE_MMG_02_camo_F,
  TTC_SHOP_ARTICLE_MMG_02_black_F,
  TTC_SHOP_ARTICLE_MMG_02_sand_F,
  TTC_SHOP_ARTICLE_16Rnd_9x21_Mag,
  TTC_SHOP_ARTICLE_30Rnd_9x21_Mag,
  TTC_SHOP_ARTICLE_6Rnd_45ACP_Cylinder,
  TTC_SHOP_ARTICLE_9Rnd_45ACP_Mag,
  TTC_SHOP_ARTICLE_100Rnd_65x39_caseless_mag,
  TTC_SHOP_ARTICLE_100Rnd_65x39_caseless_mag_Tracer,
  TTC_SHOP_ARTICLE_200Rnd_65x39_cased_Box,
  TTC_SHOP_ARTICLE_200Rnd_65x39_cased_Box_Tracer,
  TTC_SHOP_ARTICLE_150Rnd_762x54_Box,
  TTC_SHOP_ARTICLE_150Rnd_762x54_Box_Tracer,
  TTC_SHOP_ARTICLE_130Rnd_338_Mag,
  TTC_SHOP_ARTICLE_150Rnd_93x64_Mag,
  TTC_SHOP_ARTICLE_acc_flashlight,
  TTC_SHOP_ARTICLE_acc_pointer_IR,
  TTC_SHOP_ARTICLE_optic_Yorris,
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
  TTC_SHOP_ARTICLE_muzzle_snds_H_SW,
  TTC_SHOP_ARTICLE_muzzle_snds_H_MG,
  TTC_SHOP_ARTICLE_muzzle_snds_338_black,
  TTC_SHOP_ARTICLE_muzzle_snds_338_green,
  TTC_SHOP_ARTICLE_muzzle_snds_93mmg,
  TTC_SHOP_ARTICLE_muzzle_snds_93mmg_tan,
  TTC_SHOP_ARTICLE_Binocular,
  TTC_SHOP_ARTICLE_FirstAidKit,
  TTC_SHOP_ARTICLE_NVGoggles_INDEP,
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
  TTC_SHOP_ARTICLE_V_BandollierB_khk,
  TTC_SHOP_ARTICLE_V_BandollierB_cbr,
  TTC_SHOP_ARTICLE_V_BandollierB_blk,
  TTC_SHOP_ARTICLE_V_BandollierB_oli,
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
  TTC_SHOP_ARTICLE_I_Quadbike_01_F,
  TTC_SHOP_ARTICLE_I_G_Offroad_01_F,
  TTC_SHOP_ARTICLE_I_G_Offroad_01_armed_F,
  TTC_SHOP_ARTICLE_I_MRAP_03_F,
  TTC_SHOP_ARTICLE_I_MRAP_03_hmg_F,
  TTC_SHOP_ARTICLE_I_MRAP_03_gmg_F,
  TTC_SHOP_ARTICLE_I_Truck_02_transport_F,
  TTC_SHOP_ARTICLE_I_Truck_02_covered_F,
  TTC_SHOP_ARTICLE_I_APC_tracked_03_cannon_F,
  TTC_SHOP_ARTICLE_I_APC_Wheeled_03_cannon_F,
  TTC_SHOP_ARTICLE_O_APC_Tracked_02_AA_F,
  TTC_SHOP_ARTICLE_B_Heli_Light_01_F,
  TTC_SHOP_ARTICLE_I_Heli_light_03_unarmed_F,
  TTC_SHOP_ARTICLE_muzzle_snds_338_sand,
  TTC_SHOP_ARTICLE_V_BandollierB_rgr,
  TTC_SHOP_ARTICLE_HandGrenade,
  TTC_SHOP_ARTICLE_MiniGrenade,
  TTC_SHOP_ARTICLE_SmokeShell,
  TTC_SHOP_ARTICLE_SmokeShellGreen,
  TTC_SHOP_ARTICLE_SmokeShellPurple,
  TTC_SHOP_ARTICLE_SmokeShellOrange,
  TTC_SHOP_ARTICLE_I_IR_Grenade,
  TTC_SHOP_ARTICLE_Chemlight_green,
  TTC_SHOP_ARTICLE_Chemlight_red,
  TTC_SHOP_ARTICLE_Chemlight_yellow,
  TTC_SHOP_ARTICLE_Chemlight_blue,
  TTC_SHOP_ARTICLE_bipod_03_F_blk,
  TTC_SHOP_ARTICLE_bipod_03_F_oli
];


TTC_SHOP_RIFLES = [
	TTC_SHOP_ARTICLE_arifle_MX_SW_F,
	TTC_SHOP_ARTICLE_LMG_Mk200_F,
	TTC_SHOP_ARTICLE_LMG_Zafir_F,
	TTC_SHOP_ARTICLE_MMG_01_hex_F,
	TTC_SHOP_ARTICLE_MMG_01_tan_F,
	TTC_SHOP_ARTICLE_MMG_02_camo_F,
	TTC_SHOP_ARTICLE_MMG_02_black_F,
	TTC_SHOP_ARTICLE_MMG_02_sand_F
];

TTC_SHOP_HANDGUNS = [
	TTC_SHOP_ARTICLE_hgun_ACPC2_F,
	TTC_SHOP_ARTICLE_hgun_Rook40_F,
	TTC_SHOP_ARTICLE_hgun_Pistol_heavy_02_F
];

TTC_SHOP_SCOPES = [
	TTC_SHOP_ARTICLE_optic_Yorris,
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
	TTC_SHOP_ARTICLE_optic_DMS
];

TTC_SHOP_ATTACHMENTS = [
	TTC_SHOP_ARTICLE_acc_flashlight,
	TTC_SHOP_ARTICLE_acc_pointer_IR,
	TTC_SHOP_ARTICLE_muzzle_snds_L,
	TTC_SHOP_ARTICLE_muzzle_snds_acp,
	TTC_SHOP_ARTICLE_muzzle_snds_H_SW,
	TTC_SHOP_ARTICLE_muzzle_snds_H_MG,
	TTC_SHOP_ARTICLE_muzzle_snds_338_black,
	TTC_SHOP_ARTICLE_muzzle_snds_338_green,
	TTC_SHOP_ARTICLE_muzzle_snds_93mmg,
	TTC_SHOP_ARTICLE_muzzle_snds_93mmg_tan,
	TTC_SHOP_ARTICLE_muzzle_snds_338_sand,
	TTC_SHOP_ARTICLE_bipod_03_F_blk,
	TTC_SHOP_ARTICLE_bipod_03_F_oli
];

TTC_SHOP_AMMUNITION = [
	TTC_SHOP_ARTICLE_16Rnd_9x21_Mag,
	TTC_SHOP_ARTICLE_30Rnd_9x21_Mag,
	TTC_SHOP_ARTICLE_6Rnd_45ACP_Cylinder,
	TTC_SHOP_ARTICLE_9Rnd_45ACP_Mag,
	TTC_SHOP_ARTICLE_100Rnd_65x39_caseless_mag,
	TTC_SHOP_ARTICLE_100Rnd_65x39_caseless_mag_Tracer,
	TTC_SHOP_ARTICLE_200Rnd_65x39_cased_Box,
	TTC_SHOP_ARTICLE_200Rnd_65x39_cased_Box_Tracer,
	TTC_SHOP_ARTICLE_150Rnd_762x54_Box,
	TTC_SHOP_ARTICLE_150Rnd_762x54_Box_Tracer,
	TTC_SHOP_ARTICLE_130Rnd_338_Mag,
	TTC_SHOP_ARTICLE_150Rnd_93x64_Mag
];

TTC_SHOP_GRENADES = [
	TTC_SHOP_ARTICLE_HandGrenade,
	TTC_SHOP_ARTICLE_MiniGrenade,
	TTC_SHOP_ARTICLE_SmokeShell,
	TTC_SHOP_ARTICLE_SmokeShellGreen,
	TTC_SHOP_ARTICLE_SmokeShellPurple,
	TTC_SHOP_ARTICLE_SmokeShellOrange,
	TTC_SHOP_ARTICLE_I_IR_Grenade,
	TTC_SHOP_ARTICLE_Chemlight_green,
	TTC_SHOP_ARTICLE_Chemlight_red,
	TTC_SHOP_ARTICLE_Chemlight_yellow,
	TTC_SHOP_ARTICLE_Chemlight_blue
];

TTC_SHOP_ITEMS = [
	TTC_SHOP_ARTICLE_Binocular,
	TTC_SHOP_ARTICLE_FirstAidKit,
	TTC_SHOP_ARTICLE_NVGoggles_INDEP
];

TTC_SHOP_FACEWEAR = [
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
	TTC_SHOP_ARTICLE_G_Balaclava_oli
];

TTC_SHOP_VESTS = [
	TTC_SHOP_ARTICLE_V_BandollierB_khk,
	TTC_SHOP_ARTICLE_V_BandollierB_cbr,
	TTC_SHOP_ARTICLE_V_BandollierB_blk,
	TTC_SHOP_ARTICLE_V_BandollierB_oli,
	TTC_SHOP_ARTICLE_V_BandollierB_rgr
];

TTC_SHOP_BACKPACKS = [
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
	TTC_SHOP_ARTICLE_B_Parachute
];

TTC_SHOP_VEHICLES = [
	TTC_SHOP_ARTICLE_I_Quadbike_01_F,
	TTC_SHOP_ARTICLE_I_G_Offroad_01_F,
	TTC_SHOP_ARTICLE_I_G_Offroad_01_armed_F,
	TTC_SHOP_ARTICLE_I_MRAP_03_F,
	TTC_SHOP_ARTICLE_I_MRAP_03_hmg_F,
	TTC_SHOP_ARTICLE_I_MRAP_03_gmg_F,
	TTC_SHOP_ARTICLE_I_Truck_02_transport_F,
	TTC_SHOP_ARTICLE_I_Truck_02_covered_F,
	TTC_SHOP_ARTICLE_I_APC_tracked_03_cannon_F,
	TTC_SHOP_ARTICLE_I_APC_Wheeled_03_cannon_F,
	TTC_SHOP_ARTICLE_O_APC_Tracked_02_AA_F
];

TTC_SHOP_HELICOPTERS = [
	TTC_SHOP_ARTICLE_B_Heli_Light_01_F,
	TTC_SHOP_ARTICLE_I_Heli_light_03_unarmed_F
];



/*
	Array containing all categories
	Must be sorted. The order is used in the category list
*/
TTC_SHOP_CATEGORIES = [
  [1, "Rifles", "\A3\ui_f\data\gui\Rsc\RscDisplayArsenal\primaryweapon_ca.paa", TTC_SHOP_RIFLES],
  [2, "Handguns", "\A3\ui_f\data\gui\Rsc\RscDisplayArsenal\handgun_ca.paa", TTC_SHOP_HANDGUNS],
  [4, "Scopes", "\A3\ui_f\data\gui\Rsc\RscDisplayArsenal\itemoptic_ca.paa", TTC_SHOP_SCOPES],
  [5, "Attachments", "\A3\ui_f\data\gui\Rsc\RscDisplayArsenal\itemmuzzle_ca.paa", TTC_SHOP_ATTACHMENTS],
  [7, "Ammunition", "\A3\ui_f\data\gui\Rsc\RscDisplayArsenal\cargomag_ca.paa", TTC_SHOP_AMMUNITION],
  [75, "Grenades", "$category.icon", TTC_SHOP_GRENADES],
  [9, "Items", "\A3\ui_f\data\gui\Rsc\RscDisplayArsenal\cargomisc_ca.paa", TTC_SHOP_ITEMS],
  [11, "Facewear", "\A3\ui_f\data\gui\Rsc\RscDisplayArsenal\goggles_ca.paa", TTC_SHOP_FACEWEAR],
  [13, "Vests", "\A3\ui_f\data\gui\Rsc\RscDisplayArsenal\vest_ca.paa", TTC_SHOP_VESTS],
  [14, "Backpacks", "\A3\ui_f\data\gui\Rsc\RscDisplayArsenal\backpack_ca.paa", TTC_SHOP_BACKPACKS],
  [15, "Vehicles", "SOS\TTC\Shop\Icons\vehicle.paa", TTC_SHOP_VEHICLES],
  [16, "Helicopters", "SOS\TTC\Shop\Icons\helicopter.paa", TTC_SHOP_HELICOPTERS]
];
