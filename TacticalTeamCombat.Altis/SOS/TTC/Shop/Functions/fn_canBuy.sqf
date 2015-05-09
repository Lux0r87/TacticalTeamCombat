/*
	Returns whether the player can buy the articles from the shopping cart or not.
	
    Created by BauerMitFackel
*/

_shoppingCartCosts = [] call TTC_SHOP_fnc_getShoppingCartCosts;
_balance = TTC_BTC_balance;

_canBuy = _shoppingCartCosts <= _balance;
_canBuy;
