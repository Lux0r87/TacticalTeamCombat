/*
	Creates the shop dialog.
	
    Created by BauerMitFackel
*/

disableSerialization;

private["_arguments","_dialog","_ctrl","_categories","_shoppingCart"];

_arguments = [_this, 3, []] call BIS_fnc_param;
TTC_SHOP_location = [_arguments, 0, TTC_SHOP_LOCATION_BASE, [0]] call BIS_fnc_param;


// Create the dialog
_dialog = createDialog "TTC_SHOP_ShopDialog";

//
_ctrl = uiNamespace getVariable ["TTC_SHOP_UI_articleDescription", nil];
uiNamespace setVariable ["TTC_SHOP_UI_articleDescription_position", ctrlPosition _ctrl];


// Setup category list
_categories = [] call TTC_SHOP_fnc_getCategories;
_categories call TTC_SHOP_UI_fnc_updateCategoryList;

// Setup shopping cart
_shoppingCart = [] call TTC_SHOP_fnc_getShoppingCart;
_shoppingCart call TTC_SHOP_UI_fnc_updateShoppingCart;