class WEST_HelicopterPilot {
	displayName = "Helicopter Pilot";
	icon = "\A3\Ui_f\data\GUI\Cfg\Ranks\sergeant_gs.paa";

	weapons[] = {
		"hgun_P07_F"								// P07 9 mm
	};
	magazines[] = {
		"16Rnd_9x21_Mag",							// 9mm 16Rnd Mag
		"16Rnd_9x21_Mag"							// 9mm 16Rnd Mag
	};
	items[] = {
		"FirstAidKit",								// First Aid Kit
		"FirstAidKit",								// First Aid Kit
		"FirstAidKit"								// First Aid Kit
	};
	linkedItems[] = {
		"H_PilotHelmetHeli_B",						// Heli Pilot Helmet [NATO]
		"ItemMap",									// Map
		"ItemCompass",								// Compass
		"ItemWatch",								// Watch
		"ItemRadio"									// Radio
	};
	uniformClass = "U_B_HeliPilotCoveralls";		// Heli Pilot Coveralls
	backpack = "";
};