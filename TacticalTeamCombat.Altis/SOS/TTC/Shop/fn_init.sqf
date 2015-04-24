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

	_addArticlesForRole = [] spawn TTC_SHOP_fnc_addArticlesForRole;

	waitUntil {
		scriptDone _addArticlesForRole;
	};

	[] call compile preprocessFileLineNumbers "SOS\TTC\Shop\Configurations\categories.sqf";

	[] call _initializeShoppingCart;

	systemChat "TTC Shop initialized";
};
