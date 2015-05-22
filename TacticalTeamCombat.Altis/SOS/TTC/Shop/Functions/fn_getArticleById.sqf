/*
	Return the article with the given id or nil if no article with this id exists.
	
	Parameter(s):
		0: NUMBER	- article id
	
	Returns:
		ARRAY	- article
		nil		- if no article with the given id exists
	
    Created by BauerMitFackel
*/

private["_id","_articles","_article"];

_id			= _this;
_articles	= [] call TTC_SHOP_fnc_getArticles;
_article	= nil;

{
	if ((_x select 0) == _id) exitWith {
		_article = _x;
	};
} forEach _articles;

if (isNil {_article}) then {
	diag_log format["ERROR (TTC_SHOP_DS_fnc_getArticleById): Unknown article id %1", _id];
};

_article;
