/*
	Returns whether the player can buy the articles from the shopping cart or not.
	
    Created by BauerMitFackel
*/


private ["_shoppingCartCosts", "_balance", "_canBuy"];


_shoppingCart = [_this, 0] call BIS_fnc_param;
_shoppingCartCosts = _shoppingCart call TTC_SHOP_fnc_getShoppingCartCosts;
_balance = TTC_BTC_balance;

_canBuy = _shoppingCartCosts <= _balance;
_canBuy;
