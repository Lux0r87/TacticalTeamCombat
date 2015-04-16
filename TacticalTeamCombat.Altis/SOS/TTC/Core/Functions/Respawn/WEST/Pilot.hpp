class WEST_HelicopterPilot {
	displayName = "Helicopter Pilot";
	icon = "\A3\Ui_f\data\GUI\Cfg\Ranks\sergeant_gs.paa";

	weapons[] = {
		"SMG_01_F",									// Vermin SMG .45 ACP
		"hgun_P07_F",								// P07 9 mm
		"Binocular"									// Binoculars
	};
	magazines[] = {
		"16Rnd_9x21_Mag",							// 9mm 16Rnd Mag
		"16Rnd_9x21_Mag",							// 9mm 16Rnd Mag
		"16Rnd_9x21_Mag",							// 9mm 16Rnd Mag
		"30Rnd_45ACP_Mag_SMG_01",					// .45 ACP 30Rnd Vermin Mag
		"30Rnd_45ACP_Mag_SMG_01",					// .45 ACP 30Rnd Vermin Mag
		"30Rnd_45ACP_Mag_SMG_01",					// .45 ACP 30Rnd Vermin Mag
		"30Rnd_45ACP_Mag_SMG_01",					// .45 ACP 30Rnd Vermin Mag
		"30Rnd_45ACP_Mag_SMG_01",					// .45 ACP 30Rnd Vermin Mag
		"30Rnd_45ACP_Mag_SMG_01_tracer_green",		// .45 30Rnd VerminTracers (Green) Mag
		"30Rnd_45ACP_Mag_SMG_01_tracer_green",		// .45 30Rnd VerminTracers (Green) Mag
		"30Rnd_45ACP_Mag_SMG_01_tracer_green",		// .45 30Rnd VerminTracers (Green) Mag
		"30Rnd_45ACP_Mag_SMG_01_tracer_green"		// .45 30Rnd VerminTracers (Green) Mag
	};
	items[] = {
		"FirstAidKit",								// First Aid Kit
		"FirstAidKit",								// First Aid Kit
		"FirstAidKit",								// First Aid Kit
		"SmokeShellGreen",							// Smoke Grenade (Green)
		"SmokeShellGreen",							// Smoke Grenade (Green)
		"SmokeShellGreen",							// Smoke Grenade (Green)
		"SmokeShellOrange",							// Smoke Grenade (Orange)
		"SmokeShellOrange",							// Smoke Grenade (Orange)
		"SmokeShellOrange",							// Smoke Grenade (Orange)
		"Chemlight_green",							// Chemlight (Green)
		"Chemlight_green",							// Chemlight (Green)
		"B_IR_Grenade",								// IR Grenade [NATO]
		"B_IR_Grenade",								// IR Grenade [NATO]
		"HandGrenade",								// RGO Frag Grenade
		"HandGrenade"								// RGO Frag Grenade
	};
	linkedItems[] = {
		"H_PilotHelmetHeli_B",						// Heli Pilot Helmet [NATO]
		"V_Chestrig_blk",							// Fighter Chestrig (Black)
		// Rifle Attachments:
		"optic_Holosight_smg",						// Mk17 Holosight SMG				// Magnification:  1x - 2x
		//"muzzle_snds_acp",						// Sound Suppressor (.45 ACP)
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
	uniformClass = "U_B_HeliPilotCoveralls";		// Heli Pilot Coveralls
	backpack = "";
};