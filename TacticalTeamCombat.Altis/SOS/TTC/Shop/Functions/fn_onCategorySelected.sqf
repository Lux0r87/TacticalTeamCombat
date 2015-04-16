/*
	This script is called when the player selects a category from the category list.
	Params: [_control, _index]
	
    Created by BauerMitFackel
*/

disableSerialization;

_control	= [_this, 0] call BIS_fnc_param;
_index		= [_this, 1] call BIS_fnc_param;

if (_index >= 0) then {

	_categoryId	= _control lnbValue [_index, 0];
	_articles = _categoryId call TTC_SHOP_fnc_getArticlesByCategoryId;
	_articles call TTC_SHOP_fnc_setArticles;
	
} else {
	
	diag_log format["DEBUG (TTC_SHOP_fnc_onCategorySelected): Invalid _index %1", _index];
	[] call TTC_SHOP_fnc_setArticles;
};

