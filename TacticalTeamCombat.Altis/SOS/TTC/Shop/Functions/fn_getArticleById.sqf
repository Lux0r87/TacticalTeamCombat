/*
    Created by BauerMitFackel
*/


_id = _this;
_article = nil;

{
	if ((_x select 0) == _id) exitWith {
		_article = _x;
		diag_log format["DEBUG (TTC_SHOP_fnc_getArticleById): Article %1 found", _article];
	};

} forEach TTC_SHOP_articles;


if (isNil {_article}) then {
	diag_log format["ERROR (TTC_SHOP_fnc_getArticleById): Unknown article id %1", _id];
};

_article;
