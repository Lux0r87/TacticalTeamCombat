/*
	Created by Lux0r
*/


// Initialize the balance variable..
TTC_BTC_balance = 0;

// Client-side.
if (hasInterface) then {
	// Create the balance display (HUD).
	[] spawn TTC_BTC_fnc_createBalanceDisplay;

	// Basic income for the player
	[] spawn TTC_BTC_fnc_basicIncome;

	// Add start-up capital for the player.
	_startupCapital = ["TTC_BTC_startupCapital", 5000] call BIS_fnc_getParamValue;
	["Start-up Capital", _startupCapital] spawn TTC_BTC_fnc_changeBalance;
};