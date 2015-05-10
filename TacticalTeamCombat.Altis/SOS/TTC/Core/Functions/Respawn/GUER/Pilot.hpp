class GUER_Pilot {
	displayName = "Helicopter Pilot";
	icon = "\A3\Ui_f\data\GUI\Cfg\Ranks\sergeant_gs.paa";

	weapons[] = {
		"hgun_ACPC2_F"								// ACP-C2 .45
	};
	magazines[] = {
		"9Rnd_45ACP_Mag",							// .45 ACP 9Rnd Mag
		"9Rnd_45ACP_Mag",							// .45 ACP 9Rnd Mag
		"9Rnd_45ACP_Mag"							// .45 ACP 9Rnd Mag
	};
	items[] = {
		"FirstAidKit",								// First Aid Kit
		"FirstAidKit",								// First Aid Kit
		"FirstAidKit"								// First Aid Kit
	};
	linkedItems[] = {
		"H_PilotHelmetHeli_I",						// Heli Pilot Helmet [AAF]
		"ItemMap",									// Map
		"ItemCompass",								// Compass
		"ItemWatch",								// Watch
		"ItemRadio"									// Radio
	};
	uniformClass = "U_I_HeliPilotCoveralls";		// Heli Pilot Coveralls
	backpack = "";
};