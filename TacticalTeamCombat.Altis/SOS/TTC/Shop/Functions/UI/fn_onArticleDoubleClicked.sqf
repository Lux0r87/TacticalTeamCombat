/*
	This script is called when the player double clicks on a article in the article list.
	
	Parameter(s):
		0: CONTROL	- the article list display control
		1: NUMBER	- the index of the selected article
	
    Created by BauerMitFackel
*/

disableSerialization;

private ["_control","_index","_id","_shoppingCart"];

_control	= [_this, 0] call BIS_fnc_param;
_index		= [_this, 1] call BIS_fnc_param;

if (_index >= 0) then {
	_id = _control lnbValue [_index, 0];
	_shoppingCart = [] call TTC_SHOP_fnc_getShoppingCart;
	_shoppingCart = [_shoppingCart, _id] call TTC_SHOP_fnc_addArticleToShoppingCart;
	_shoppingCart call TTC_SHOP_UI_fnc_updateShoppingCart;
};
