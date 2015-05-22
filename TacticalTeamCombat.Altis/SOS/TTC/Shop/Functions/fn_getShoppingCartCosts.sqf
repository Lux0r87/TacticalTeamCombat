/*
	Returns the shopping cart costs.
	
    Created by BauerMitFackel
*/

private["_shoppingCart","_costs","_articleEntries","_article","_amount","_price"];
_shoppingCart = [] call TTC_SHOP_fnc_getShoppingCart;
_costs = 0;

{
	_articleEntries = _x select 1;
	{
		_article = _x select 0;
		_amount = _x select 1;
		_price = _article select TTC_SHOP_ARTICLE_price;
		
		_costs = _costs + (_price * _amount);
		
	} forEach _articleEntries;
} forEach _shoppingCart;

_costs;
