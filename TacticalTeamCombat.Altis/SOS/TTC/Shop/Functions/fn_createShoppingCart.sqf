/*
	Clears the shopping cart.
	
    Created by BauerMitFackel
*/

private ["_shoppingCart","_categories","_categoryId"];

_shoppingCart	= [];
_categories		= [] call TTC_SHOP_fnc_getCategories;

{
	_categoryId = _x select TTC_SHOP_CATEGORY_id;
	_shoppingCart pushBack [_categoryId, []];
} forEach _categories;

_shoppingCart;
