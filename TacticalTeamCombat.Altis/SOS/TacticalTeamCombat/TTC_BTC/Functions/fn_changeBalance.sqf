/*
	Change the balance of the player.
	
	Parameter:
		_this select 0:	String		A short message about the change.
		_this select 1:	Integer		The amount of money to add/remove.

    Created by Lux0r
*/

disableSerialization;

private ["_change","_message","_amount","_display","_control","_color","_text"];


if (isNil "TTC_BTC_balanceChanges") then {
	TTC_BTC_balanceChanges = [];
};

// Add the latest change at the end of the array.
TTC_BTC_balanceChanges pushBack _this;

// Wait until the display is not used by another process.
waitUntil {
	sleep 1;
	isNull (uiNamespace getVariable ["TTC_BTC_incomeDisplay", displayNull])
};

// Get the first element, then delete it from the array.
_change = TTC_BTC_balanceChanges select 0;
TTC_BTC_balanceChanges set [0, ObjNull];
TTC_BTC_balanceChanges = TTC_BTC_balanceChanges - [ObjNull];

// Get message and amount
_message	= _change select 0;
_amount		= _change select 1;

// Show balance display.
1002 cutRsc ["TTC_BTC_incomeDisplay", "PLAIN"];
_display = uiNamespace getVariable "TTC_BTC_incomeDisplay";
_control = _display displayCtrl 1003;

// Select color.
_color = if (_amount < 0) then {
	"#ff0000";
} else {
	"#00ff00";
};

// Set the text for the balance display.
_text = parseText format["<t size='0.8'>%1</t><br/><t color='%2'>%3</t>", _message, _color, _amount];
_control ctrlSetStructuredText _text;

// Update the new value for the balance (cannot be negative!).
TTC_BTC_balance = (TTC_BTC_balance + _amount) max 0;