/*
	Updates the shopping cart costs.
	
	Parameter(s):
		0: NUMBER	- the costs to display
		
    Created by BauerMitFackel
*/

disableSerialization;


private ["_control", "_containsArticles", "_shoppingCart", "_articleEntries", "_enable"];


_control = uiNamespace getVariable ["TTC_SHOP_UI_buy", nil];
if (!isNil {_control}) then {
	
	_containsArticles	= false;
	_shoppingCart		= [_this, 0] call BIS_fnc_param;
	{
		_articleEntries = _x select 1;
		if (!(_articleEntries isEqualTo [])) exitWith {
			_containsArticles = true;
		};
		
	} forEach _shoppingCart;
	
	_enable = false;
	if (_containsArticles) then {
		_enable = [_shoppingCart] call TTC_SHOP_fnc_canBuy;
	};
	
	_control ctrlEnable _enable;
		
} else {
	["Undefined variable TTC_SHOP_UI_buy"] call BIS_fnc_log;
};
