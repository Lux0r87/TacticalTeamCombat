/*
	Checks if the given article if available in the shop at the current location.

    Created by Lux0r
*/

private ["_article","_isAvailable"];

_article = [_this, 0] call BIS_fnc_param;

_isAvailable = switch (TTC_SHOP_location) do {
	case TTC_SHOP_LOCATION_SECTOR: {
		_article select TTC_SHOP_ARTICLE_availableAtSector;
	};
	default {
		true;
	};
};

_isAvailable;
