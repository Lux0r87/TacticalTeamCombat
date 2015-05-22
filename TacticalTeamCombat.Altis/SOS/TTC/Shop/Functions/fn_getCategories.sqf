/*
	Returns all categories from the data source.
	
    Created by BauerMitFackel
*/


_categories = switch (TTC_SHOP_location) do {
	case TTC_SHOP_LOCATION_BASE		: {TTC_SHOP_BASE_CATEGORIES};
	case TTC_SHOP_LOCATION_SECTOR	: {TTC_SHOP_SECTOR_CATEGORIES};
	//case TTC_SHOP_LOCATION_MOBILE	: {TTC_SHOP_MOBILE_CATEGORIES};
	//case TTC_SHOP_LOCATION_HARBOR	: {TTC_SHOP_HARBOR_CATEGORIES};
	//case TTC_SHOP_LOCATION_AIRPORT	: {TTC_SHOP_AIRPORT_CATEGORIES};
	default {[]};
};

_categories;
