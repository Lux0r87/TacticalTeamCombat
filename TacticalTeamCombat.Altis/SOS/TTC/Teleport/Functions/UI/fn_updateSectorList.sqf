/*
	Updates the sector list.
	
	Parameter(s):
		0: ARRAY - the sectors to display
		
    Created by BauerMitFackel
*/

disableSerialization;

/*
	Adds the given sector to the sector list
	Parameter(s):
		0: CONTROL	- sector list display control
		1: ARRAY	- sector array
*/
_addSectorToList = {
	
	private["_control", "_sector", "_id", "_price", "_displayName", "_index"];
	
	_control = [_this, 0] call BIS_fnc_param;
	_sector	 = [_this, 1] call BIS_fnc_param;
	
	/*
	_id	= _article select TTC_SHOP_ARTICLE_id;
	_price = _article select TTC_SHOP_ARTICLE_price;
	_displayName = _article select TTC_SHOP_ARTICLE_displayName;
		
	_index = _control lnbAddRow [_displayName, format["%1 BTC", _price]];
	_control lnbSetValue [[_index, 0], _id];
	*/
};


//////////


_control = uiNamespace getVariable ["TTC_TP_UI_sectorList", nil];
if (!isNil {_control}) then {

	lnbClear _control;
	if (_this isEqualTo []) then {
		["Sector array is empty"] call BIS_fnc_log;
	} else {
		
		// Add sectors to list
		{
			[_control, _x] call _addSectorToList;
		} forEach _this;
		
		// Select first row
		// _control lnbSetCurSelRow 0;
	};
} else {
	["Variable TTC_TP_UI_sectorList not defined"] call BIS_fnc_error;
};
