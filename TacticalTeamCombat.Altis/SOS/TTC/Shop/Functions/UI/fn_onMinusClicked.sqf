/*
	This script is called when the player clicks on the shopping cart minus button.

    Created by BauerMitFackel
*/

disableSerialization;

private ["_control","_index","_articleId","_article","_shoppingCart"];

_control	= uiNamespace getVariable ["TTC_SHOP_UI_shoppingCart_articleList", nil];
_index		= lnbCurSelRow _control;
_articleId	= _control lnbValue [_index, 0];
_article	= _articleId call TTC_SHOP_fnc_getArticleById;
_shoppingCart = _article call TTC_SHOP_fnc_removeArticleFromShoppingCart;
_shoppingCart call TTC_SHOP_UI_fnc_updateShoppingCart;
