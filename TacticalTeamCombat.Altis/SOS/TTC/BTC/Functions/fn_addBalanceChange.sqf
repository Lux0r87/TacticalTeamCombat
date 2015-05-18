/*
	Change the balance of the player.
	
	Parameter:
		_this select 0:	String		A short message about the change.
		_this select 1:	Integer		The amount of money to add/remove.

    Created by Lux0r
*/


if (!isDedicated) then {
	// Update the sector list for the teleport UI.
	if (!isNil "TTC_CTI_sectors") then {
		TTC_CTI_sectors spawn TTC_TP_UI_fnc_updateSectorList;
	};

	// Safety measure: Initialize balances changes array, if it doesn't exist.
	if (isNil "TTC_BTC_balanceChanges") then {
		TTC_BTC_balanceChanges = [];
	};

	// Push: Add the latest change at the end of the array.
	TTC_BTC_balanceChanges pushBack _this;

	// Safety measure: Initialize showIncomeDisplay handle, if it doesn't exist.
	if (isNil "TTC_BTC_showIncomeDisplay_handle") then {
		TTC_BTC_showIncomeDisplay_handle = scriptNull;
	};

	// Show the income display, if the script doesn't run/exist already.
	if (scriptDone TTC_BTC_showIncomeDisplay_handle) then {
		TTC_BTC_showIncomeDisplay_handle = [] spawn TTC_BTC_fnc_showIncomeDisplay;
	};
};
