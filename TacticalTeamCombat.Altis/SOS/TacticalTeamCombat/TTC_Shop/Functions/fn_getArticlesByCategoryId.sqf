/*
    Created by BauerMitFackel
*/


_id = _this;
_category = nil;

{
	if ((_x select 0) == _id) exitWith {
		_category = _x;
		diag_log format["DEBUG (TTC_SHOP_fnc_getArticlesByCategoryId): Category %1 found", _category];
	};

} forEach TTC_SHOP_categories;

_articles = nil;
if (isNil {_category}) then {
	diag_log format["ERROR (TTC_SHOP_fnc_getArticlesByCategoryId): Unknown category id %1", _id];
} else {
	_articles = _category select 2;
};

_articles;
