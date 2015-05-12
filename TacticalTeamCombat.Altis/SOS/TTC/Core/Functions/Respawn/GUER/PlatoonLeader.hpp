class GUER_PL {
	displayName = "Platoon Leader";
	icon = "\A3\Ui_f\data\GUI\Cfg\Ranks\captain_gs.paa";

	weapons[] = {
		"hgun_Pistol_heavy_02_F"					// Zubr .45
	};
	magazines[] = {
		"6Rnd_45ACP_Cylinder",						// .45 ACP 6Rnd Cylinder
		"6Rnd_45ACP_Cylinder",						// .45 ACP 6Rnd Cylinder
		"6Rnd_45ACP_Cylinder",						// .45 ACP 6Rnd Cylinder
		"6Rnd_45ACP_Cylinder"						// .45 ACP 6Rnd Cylinder
	};
	items[] = {
		"FirstAidKit",								// First Aid Kit
		"FirstAidKit",								// First Aid Kit
		"FirstAidKit"								// First Aid Kit
	};
	linkedItems[] = {
		"H_HelmetIA",								// MICH
		"V_Rangemaster_belt",						// Rangemaster Belt
		"ItemMap",									// Map
		"ItemCompass",								// Compass
		"ItemWatch",								// Watch
		"ItemRadio"									// Radio
	};
	uniformClass = "U_BG_leader";					// Guerilla Uniform
	backpack = "";
};