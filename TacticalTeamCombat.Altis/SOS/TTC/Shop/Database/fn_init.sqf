/*
    Created by BauerMitFackel and Lux0r
*/


/*
	Initializes the shop database.
*/
_initializeDatabase = {
	
	diag_log "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX > _initializeDatabase";
	
	waitUntil {!(IsNull player) && (time > 0.0)};
	
	_side		= side player;
	_roleId		= player getVariable "TTC_roleId";
	_roleName	= _roleId call TTC_CORE_fnc_getRoleNameById;
	
	[] call compile preprocessFileLineNumbers format["SOS\TTC\Shop\Database\%1\%2.sqf", _side, _roleName];
};


/*
	Initializes the shopping cart.
*/
_initializeShoppingCart = {
		
	diag_log "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX > _initializeShoppingCart";
		
	_shoppingCart = [];
	_categories = [] call TTC_SHOP_fnc_getCategories;
	
	{
		_categoryId = _x select TTC_SHOP_CATEGORY_id;
		_shoppingCart pushBack [_categoryId, []];
	} forEach _categories;
	
	TTC_SHOP_shoppingCart = _shoppingCart;
};

diag_log "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX > Initialize shop database";

// Client-side:
if (hasInterface) then {
	[] call _initializeDatabase;
	[] call _initializeShoppingCart;
};
