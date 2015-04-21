/*
	Return the category of the article with the given id.
	
	Parameter(s):
		0: NUMBER - article id
	
	Returns:
		ARRAY - category
	
    Created by BauerMitFackel
*/

_articleId = _this;
_categories = [] call TTC_SHOP_fnc_getCategories;
_category = nil;

_path = [_categories, _articleId] call BIS_fnc_findNestedElement;
if (_path isEqualTo []) then {
	["Category not found"] call BIS_fnc_log;
} else {
	_categoryIndex = _path select 0;
	_category = _categories select _categoryIndex;
};

_category;
