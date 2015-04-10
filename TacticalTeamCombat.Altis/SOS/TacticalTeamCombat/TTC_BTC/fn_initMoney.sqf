/*
	Created by Lux0r
*/


// Initialize the money variable..
TTC_BTC_money = 0;

// Client-side.
if (hasInterface) then {
	// Create the money display (HUD).
	[] spawn TTC_BTC_fnc_createMoneyDisplay;

	// Basic income for the player
	[] spawn TTC_BTC_fnc_basicIncome;

	// Add start-up capital for the player.
	_startupCapital = ["TTC_BTC_startupCapital", 5000] call BIS_fnc_getParamValue;
	["Start-up Capital", _startupCapital] spawn TTC_BTC_fnc_changeMoney;
};