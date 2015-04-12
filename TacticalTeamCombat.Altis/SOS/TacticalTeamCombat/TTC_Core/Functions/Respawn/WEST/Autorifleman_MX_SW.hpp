class WEST_MG_MXSW {
	displayName = "Autorifleman MX SW";
	icon = "\A3\Ui_f\data\GUI\Cfg\Ranks\private_gs.paa";

	weapons[] = {
		"arifle_MX_SW_F",							// MX SW 6.5 mm
		"hgun_P07_F",								// P07 9 mm
		"Binocular"									// Binoculars
	};
	magazines[] = {
		"16Rnd_9x21_Mag",							// 9mm 16Rnd Mag
		"100Rnd_65x39_caseless_mag",				// 6.5mm 100Rnd Belt Case
		"100Rnd_65x39_caseless_mag",				// 6.5mm 100Rnd Belt Case
		"100Rnd_65x39_caseless_mag",				// 6.5mm 100Rnd Belt Case
		"100Rnd_65x39_caseless_mag_Tracer",			// 6.5mm 100Rnd Tracer (Red) Belt Case
		"100Rnd_65x39_caseless_mag_Tracer",			// 6.5mm 100Rnd Tracer (Red) Belt Case
		"100Rnd_65x39_caseless_mag_Tracer",			// 6.5mm 100Rnd Tracer (Red) Belt Case
		"100Rnd_65x39_caseless_mag_Tracer"			// 6.5mm 100Rnd Tracer (Red) Belt Case
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
		"HandGrenade"								// RGO Frag Grenade
	};
	linkedItems[] = {
		"H_HelmetB_camo",							// ECH (Camo)
		"V_Chestrig_blk",							// Fighter Chestrig (Black)
		// Rifle Attachments:
		"optic_Hamr",								// RCO								// Magnification: 10x
		//"muzzle_snds_H_SW",						// Sound Suppressor LMG (6.5 mm)	// MX SW
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