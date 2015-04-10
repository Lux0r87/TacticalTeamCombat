/*
    Created by BauerMitFackel
*/


disableSerialization;

private ["_display","_control","_balance","_text"];


1000 cutRsc ["TTC_BTC_moneyDisplay", "PLAIN"];
_display = uiNamespace getVariable "TTC_BTC_moneyDisplay";
_control = _display displayCtrl 1001;

while {true} do {
	_balance = TTC_BTC_money;
	_text    = parseText format["<t>%1</t><img image='SOS\TacticalTeamCombat\TTC_BTC\Pics\Bitcoin.paa' size='0.9'/>", _balance];
	_control ctrlSetStructuredText _text;

	// Wait until the balance changes
	waitUntil{TTC_BTC_money != _balance};
	uiSleep 1;
};