/*
	Updates the shopping cart.
	
	Parameter(s):
		0: ARRAY - shopping cart
	
    Created by BauerMitFackel
*/

disableSerialization;

/*
	Adds the given article to the article list
	Parameter(s):
		0: CONTROL	- article list display control
		1: ARRAY	- article entry
*/
_addArticleEntryToList = {

	private["_control", "_entry", "_article", "_amount", "_id", "_name", "_price", "_costs", "_index"];
	
	_control = [_this, 0] call BIS_fnc_param;
	_entry = [_this, 1] call BIS_fnc_param;
	
	_article = _entry select 0;
	_amount = _entry select 1;
	
	_id	= _article select TTC_SHOP_ARTICLE_id;
	_name = _article select TTC_SHOP_ARTICLE_displayName;
	_price = _article select TTC_SHOP_ARTICLE_price;
	_costs = _price * _amount;
		
	_index = _control lnbAddRow [format ["%1x", _amount], _name, format ["%1 BTC", _costs]];
	_control lnbSetValue [[_index, 0], _id];
};


//////////


_shoppingCart = [] call TTC_SHOP_fnc_getShoppingCart;

_articleList = uiNamespace getVariable ["TTC_SHOP_UI_shoppingCart_articleList", nil];
lnbClear _articleList;

{
	_articleEntries = _x select 1;
	{
		[_articleList, _x] call _addArticleEntryToList;
	} forEach _articleEntries;
} forEach _shoppingCart;

_shoppingCartCosts = [] call TTC_SHOP_fnc_getShoppingCartCosts;
_shoppingCartCosts call TTC_SHOP_UI_fnc_updateShoppingCartCosts;

[] call TTC_SHOP_UI_fnc_updateBuy;
