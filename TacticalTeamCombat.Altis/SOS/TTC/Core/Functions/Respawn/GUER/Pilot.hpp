class GUER_HelicopterPilot {
	displayName = "Helicopter Pilot";
	icon = "\A3\Ui_f\data\GUI\Cfg\Ranks\sergeant_gs.paa";

	weapons[] = {
		"hgun_PDW2000_F",							// PDW2000 9 mm
		"hgun_ACPC2_F",								// ACP-C2 .45
		"Binocular"									// Binoculars
	};
	magazines[] = {
		"9Rnd_45ACP_Mag",							// .45 ACP 9Rnd Mag
		"9Rnd_45ACP_Mag",							// .45 ACP 9Rnd Mag
		"9Rnd_45ACP_Mag",							// .45 ACP 9Rnd Mag
		"30Rnd_9x21_Mag",							// 9mm 30Rnd Mag
		"30Rnd_9x21_Mag",							// 9mm 30Rnd Mag
		"30Rnd_9x21_Mag",							// 9mm 30Rnd Mag
		"30Rnd_9x21_Mag",							// 9mm 30Rnd Mag
		"30Rnd_9x21_Mag",							// 9mm 30Rnd Mag
		"30Rnd_9x21_Mag",							// 9mm 30Rnd Mag
		"30Rnd_9x21_Mag",							// 9mm 30Rnd Mag
		"30Rnd_9x21_Mag",							// 9mm 30Rnd Mag
		"30Rnd_9x21_Mag"							// 9mm 30Rnd Mag
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
		"I_IR_Grenade",								// IR Grenade [AAF]
		"I_IR_Grenade",								// IR Grenade [AAF]
		"HandGrenade",								// RGO Frag Grenade
		"HandGrenade"								// RGO Frag Grenade
	};
	linkedItems[] = {
		"H_PilotHelmetHeli_I",						// Heli Pilot Helmet [AAF]
		"V_BandollierB_khk",						// Slash Bandolier (Coyote)
		// Rifle Attachments:
		"optic_Holosight_smg",						// Mk17 Holosight SMG				// Magnification:  1x - 2x
		//"muzzle_snds_L",							// Sound Suppressor (9 mm)
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
	uniformClass = "U_I_HeliPilotCoveralls";		// Heli Pilot Coveralls
	backpack = "";
};