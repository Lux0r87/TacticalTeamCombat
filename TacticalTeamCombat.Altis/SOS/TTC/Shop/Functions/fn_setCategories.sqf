/*
	TODO: Write documentation
	Params: _categories
    Created by BauerMitFackel
*/

disableSerialization;
_CATEGORY_LIST_IDC = 51001;


/*
	Add the given article to the article list
	Params: [_id, _name, _articles]
*/
_addCategoryToList = {
		
	_id					= [_this, 0] call BIS_fnc_param;
	_name				= [_this, 1] call BIS_fnc_param;
		
	_index = lnbAddRow [_CATEGORY_LIST_IDC, [_name]];
	lnbSetValue  [_CATEGORY_LIST_IDC, [_index, 0], _id];
};


//////////


_categories = _this;

lnbClear _CATEGORY_LIST_IDC;
lnbSetCurSelRow [_CATEGORY_LIST_IDC, -1];

{
	_category = _x;
	_category call _addCategoryToList;

} forEach _categories;
