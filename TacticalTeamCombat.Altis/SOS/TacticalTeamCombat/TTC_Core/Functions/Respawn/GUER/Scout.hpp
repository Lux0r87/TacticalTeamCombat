class GUER_SCT {
	displayName = "Scout";
	icon = "\A3\Ui_f\data\GUI\Cfg\Ranks\corporal_gs.paa";

	weapons[] = {
		"arifle_MXM_F",								// MXM 6.5 mm
		"hgun_P07_F",								// P07 9 mm
		"Rangefinder"								// Rangefinder
	};
	magazines[] = {
		"16Rnd_9x21_Mag",							// 9mm 16Rnd Mag
		"16Rnd_9x21_Mag",							// 9mm 16Rnd Mag
		"30Rnd_65x39_caseless_mag",					// 6.5mm 30Rnd STANAG Mag
		"30Rnd_65x39_caseless_mag",					// 6.5mm 30Rnd STANAG Mag
		"30Rnd_65x39_caseless_mag",					// 6.5mm 30Rnd STANAG Mag
		"30Rnd_65x39_caseless_mag",					// 6.5mm 30Rnd STANAG Mag
		"30Rnd_65x39_caseless_mag",					// 6.5mm 30Rnd STANAG Mag
		"30Rnd_65x39_caseless_mag",					// 6.5mm 30Rnd STANAG Mag
		"30Rnd_65x39_caseless_mag_Tracer",			// 6.5mm 30Rnd Tracer (Red) Mag
		"30Rnd_65x39_caseless_mag_Tracer",			// 6.5mm 30Rnd Tracer (Red) Mag
		"30Rnd_65x39_caseless_mag_Tracer",			// 6.5mm 30Rnd Tracer (Red) Mag
		"30Rnd_65x39_caseless_mag_Tracer",			// 6.5mm 30Rnd Tracer (Red) Mag
		"30Rnd_65x39_caseless_mag_Tracer"			// 6.5mm 30Rnd Tracer (Red) Mag
	};
	items[] = {
		"FirstAidKit",								// First Aid Kit
		"FirstAidKit",								// First Aid Kit
		"FirstAidKit",								// First Aid Kit
		"SmokeShellGreen",							// Smoke Grenade (Green)
		"SmokeShellGreen",							// Smoke Grenade (Green)
		"SmokeShellBlue",							// Smoke Grenade (Blue)
		"SmokeShellBlue",							// Smoke Grenade (Blue)
		"HandGrenade",								// RGO Frag Grenade
		"HandGrenade",								// RGO Frag Grenade
		"optic_NVS"									// NVS								// Magnification: 10x
	};
	linkedItems[] = {
		"H_Shemag_olive_hs",						// Shemag (Olive, Headset)
		"V_BandollierB_khk",						// Slash Bandolier (Coyote)
		// Rifle Attachments:
		"optic_DMS",								// DMS
		"muzzle_snds_H",							// Sound Suppressor (6.5 mm)
		"acc_pointer_IR",							// IR Laser Pointer
		// Pistol Attachments:
		"muzzle_snds_L",							// Sound Suppressor (9 mm)
		// Items:
		"NVGoggles",								// NV Goggles (Brown)
		"ItemMap",									// Map
		"ItemCompass",								// Compass
		"ItemWatch",								// Watch
		"ItemRadio",								// Radio
		"B_UavTerminal"								// UAV Terminal
	};
	uniformClass = "U_BG_leader";					// Guerilla Uniform
	backpack = "B_UAV_01_backpack_F";				// UAV Backpack
};