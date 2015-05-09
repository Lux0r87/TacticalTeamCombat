/*
	Updates the shopping cart costs.
	
	Parameter(s):
		0: NUMBER	- the costs to display
		
    Created by BauerMitFackel
*/

disableSerialization;

_control = uiNamespace getVariable ["TTC_SHOP_UI_shoppingCart_costs", nil];
if (!isNil {_control}) then {
	
	_costs = [_this, 0] call BIS_fnc_param;
	_text = format ["<t font='PuristaSemiBold' size='2' align='right' valign='middle'>%1 BTC</t>", _costs];
	_control ctrlSetStructuredText parseText _text;
		
} else {
	["TTC_SHOP_UI_shoppingCart_costs"] call BIS_fnc_error;
};
