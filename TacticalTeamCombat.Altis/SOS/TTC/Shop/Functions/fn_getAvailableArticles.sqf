/*
	Returns the available articles from the given shopping cart, according to the shop location.

    Created by Lux0r
*/

private ["_shoppingCart","_entries","_article"];

_shoppingCart = [_this, 0] call BIS_fnc_param;


{
	_entries = _x select 1;
	// Iterate over all article entries from the category.
	{
		_article = _x select 0;

		// Remove articles from the shopping cart, if it's not available at the location.
		if !([_article] call TTC_SHOP_fnc_isArticleAvailable) then {
			_entries deleteAt _forEachIndex;
		};
	} forEach _entries;
} forEach _shoppingCart;

//TTC_SHOP_shoppingCarts set [0, _shoppingCart];
_shoppingCart;
