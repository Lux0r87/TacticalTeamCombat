/*
	TODO: Write documentation
	Params: _articles
    Created by BauerMitFackel
*/

disableSerialization;
_ARTICLE_LIST_IDC = 52001;

/*
	Add the given article to the article list
	Params: [_id, _name, _price, _displayName, _descriptionShort, _picture]
*/
_addArticleToList = {
		
	_id					= [_this, 0] call BIS_fnc_param;
	_price				= [_this, 2] call BIS_fnc_param;
	_displayName		= [_this, 3] call BIS_fnc_param;
		
	_index = lnbAddRow [_ARTICLE_LIST_IDC, [_displayName , format["%1 BTC", _price]]];
	lnbSetValue  [_ARTICLE_LIST_IDC, [_index, 0], _id];
};


//////////


_articles = _this;

lnbClear _ARTICLE_LIST_IDC;
lnbSetCurSelRow [_ARTICLE_LIST_IDC, -1];

{
	_article = _x;
	_article call _addArticleToList;

} forEach _articles;
