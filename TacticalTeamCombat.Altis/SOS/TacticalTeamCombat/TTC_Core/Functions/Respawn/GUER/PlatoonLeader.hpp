class GUER_PL {
	displayName = "Platoon Leader";
	icon = "\A3\Ui_f\data\GUI\Cfg\Ranks\captain_gs.paa";

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
		"SmokeShellOrange",							// Smoke Grenade (Orange)
		"SmokeShellOrange",							// Smoke Grenade (Orange)
		"HandGrenade",								// RGO Frag Grenade
		"HandGrenade",								// RGO Frag Grenade
		"HandGrenade"								// RGO Frag Grenade
	};
	linkedItems[] = {
		"H_Beret_blk",								// Beret (Black)
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
	backpack = "B_AssaultPack_rgr";					// Assault Pack (Green)
};