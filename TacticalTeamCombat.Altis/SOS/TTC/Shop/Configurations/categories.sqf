/*
	All categories are defined in this script.
    Created by BauerMitFackel
*/

TTC_SHOP_CATEGORY_id			= 0;
TTC_SHOP_CATEGORY_name			= 1;
TTC_SHOP_CATEGORY_articles		= 2;

_weapons		= [1000,	"Weapons",			TTC_SHOP_weapons];
_ammunition		= [2000,	"Ammunition",		TTC_SHOP_ammunition];
_explosives		= [3000,	"Explosives",		TTC_SHOP_explosives];
_items			= [4000,	"Items",			TTC_SHOP_items];
_headgear		= [5000,	"Headgear",			TTC_SHOP_headgear];
_uniforms		= [6000,	"Uniforms",			TTC_SHOP_uniform];
_vests			= [7000,	"Vests",			TTC_SHOP_vests];
_backpacks		= [8000,	"Backpacks",		TTC_SHOP_backpacks];
_vehicles		= [9000,	"Vehicles",			TTC_SHOP_vehicles];
_helicopters	= [10000,	"Helicopters",		TTC_SHOP_helicopters];
_uavs			= [11000,	"UAVs", 			TTC_SHOP_uavs];
_ugvs			= [12000,	"UGVs", 			TTC_SHOP_ugvs];


/*
	Array containing all categories
	Must be sorted. The order is used in the category list
*/
TTC_SHOP_categories = [

	_weapons,
	_ammunition,
	_explosives,
	_items,
	_headgear,
	_uniforms,
	_vests,
	_backpacks,
	_vehicles,
	_helicopters,
	_uavs,
	_ugvs
];