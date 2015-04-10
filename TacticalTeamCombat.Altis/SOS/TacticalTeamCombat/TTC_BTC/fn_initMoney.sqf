/*
	Created by Lux0r
*/


#include "Functions\moneyVariables.hpp"

// Client-side.
if (hasInterface) then {
	// Set start up capital for the player.
	TTC_BTC_money = TTC_BTC_START_UP_CAPITAL;

	// Create the money display (HUD).
	[] spawn TTC_BTC_fnc_createMoneyDisplay;
};