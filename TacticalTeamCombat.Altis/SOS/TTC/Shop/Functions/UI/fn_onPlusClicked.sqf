/*
	This script is called when the player clicks on the shopping cart plus button.

    Created by BauerMitFackel
*/

disableSerialization;

private ["_control","_index","_articleId","_article","_shoppingCart"];

_control = uiNamespace getVariable ["TTC_SHOP_UI_shoppingCart_articleList", nil];
_index = lnbCurSelRow _control;
_articleId = _control lnbValue [_index, 0];
_article = _articleId call TTC_SHOP_fnc_getArticleById;
_shoppingCart = [] call TTC_SHOP_fnc_getShoppingCart;
_shoppingCart = [_shoppingCart, _article] call TTC_SHOP_fnc_addArticleToShoppingCart;
_shoppingCart call TTC_SHOP_UI_fnc_updateShoppingCart;
