/*
	Return the category with the given id or nil if no category with this id exists.
	
	Parameter(s):
		0: NUMBER	- category id
	
	Returns:
		ARRAY	- category
		nil		- if no category with the given id exists
	
    Created by BauerMitFackel
*/

_search = {	
	private["_id", "_categories", "_category"];
	
	_id = _this;
	_categories = [] call TTC_SHOP_fnc_getCategories;
	_category = nil;
	
	{
		if ((_x select TTC_SHOP_CATEGORY_id) == _id) exitWith {
			_category = _x;
		};
	} forEach _categories;
	
	_category;
};


//////////


private["_category"];

_category = _this call _search;
if (isNil {_category}) then {
	diag_log format["DEBUG (TTC_SHOP_DS_fnc_getCategoryById): Unknown category id %1", _this];
};

_category;
