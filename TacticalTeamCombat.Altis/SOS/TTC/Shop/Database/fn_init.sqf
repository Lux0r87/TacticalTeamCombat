/*
    Created by BauerMitFackel and Lux0r
*/


/*
	Initializes the shop database.
*/
_initializeDatabase = {
		
	waitUntil {!(IsNull player) && (time > 0.0)};
	
	_side		= side player;
	_roleId		= player getVariable "TTC_roleId";
	_roleName	= _roleId call TTC_CORE_fnc_getRoleNameById;
	
	[] call compile preprocessFileLineNumbers format["SOS\TTC\Shop\Database\%1\%2.sqf", _side, _roleName];
};


/*
	Initializes the shopping cart.
	Deprecated
*/
_initializeShoppingCart = {
				
	_shoppingCart = [];
	_categories = [] call TTC_SHOP_fnc_getCategories;
	
	{
		_categoryId = _x select TTC_SHOP_CATEGORY_id;
		_shoppingCart pushBack [_categoryId, []];
	} forEach _categories;
	
	TTC_SHOP_shoppingCart = _shoppingCart;
};


/*
	Initializes the shopping cart array and adds a empty shopping cart at index 0.
*/
_initializeShoppingCarts = {
				
	_shoppingCart = [];
	_categories = [] call TTC_SHOP_fnc_getCategories;
	
	{
		_categoryId = _x select TTC_SHOP_CATEGORY_id;
		_shoppingCart pushBack [_categoryId, []];
	} forEach _categories;
	
	TTC_SHOP_shoppingCarts = [_shoppingCart];
};


// Client-side:
if (hasInterface) then {
	[] call _initializeDatabase;
	[] call _initializeShoppingCarts;
};
