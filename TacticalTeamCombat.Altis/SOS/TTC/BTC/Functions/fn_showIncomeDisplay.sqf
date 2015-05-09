/*
	Show a balance change in the income display.

    Created by Lux0r
*/

disableSerialization;

private ["_change","_message","_amount","_display","_control","_color","_sign","_text"];


while {count TTC_BTC_balanceChanges > 0} do {
	// Wait until the display is not used by another process.
	waitUntil {
		sleep 1;
		isNull (uiNamespace getVariable ["TTC_BTC_incomeDisplay", displayNull])
	};

	// Pop: Get the first element, then delete it from the array.
	_change = TTC_BTC_balanceChanges select 0;
	TTC_BTC_balanceChanges set [0, ObjNull];
	TTC_BTC_balanceChanges = TTC_BTC_balanceChanges - [ObjNull];

	// Get message and amount
	_message	= _change select 0;
	_amount		= _change select 1;

	// Show the income display.
	1002 cutRsc ["TTC_BTC_incomeDisplay", "PLAIN"];
	_display = uiNamespace getVariable "TTC_BTC_incomeDisplay";
	_control = _display displayCtrl 1003;

	// Set the text for the balance display.
	_color	= if (_amount < 0) then {"#ff0000";} else {"#00ff00";};
	_sign	= if (_amount > 0) then {"+"} else {""};
	_text	= parseText format["<t size='0.6'>%1</t><br/><t size='0.8' color='%2'>%3%4</t>", _message, _color, _sign, _amount];
	_control ctrlSetStructuredText _text;

	// Update the balance (cannot be negative!).
	TTC_BTC_balance = (TTC_BTC_balance + _amount) max 0;
	[] spawn TTC_SHOP_UI_fnc_updateBuy;
};