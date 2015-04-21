/*
	Creates the shop dialog.
	
    Created by BauerMitFackel
*/

disableSerialization;

// Create the dialog
_dialog = createDialog "TTC_SHOP_ShopDialog";

// Setup category list
_categories = [] call TTC_SHOP_fnc_getCategories;
_categories call TTC_SHOP_UI_fnc_updateCategoryList;
