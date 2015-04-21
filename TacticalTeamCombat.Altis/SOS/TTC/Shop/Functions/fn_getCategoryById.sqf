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
	
	private["_id", "_categories", "_low", "_high", "_category", "_categoryFound", "_mid", "_c"];
	
	_id = _this;
	_categories = [] call TTC_SHOP_fnc_getCategories;
	
	_low = 0;
	_high = count _categories;
	_category = nil;
	_categoryFound = false;
	
	while {_low <= _high && !_categoryFound} do {
	
		_mid = _low + floor((_high - _low) / 2);
		_c = _categories select _mid;
		
		if ((_c select TTC_SHOP_CATEGORY_id) == _id) then {
			_category = _c;
			_categoryFound = true;
		} else {
		
			if ((_c select TTC_SHOP_CATEGORY_id) < _id) then {
				_low = _mid + 1;
			} else {
				_high = _mid -1;
			};
		
		};
	};
	
	_category;
};


//////////


_category = _this call _search;
if (isNil {_category}) then {
	diag_log format["DEBUG (TTC_SHOP_DS_fnc_getCategoryById): Unknown category id %1", _this];
};

_category;
