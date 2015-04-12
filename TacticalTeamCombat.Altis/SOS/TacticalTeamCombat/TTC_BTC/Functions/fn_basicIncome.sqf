/*
    Created by Lux0r
*/


#define TTC_BTC_basicIncome 500
#define TTC_BTC_basicIncomeTimer 180


// Add the latest change at the end of the array.
while {true} do {
	sleep TTC_BTC_basicIncomeTimer;

	if (alive player) then {
		["Basic Income", TTC_BTC_basicIncome] spawn TTC_BTC_fnc_addBalanceChange;
	};
};