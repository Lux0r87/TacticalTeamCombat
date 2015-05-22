/*
	Updates the article list.
	
	Parameter(s):
		0: ARRAY - the articles to display
		
    Created by BauerMitFackel
*/

disableSerialization;

/*
	Adds the given article to the article list
	Parameter(s):
		0: CONTROL	- article list display control
		1: ARRAY	- article array
*/
_addArticleToList = {	
	private["_control", "_article", "_id", "_price", "_displayName", "_index"];

	_control = [_this, 0] call BIS_fnc_param;
	_article = [_this, 1] call BIS_fnc_param;

	_id		= _article select TTC_SHOP_ARTICLE_id;
	_price	= _article select TTC_SHOP_ARTICLE_price;
	_displayName = _article select TTC_SHOP_ARTICLE_displayName;

	_index = _control lnbAddRow [_displayName, format["%1 BTC", _price]];
	_control lnbSetValue [[_index, 0], _id];
};


//////////

private["_control"];

_control = uiNamespace getVariable ["TTC_SHOP_UI_articleList", nil];
if (!isNil {_control}) then {

	lnbClear _control;
	if (_this isEqualTo []) then {
		["Article array is empty"] call BIS_fnc_log;
	} else {
		// Add articles to list
		{
			[_control, _x] call _addArticleToList;
		} forEach _this;
		
		// Select first row
		_control lnbSetCurSelRow 0;
	};
} else {
	["Variable TTC_SHOP_UI_articleList not defined"] call BIS_fnc_error;
};
