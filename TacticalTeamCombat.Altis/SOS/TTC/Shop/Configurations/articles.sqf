/*
    Created by BauerMitFackel
*/


_getWeapon = {

	private["_name", "_price", "_displayName", "_descriptionShort", "_picture", "_data"];

	_id						= [_this, 0] call BIS_fnc_param;
	_name					= [_this, 1] call BIS_fnc_param;
	_price					= [_this, 2] call BIS_fnc_param;
	_displayName			= getText(configFile >> "CfgWeapons" >> _name >> "displayName");
	_descriptionShort		= getText(configFile >> "CfgWeapons" >> _name >> "descriptionShort");
	_picture				= getText(configFile >> "CfgWeapons" >> _name >> "picture");
	
	_data = [_id, _name, _price, _displayName, _descriptionShort, _picture];
	_data;
};


_getMagazine = {

	private["_name", "_price", "_displayName", "_descriptionShort", "_picture", "_data"];

	_id						= [_this, 0] call BIS_fnc_param;
	_name					= [_this, 1] call BIS_fnc_param;
	_price					= [_this, 2] call BIS_fnc_param;
	_displayName			= getText(configFile >> "CfgMagazines" >> _name >> "displayName");
	_descriptionShort		= getText(configFile >> "CfgMagazines" >> _name >> "descriptionShort");
	_picture				= getText(configFile >> "CfgMagazines" >> _name >> "picture");
	
	_data = [_id, _name, _price, _displayName, _descriptionShort, _picture];
	_data;
};


/*
	WEAPONS
*/
TTC_SHOP_ARTICLE_arifle_TRG21_GL_F		= [1001, "arifle_TRG21_GL_F",	1000] call _getWeapon;
TTC_SHOP_ARTICLE_hgun_PDW2000_F			= [1002, "hgun_PDW2000_F",		1000] call _getWeapon;
TTC_SHOP_ARTICLE_SMG_02_F				= [1003, "SMG_02_F",			 750] call _getWeapon;
TTC_SHOP_ARTICLE_hgun_Rook40_F			= [1004, "hgun_Rook40_F",		 500] call _getWeapon;
TTC_SHOP_ARTICLE_hgun_ACPC2_F			= [1005, "hgun_ACPC2_F",		 500] call _getWeapon;

/*
	MAGAZINES
*/
TTC_SHOP_ARTICLE_16Rnd_9x21_Mag			= [2001, "16Rnd_9x21_Mag",		  75] call _getMagazine;
TTC_SHOP_ARTICLE_30Rnd_9x21_Mag			= [2002, "30Rnd_9x21_Mag",		 100] call _getMagazine;
TTC_SHOP_ARTICLE_6Rnd_45ACP_Cylinder	= [2003, "6Rnd_45ACP_Cylinder",	  75] call _getMagazine;
TTC_SHOP_ARTICLE_9Rnd_45ACP_Mag			= [2004, "9Rnd_45ACP_Mag",		  75] call _getMagazine;


/*
	Array containing all articles
*/
TTC_SHOP_articles = [
	
	// Weapons
	TTC_SHOP_ARTICLE_arifle_TRG21_GL_F,
	TTC_SHOP_ARTICLE_hgun_PDW2000_F,
	TTC_SHOP_ARTICLE_SMG_02_F,
	TTC_SHOP_ARTICLE_hgun_Rook40_F,
	TTC_SHOP_ARTICLE_hgun_ACPC2_F,
	
	// Magazines
	TTC_SHOP_ARTICLE_16Rnd_9x21_Mag,
	TTC_SHOP_ARTICLE_30Rnd_9x21_Mag,
	TTC_SHOP_ARTICLE_6Rnd_45ACP_Cylinder,
	TTC_SHOP_ARTICLE_9Rnd_45ACP_Mag
];