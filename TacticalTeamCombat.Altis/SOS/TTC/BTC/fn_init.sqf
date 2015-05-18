/*
	Created by Lux0r
*/


#include "Functions\penalty.inc"


// Client-side.
if (hasInterface) then {
	// Initialize the balance variable.
	TTC_BTC_balance = 0;

	// Initialize variables for team kill penalty.
	TTC_BTC_penalty_teamkill		= TTC_BTC_PENALTY_TEAMKILL_PLAYER;	// Set the base value for team kill penalty.
	TTC_BTC_penalty_teamkill_Malus	= 0;								// Additional malus: will be increased for each team kill.

	// Create the balance display (HUD).
	[] spawn TTC_BTC_fnc_createBalanceDisplay;

	// Basic income for the player
	[] spawn TTC_BTC_fnc_basicIncome;

	// Add start-up capital for the player.
	_startupCapital = ["TTC_BTC_startupCapital", 3000] call BIS_fnc_getParamValue;
	["Start-up Capital", _startupCapital] spawn TTC_BTC_fnc_addBalanceChange;
};