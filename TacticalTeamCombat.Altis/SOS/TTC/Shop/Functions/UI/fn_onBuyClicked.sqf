/*
	This script is called when the player clicks on the buy button.

    Created by BauerMitFackel
*/

[] call TTC_SHOP_fnc_buy;

_shoppingCart = [] call TTC_SHOP_fnc_createShoppingCart;
TTC_SHOP_shoppingCarts set [0, _shoppingCart];

closeDialog 1;
