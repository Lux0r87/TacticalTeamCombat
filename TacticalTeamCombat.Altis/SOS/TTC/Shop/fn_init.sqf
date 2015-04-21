/*
    Created by BauerMitFackel and Lux0r
*/


// Client-side:
if (hasInterface) then {
	systemChat "Initializing TTC Shop";

	_addArticles = [] spawn TTC_SHOP_fnc_addArticles;

	waitUntil {
		scriptDone _addArticles;
	};

	[] call compile preprocessFileLineNumbers "SOS\TTC\Shop\Configurations\categories.sqf";

	systemChat "TTC Shop initialized";
};
