class GUER_TL {
	displayName = "Team Leader";
	icon = "\A3\Ui_f\data\GUI\Cfg\Ranks\sergeant_gs.paa";

	weapons[] = {
		"arifle_TRG21_GL_F",						// TRG-21 EGLM 5.56 mm
		"hgun_Pistol_heavy_02_F",					// Zubr .45
		"Rangefinder"								// Rangefinder
	};
	magazines[] = {
		"6Rnd_45ACP_Cylinder",						// .45 ACP 6Rnd Cylinder
		"6Rnd_45ACP_Cylinder",						// .45 ACP 6Rnd Cylinder
		"1Rnd_HE_Grenade_shell",					// 40mm HE Grenade Round
		"30Rnd_556x45_Stanag",						// 5.56mm 30rnd STANAG Mag
		"30Rnd_556x45_Stanag",						// 5.56mm 30rnd STANAG Mag
		"30Rnd_556x45_Stanag",						// 5.56mm 30rnd STANAG Mag
		"30Rnd_556x45_Stanag",						// 5.56mm 30rnd STANAG Mag
		"30Rnd_556x45_Stanag",						// 5.56mm 30rnd STANAG Mag
		"30Rnd_556x45_Stanag",						// 5.56mm 30rnd STANAG Mag
		"30Rnd_556x45_Stanag_Tracer_Yellow",		// 5.56mm 30rnd Tracer (Yellow) Mag
		"30Rnd_556x45_Stanag_Tracer_Yellow",		// 5.56mm 30rnd Tracer (Yellow) Mag
		"30Rnd_556x45_Stanag_Tracer_Yellow",		// 5.56mm 30rnd Tracer (Yellow) Mag
		"30Rnd_556x45_Stanag_Tracer_Yellow",		// 5.56mm 30rnd Tracer (Yellow) Mag
		"30Rnd_556x45_Stanag_Tracer_Yellow"			// 5.56mm 30rnd Tracer (Yellow) Mag
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
		"HandGrenade",								// RGO Frag Grenade
		// -------------------- Backpack Items --------------------
		//"DemoCharge_Remote_Mag",					// Explosive Charge
		//"DemoCharge_Remote_Mag"					// Explosive Charge
	};
	linkedItems[] = {
		"H_HelmetIA",								// MICH
		"V_BandollierB_khk",						// Slash Bandolier (Coyote)
		// Rifle Attachments:
		"optic_Arco",								// ARCO								// Magnification: 10x
		//"muzzle_snds_M",							// Sound Suppressor (5.56 mm)
		"acc_pointer_IR",							// IR Laser Pointer
		// Pistol Attachments:
		"optic_Yorris",								// Yorris J2						// Magnification: 1x
		// Items:
		"NVGoggles_INDEP",							// NV Goggles (Green)
		//"ItemGPS",								// GPS
		"ItemMap",									// Map
		"ItemCompass",								// Compass
		"ItemWatch",								// Watch
		"ItemRadio"									// Radio
	};
	uniformClass = "U_BG_leader";					// Guerilla Uniform
	backpack = "B_Kitbag_rgr";						// Kitbag (Green)
};