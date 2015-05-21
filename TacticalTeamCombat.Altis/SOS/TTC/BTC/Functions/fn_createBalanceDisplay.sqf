/*
    Created by BauerMitFackel
*/


disableSerialization;

private ["_display","_control","_balance","_text"];


1000 cutRsc ["TTC_BTC_balanceDisplay", "PLAIN"];
_display = uiNamespace getVariable "TTC_BTC_balanceDisplay";
_control = _display displayCtrl 1001;

while {true} do {
	_balance = TTC_BTC_balance;
	_text    = parseText format["<img image='SOS\TTC\BTC\Pics\Bitcoin.paa' size='0.7'/><t  size='0.8'>%1</t>", _balance];
	_control ctrlSetStructuredText _text;

	// Wait until the balance changes
	waitUntil{TTC_BTC_balance != _balance};
	uiSleep 1;
};
