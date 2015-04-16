class WEST_PL {
	displayName = "Platoon Leader";
	icon = "\A3\Ui_f\data\GUI\Cfg\Ranks\captain_gs.paa";

	weapons[] = {
		"arifle_MX_GL_F",							// MX 3GL 6.5 mm
		"hgun_Pistol_heavy_01_F",					// 4-five .45
		"Rangefinder"								// Rangefinder
	};
	magazines[] = {
		"11Rnd_45ACP_Mag",							// .45 ACP 11Rnd Mag
		"11Rnd_45ACP_Mag",							// .45 ACP 11Rnd Mag
		"3Rnd_HE_Grenade_shell",					// 40mm 3Rnd HE Grenade
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
		"SmokeShellOrange",							// Smoke Grenade (Orange)
		"SmokeShellOrange",							// Smoke Grenade (Orange)
		"HandGrenade",								// RGO Frag Grenade
		"HandGrenade",								// RGO Frag Grenade
		"HandGrenade"								// RGO Frag Grenade
	};
	linkedItems[] = {
		"H_Beret_Colonel",							// Beret [NATO] (Colonel)
		"V_Chestrig_blk",							// Fighter Chestrig (Black)
		// Rifle Attachments:
		"optic_Hamr",								// RCO								// Magnification: 10x
		//"muzzle_snds_H",							// Sound Suppressor (6.5 mm)
		"acc_pointer_IR",							// IR Laser Pointer
		// Pistol Attachments:
		"optic_MRD",								// MRD								// Magnification: 1x
		//"muzzle_snds_acp",						// Sound Suppressor (.45 ACP)
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