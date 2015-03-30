/*
    Created by BauerMitFackel
*/

disableSerialization;


if (isNil {TTC_MONEY_balance}) exitWith {
	"TTC_MONEY_balance cannot be nil" call BIS_fnc_error;
};


1000 cutRsc ["TTC_MONEY_BalanceDisplay", "PLAIN"];

_balance = TTC_MONEY_balance;
_display = uiNamespace getVariable "TTC_MONEY_balanceDisplay";
_control = _display displayCtrl 1001;

while {true} do {
	
	_balance = TTC_MONEY_balance;
	_text    = parseText format["<t>%1 %2</t>", _balance, "BTC"];
	_control ctrlSetStructuredText _text;
	
	// Wait until the balance changes
	waitUntil{TTC_MONEY_balance != _balance};
	uiSleep 1;
};
