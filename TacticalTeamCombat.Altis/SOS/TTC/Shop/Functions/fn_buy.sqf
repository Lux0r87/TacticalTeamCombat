/*
	Buys all articles from the shopping cart.
	
    Created by BauerMitFackel
*/


_CATEGORY_ID_AMMUNITION = 7;
_CATEGORY_ID_ATTACHMENTS = 5;
_CATEGORY_ID_BACKPACKS = 14;
_CATEGORY_ID_BOATS = 19;
_CATEGORY_ID_EXPLOSIVES = 8;
_CATEGORY_ID_FACEWEAR = 11;
_CATEGORY_ID_HANDGUNS = 2;
_CATEGORY_ID_HEADWEAR = 10;
_CATEGORY_ID_HELICOPTERS = 16;
_CATEGORY_ID_ITEMS = 9;
_CATEGORY_ID_JETS = 20;
_CATEGORY_ID_LAUNCHERS = 3;
_CATEGORY_ID_RIFLES = 1;
_CATEGORY_ID_SCOPES = 4;
_CATEGORY_ID_UAVS = 18;
_CATEGORY_ID_UGVS = 17;
_CATEGORY_ID_UNIFORMS = 12;
_CATEGORY_ID_VEHICLES = 15;
_CATEGORY_ID_VESTS = 13;


/*
	Returns the index of the category with the given id.
	Parameter(s):
		0: ARRAY	- shopping cart
		1: NUMBER	- category id
	Returns:
		NUMBER - the category index
*/
_getCategoryIndex = {
	
	private["_shoppingCart", "_categoryId", "_categoryIndex", "_index"];
	
	_shoppingCart = [_this, 0] call BIS_fnc_param;
	_categoryId = [_this, 1] call BIS_fnc_param;
	
	_categoryIndex = -1;
	_index = 0;
	
	{
		if ((_x select 0) == _categoryId) exitWith {
			_categoryIndex = _index;
		};
		_index = _index + 1;
	} forEach _shoppingCart;
	
	_categoryIndex;
};

_getArticleNames = {
	
	private["_shoppingCart", "_categoryId", "_categoryIndex", "_backpackEntry"];
	
	_shoppingCart = [_this, 0] call BIS_fnc_param;
	_categoryId = [_this, 1] call BIS_fnc_param;
	
	_articleNames = [];
	
	_categoryIndex = [_shoppingCart, _categoryId] call _getCategoryIndex;
	if (_categoryIndex != -1) then {
		// format [Article[], amount]
		_entries = (_shoppingCart select _categoryIndex) select 1;
		{
			_article = _x select 0;
			_amount = _x select 1;
			_name = _article select TTC_SHOP_ARTICLE_name;
			
			for "_x" from 1 to _amount do {
				_articleNames pushBack _name;
			};
			
		} forEach _entries;
	};
	
	_articleNames;
};


_buyBackpacks = {

	_articleNames = [_shoppingCart, _CATEGORY_ID_BACKPACKS] call _getArticleNames;
	
	{
		player addBackpackGlobal _x;
	} forEach _articleNames;
};

_buyVests = {
	
	_articleNames = [_shoppingCart, _CATEGORY_ID_VESTS] call _getArticleNames;
	
	{
		player addVest _x;
	} forEach _articleNames;
};

_buyUniforms = {
	
	_articleNames = [_shoppingCart, _CATEGORY_ID_UNIFORMS] call _getArticleNames;
	
	{
		player addUniform _x;
	} forEach _articleNames;
};

_buyRifles = {
	
	_articleNames = [_shoppingCart, _CATEGORY_ID_RIFLES] call _getArticleNames;
	
	{
		player addWeaponGlobal _x;
	} forEach _articleNames;
};

_buyHandguns = {
	
	_articleNames = [_shoppingCart, _CATEGORY_ID_HANDGUNS] call _getArticleNames;
	
	{
		player addWeaponGlobal _x;
	} forEach _articleNames;
};

_buyLaunchers = {
	
	_articleNames = [_shoppingCart, _CATEGORY_ID_LAUNCHERS] call _getArticleNames;
	
	{
		player addWeaponGlobal _x;
	} forEach _articleNames;
};

_buyAmmunition = {
	
	_articleNames = [_shoppingCart, _CATEGORY_ID_AMMUNITION] call _getArticleNames;
	
	{
		player addMagazineGlobal _x;
	} forEach _articleNames;
};


//////////


_shoppingCart = [] call TTC_SHOP_fnc_getShoppingCart;

[] call _buyBackpacks;
[] call _buyVests;
[] call _buyUniforms;
[] call _buyRifles;
[] call _buyHandguns;
[] call _buyLaunchers;
[] call _buyAmmunition;

