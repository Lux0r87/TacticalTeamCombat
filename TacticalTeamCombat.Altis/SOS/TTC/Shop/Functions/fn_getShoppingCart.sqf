/*
	Returns the shopping cart.
	
    Created by BauerMitFackel
*/

private ["_index","_shoppingCart"];

_index = [_this, 0, 0] call BIS_fnc_param;

// Get the shopping cart.
_shoppingCart = TTC_SHOP_shoppingCarts select _index;
_shoppingCart;
