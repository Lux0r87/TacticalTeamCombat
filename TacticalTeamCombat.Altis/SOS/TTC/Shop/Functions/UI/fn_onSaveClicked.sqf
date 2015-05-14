/*
	This script is called when the player clicks on the shopping cart save button.

    Created by BauerMitFackel
*/

_shoppingCart = [] call TTC_SHOP_fnc_getShoppingCart;
_shoppingCartCopy = + _shoppingCart;
TTC_SHOP_shoppingCarts set [1, _shoppingCartCopy];

systemChat "Shopping cart saved";
