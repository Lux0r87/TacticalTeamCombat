/*
    Created by BauerMitFackel and Lux0r
*/


/*
	Initializes the shopping cart.
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


// Client-side:
if (hasInterface) then {
	
	systemChat "Initializing TTC Shop";
	
	waitUntil {!(IsNull player) && (time > 0.0)};
	
	_side		= side player;
	_roleId		= player getVariable "TTC_roleId";
	_roleName	= _roleId call TTC_CORE_fnc_getRoleNameById;
	
	[] call compile preprocessFileLineNumbers "SOS\TTC\Shop\Database\articles.sqf";
	[] call compile preprocessFileLineNumbers "SOS\TTC\Shop\Database\West\Combat Engineer.sqf";
	[] call compile preprocessFileLineNumbers "SOS\TTC\Shop\Database\categories.sqf";
	[] call _initializeShoppingCart;

	systemChat "TTC Shop initialized";
};
