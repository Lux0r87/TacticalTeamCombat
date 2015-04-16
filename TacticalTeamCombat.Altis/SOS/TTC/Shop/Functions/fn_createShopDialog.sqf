/*
    Created by BauerMitFackel
*/

disableSerialization;
_CATEGORY_LIST_IDC = 51001;

_dialog = createDialog "TTC_SHOP_ShopDialog";
TTC_SHOP_categories call TTC_SHOP_fnc_setCategories;
lnbSetCurSelRow [_CATEGORY_LIST_IDC, 0];
