/*
	This script is called when the player clicks on the shopping cart clear button.

    Created by BauerMitFackel
*/


private["_shoppingCart"];

_shoppingCart = [] call TTC_SHOP_fnc_createShoppingCart;
TTC_SHOP_shoppingCarts set [0, _shoppingCart];

[] call TTC_SHOP_UI_fnc_updateShoppingCart;
