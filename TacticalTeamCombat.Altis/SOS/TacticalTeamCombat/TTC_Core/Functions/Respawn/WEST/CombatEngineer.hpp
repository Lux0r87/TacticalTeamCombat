class WEST_CE {
	displayName = "Combat Engineer";
	icon = "\A3\Ui_f\data\GUI\Cfg\Ranks\private_gs.paa";

	weapons[] = {
		"arifle_MX_F",								// MX 6.5 mm
		"hgun_P07_F",								// P07 9 mm
		"Binocular"									// Binoculars
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
		"HandGrenade",								// RGO Frag Grenade
		// -------------------- Backpack Items --------------------
		"ToolKit",									// ToolKit
		"MineDetector"								// Mine Detector
	};
	linkedItems[] = {
		"H_HelmetB_camo",							// ECH (Camo)
		"V_Chestrig_blk",							// Fighter Chestrig (Black)
		// Rifle Attachments:
		"optic_Hamr",								// RCO								// Magnification: 10x
		//"muzzle_snds_H",							// Sound Suppressor (6.5 mm)
		"acc_pointer_IR",							// IR Laser Pointer
		// Pistol Attachments:
		//"muzzle_snds_L",							// Sound Suppressor (9 mm)
		// Items:
		"NVGoggles",								// NV Goggles (Brown)
		//"ItemGPS",								// GPS
		"ItemMap",									// Map
		"ItemCompass",								// Compass
		"ItemWatch",								// Watch
		"ItemRadio"									// Radio
	};
	uniformClass = "U_B_CombatUniform_mcam";		// Combat Fatigues (MTP)
	backpack = "B_AssaultPack_rgr";					// Assault Pack (Green)
};