/*
	Removes the given article from the shopping cart.
	If the shopping cart contains more than one article the amount will be decreased.
	
	Parameter(s):
		0: ARRAY - article
	
	Returns:
		ARRAY - shopping cart
		
    Created by BauerMitFackel
*/

_articleId = _this;
_shoppingCart = [] call TTC_SHOP_fnc_getShoppingCart;

_path = [_shoppingCart, _articleId] call BIS_fnc_findNestedElement;
if (_path isEqualTo []) then {
	
	// Do nothing. Article is not in shopping cart
	
} else {
		
	_categoryIndex = _path select 0;
	_entryIndex = _path select 2;
	
	_entries = (_shoppingCart select _categoryIndex) select 1;
	_entry = _entries select _entryIndex;
	
	_amount = (_entry select 1) - 1;
	
	if (_amount > 0) then {
		_entry set [1, _amount];
	} else {
		_entries deleteAt _entryIndex;
	};
};

_shoppingCart;
