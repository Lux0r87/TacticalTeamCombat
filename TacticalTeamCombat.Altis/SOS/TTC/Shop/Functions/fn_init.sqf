/*
	Initializes the Tactical Team Combat shop.
	
    Created by BauerMitFackel
*/

[] call compile preprocessFileLineNumbers "SOS\TTC\Shop\Configurations\articles.sqf";
[] call compile preprocessFileLineNumbers "SOS\TTC\Shop\Configurations\West\platoonLeader.sqf";
[] call compile preprocessFileLineNumbers "SOS\TTC\Shop\Configurations\categories.sqf";

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


//////////


[] call _initializeShoppingCart;
