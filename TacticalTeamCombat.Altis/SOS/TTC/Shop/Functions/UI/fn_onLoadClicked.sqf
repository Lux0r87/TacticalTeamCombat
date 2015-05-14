/*
	This script is called when the player clicks on the shopping cart load button.

    Created by BauerMitFackel
*/


if ((count TTC_SHOP_shoppingCarts) > 1) then {

	_shoppingCart = [1] call TTC_SHOP_fnc_getShoppingCart;
	_shoppingCartCopy = + _shoppingCart;
	TTC_SHOP_shoppingCarts set [0, _shoppingCartCopy];
	[] call TTC_SHOP_UI_fnc_updateShoppingCart;
	
} else {
	systemChat "No saved shopping cart";
};


