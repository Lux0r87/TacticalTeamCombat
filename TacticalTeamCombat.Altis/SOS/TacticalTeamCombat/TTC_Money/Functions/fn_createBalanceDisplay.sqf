/*
    Created by BauerMitFackel
*/

disableSerialization;


if (isNil {TTC_MONEY_balance}) exitWith {
	"TTC_MONEY_balance cannot be nil" call BIS_fnc_error;
};


1000 cutRsc ["TTC_MONEY_BalanceDisplay", "PLAIN"];

_display = uiNamespace getVariable "TTC_MONEY_balanceDisplay";
_control = _display displayCtrl 1001;

while {true} do {
	_balance = TTC_MONEY_balance;
	_text    = parseText format["<t>%1</t><img image='SOS\TacticalTeamCombat\TTC_Money\Pics\Bitcoin.paa' size='0.9'/>", _balance];
	_control ctrlSetStructuredText _text;

	// Wait until the balance changes
	waitUntil{TTC_MONEY_balance != _balance};
	uiSleep 1;
};
