/*
	Returns the shopping cart.
	
    Created by BauerMitFackel
*/

private ["_index","_savedShoppingCart","_shoppingCart","_article","_amount"];

_index = [_this, 0, 0] call BIS_fnc_param;

// Get the saved shopping cart.
_savedShoppingCart	= TTC_SHOP_shoppingCarts select _index;

// Create a new shopping cart.
_shoppingCart		= [] call TTC_SHOP_fnc_createShoppingCart;

// Add all articles to the new shopping cart, that are available at the location.
{
	// Iterate over all article entries from the category.
	{
		_article	= _x select 0;
		_amount		= _x select 1;

		if ([_article] call TTC_SHOP_fnc_isArticleAvailable) then {
			((_shoppingCart select _categoryIndex) select 1) pushBack _x;
			[_article, _shoppingCart, _amount] call TTC_SHOP_fnc_addArticleToShoppingCart;
		};
	} forEach (_x select 1);
} forEach _savedShoppingCart;

_shoppingCart;
