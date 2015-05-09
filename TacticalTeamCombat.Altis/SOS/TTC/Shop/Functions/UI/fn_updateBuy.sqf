/*
	Updates the shopping cart costs.
	
	Parameter(s):
		0: NUMBER	- the costs to display
		
    Created by BauerMitFackel
*/

disableSerialization;

_control = uiNamespace getVariable ["TTC_SHOP_UI_buy", nil];
if (!isNil {_control}) then {
	
	_enable = [] call TTC_SHOP_fnc_canBuy;
	_control ctrlEnable _enable;
		
} else {
	["TTC_SHOP_UI_buy not defined"] call BIS_fnc_log;
};
