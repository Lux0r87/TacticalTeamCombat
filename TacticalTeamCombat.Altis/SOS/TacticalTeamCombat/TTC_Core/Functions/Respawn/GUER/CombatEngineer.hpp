class GUER_CE {
	displayName = "Combat Engineer";
	icon = "\A3\Ui_f\data\GUI\Cfg\Ranks\private_gs.paa";

	weapons[] = {
		"arifle_TRG21_F",							// TRG-21 5.56 mm
		"hgun_ACPC2_F",								// ACP-C2 .45
		"Binocular"									// Binoculars
	};
	magazines[] = {
		"9Rnd_45ACP_Mag",							// .45 ACP 9Rnd Mag
		"9Rnd_45ACP_Mag",							// .45 ACP 9Rnd Mag
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
		"ToolKit",									// ToolKit
		"MineDetector"								// Mine Detector
	};
	linkedItems[] = {
		"H_HelmetIA",								// MICH
		"V_BandollierB_khk",						// Slash Bandolier (Coyote)
		// Rifle Attachments:
		"optic_Arco",								// ARCO								// Magnification: 10x
		//"muzzle_snds_M",							// Sound Suppressor (5.56 mm)
		"acc_pointer_IR",							// IR Laser Pointer
		// Pistol Attachments:
		//"muzzle_snds_acp",						// Sound Suppressor (.45 ACP)
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