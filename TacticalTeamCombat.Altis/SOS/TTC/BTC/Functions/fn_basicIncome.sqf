/*
    Created by Lux0r
*/


#define TTC_BTC_basicIncome 500
#define TTC_BTC_basicIncomeTimer 300
#define TTC_BTC_basicIncomeLimit 2000

private ["_difference","_income"];


while {true} do {
	sleep TTC_BTC_basicIncomeTimer;

	if (TTC_BTC_balance < TTC_BTC_basicIncomeLimit) then {
		// Calculate the difference in hundred BTCs (rounded up).
		_difference	= ceil ((TTC_BTC_basicIncomeLimit - TTC_BTC_balance) / 100);
		_income		= (_difference * 100) min TTC_BTC_basicIncome;
		["Basic Income", _income] spawn TTC_BTC_fnc_addBalanceChange;
	};
};
