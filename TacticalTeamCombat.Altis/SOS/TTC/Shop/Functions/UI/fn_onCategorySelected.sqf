/*
	This script is called when the player selects a category from the category list.
	
	Parameter(s):
		0: CONTROL	- the category list display control
		1: NUMBER	- the index of the selected category
		
    Created by BauerMitFackel
*/


disableSerialization;

private["_control","_index","_articles","_id","_category"];

_control	= [_this, 0] call BIS_fnc_param;
_index		= [_this, 1] call BIS_fnc_param;
_articles	= nil;

if (_index >= 0) then {
	_id	= _control lnbValue [_index, 0];
	_category = _id call TTC_SHOP_fnc_getCategoryById;
	_articles = _category select TTC_SHOP_CATEGORY_articles;	
};

_articles call TTC_SHOP_UI_fnc_updateArticleList;
