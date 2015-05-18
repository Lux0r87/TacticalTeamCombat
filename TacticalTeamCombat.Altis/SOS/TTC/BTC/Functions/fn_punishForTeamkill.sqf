/*
	Created by Lux0r
*/


TTC_BTC_penalty_teamkill		= TTC_BTC_penalty_teamkill - TTC_BTC_penalty_teamkill_Malus;
TTC_BTC_penalty_teamkill_Malus	= TTC_BTC_penalty_teamkill_Malus + 25;

["Team Kill", TTC_BTC_penalty_teamkill] spawn TTC_BTC_fnc_addBalanceChange;
