/*
	Creates the shop dialog.
	
    Created by BauerMitFackel
*/

disableSerialization;

// Create the dialog
_dialog = createDialog "TTC_SHOP_ShopDialog";

//
_ctrl = uiNamespace getVariable ["TTC_SHOP_UI_articleDescription", nil];
uiNamespace setVariable ["TTC_SHOP_UI_articleDescription_position", ctrlPosition _ctrl];


// Setup category list
_categories = [] call TTC_SHOP_fnc_getCategories;
_categories call TTC_SHOP_UI_fnc_updateCategoryList;

