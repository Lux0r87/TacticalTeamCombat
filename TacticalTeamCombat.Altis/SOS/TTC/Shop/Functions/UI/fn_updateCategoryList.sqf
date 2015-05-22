/*
	Updates the category list.
	Only categories which contain at least one article are displayed.
	
	Parameter(s):
		0: ARRAY	- the categories to display
		
    Created by BauerMitFackel
*/

disableSerialization;

/*
	Adds the given category to the category list
	Parameter(s):
		0: CONTROL	- category list display control
		1: ARRAY	- category array
*/
_addCategoryToList = {
	private["_control", "_category", "_id", "_name", "_icon", "_index"];
	
	_control = [_this, 0] call BIS_fnc_param;
	_category = [_this, 1] call BIS_fnc_param;
		
	_id	= _category select TTC_SHOP_CATEGORY_id;
	_name = _category select TTC_SHOP_CATEGORY_name;
	_icon = _category select TTC_SHOP_CATEGORY_icon;
		
	_index = _control lnbAddRow [_name];
	_control lnbSetPicture [[_index, 0], _icon];
	_control lnbSetValue [[_index, 0], _id];
};


//////////


private["_control","_selectFirstRow"];

_control = uiNamespace getVariable ["TTC_SHOP_UI_categoryList", nil];
if (!isNil {_control}) then {
		
	lnbClear _control;
	if (_this isEqualTo []) then {
		["Category array is empty"] call BIS_fnc_log;
	} else {
	
		_selectFirstRow = false;
		
		{		
			[_control, _x] call _addCategoryToList;
			_selectFirstRow = true;
		} forEach _this;
		
		if (_selectFirstRow) then {
			_control lnbSetCurSelRow 0;
		};		
	};
} else {
	["Variable TTC_SHOP_UI_categoryList not defined"] call BIS_fnc_error;
};
