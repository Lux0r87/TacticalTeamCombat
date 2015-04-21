/*
    Created by Lux0r
*/

TTC_SHOP_weapons		= (
	// Pistols
	[TTC_SHOP_articles_pistol_ACPC2,
	TTC_SHOP_articles_pistol_Rook40,
	// SMGs
	TTC_SHOP_articles_smg_PDW2000,
	TTC_SHOP_articles_smg_Sting,
	// Carbines
	TTC_SHOP_articles_carbine_TRG20,
	TTC_SHOP_articles_carbine_Mk20C,
	TTC_SHOP_articles_carbine_Katiba_C]
);

TTC_SHOP_attachments	= (
	[TTC_SHOP_articles_flashlight,
	TTC_SHOP_articles_laserpointer] +
	TTC_SHOP_articles_scopes_pistols +
	TTC_SHOP_articles_scopes_smgs
);

TTC_SHOP_ammunition 	= TTC_SHOP_articles_ammunition;

TTC_SHOP_explosives		= [];

TTC_SHOP_items			= (
	TTC_SHOP_articles_basicItems +
	TTC_SHOP_articles_medic +
	[TTC_SHOP_articles_binocular] +
	TTC_SHOP_articles_nightvisions
);

TTC_SHOP_headgear		= (
	TTC_SHOP_articles_goggles +
	TTC_SHOP_articles_bandanna +
	TTC_SHOP_articles_balaclava
);

TTC_SHOP_uniforms		= [];

TTC_SHOP_vests			= TTC_SHOP_articles_vests_GUER;

TTC_SHOP_backpacks		= (
	[TTC_SHOP_articles_Parachute]
);

TTC_SHOP_vehicles		= (
	[TTC_SHOP_articles_vehicle_quadbike_GUER] +
	TTC_SHOP_articles_vehicle_offroads_GUER +
	TTC_SHOP_articles_vehicles_strider +
	TTC_SHOP_articles_vehicles_zamak
);

TTC_SHOP_helicopters	= (
	[TTC_SHOP_articles_helicopters_hellcat,
	TTC_SHOP_articles_helicopters_Mohawk] +
	TTC_SHOP_articles_helicopters_taru +
	TTC_SHOP_articles_helicopters_taru_black +
	TTC_SHOP_articles_helicopters_orcas +
	[TTC_SHOP_articles_helicopters_hellcat_armed]
);

TTC_SHOP_ugvs			= TTC_SHOP_articles_ugvs_GUER;

TTC_SHOP_uavs			= TTC_SHOP_articles_uavs_GUER;
