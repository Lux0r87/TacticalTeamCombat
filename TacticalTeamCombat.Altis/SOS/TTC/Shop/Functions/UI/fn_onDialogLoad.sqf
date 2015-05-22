/*
    Created by BauerMitFackel
*/

disableSerialization;

private["_dialog"];

_dialog = [_this, 0] call BIS_fnc_param;

uiNamespace setVariable ["TTC_SHOP_UI_dialog", 								_dialog];
uiNamespace setVariable ["TTC_SHOP_UI_categoryList_header", 				_dialog displayCtrl 51001];
uiNamespace setVariable ["TTC_SHOP_UI_categoryList_background", 			_dialog displayCtrl 51002];
uiNamespace setVariable ["TTC_SHOP_UI_categoryList", 						_dialog displayCtrl 51003];
uiNamespace setVariable ["TTC_SHOP_UI_articleList_header", 					_dialog displayCtrl 52001];
uiNamespace setVariable ["TTC_SHOP_UI_articleList_background", 				_dialog displayCtrl 52002];
uiNamespace setVariable ["TTC_SHOP_UI_articleList", 						_dialog displayCtrl 52003];
uiNamespace setVariable ["TTC_SHOP_UI_articlePicture_background", 			_dialog displayCtrl 52004];
uiNamespace setVariable ["TTC_SHOP_UI_articlePicture", 						_dialog displayCtrl 52005];
uiNamespace setVariable ["TTC_SHOP_UI_articleDescription_container",		_dialog displayCtrl 52100];
uiNamespace setVariable ["TTC_SHOP_UI_articleDescription", 					_dialog displayCtrl 52101];
uiNamespace setVariable ["TTC_SHOP_UI_shoppingCart_header", 				_dialog displayCtrl 53001];
uiNamespace setVariable ["TTC_SHOP_UI_shoppingCart_save", 					_dialog displayCtrl 53002];
uiNamespace setVariable ["TTC_SHOP_UI_shoppingCart_load", 					_dialog displayCtrl 53003];
uiNamespace setVariable ["TTC_SHOP_UI_shoppingCart_clear", 					_dialog displayCtrl 53004];
uiNamespace setVariable ["TTC_SHOP_UI_shoppingCart_articleList_background", _dialog displayCtrl 53005];
uiNamespace setVariable ["TTC_SHOP_UI_shoppingCart_articleList_minus", 		_dialog displayCtrl 53006];
uiNamespace setVariable ["TTC_SHOP_UI_shoppingCart_articleList_plus", 		_dialog displayCtrl 53007];
uiNamespace setVariable ["TTC_SHOP_UI_shoppingCart_articleList", 			_dialog displayCtrl 53008];
uiNamespace setVariable ["TTC_SHOP_UI_shoppingCart_costs", 					_dialog displayCtrl 53009];
uiNamespace setVariable ["TTC_SHOP_UI_close", 								_dialog displayCtrl 53010];
uiNamespace setVariable ["TTC_SHOP_UI_buy", 								_dialog displayCtrl 53011];
