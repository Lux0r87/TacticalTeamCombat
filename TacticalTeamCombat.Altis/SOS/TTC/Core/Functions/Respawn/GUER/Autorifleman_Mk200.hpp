class GUER_MG_Mk200 {
	displayName = "Autorifleman Mk200";
	icon = "\A3\Ui_f\data\GUI\Cfg\Ranks\private_gs.paa";

	weapons[] = {
		"LMG_Mk200_F",								// Mk200 6.5 mm
		"hgun_ACPC2_F",								// ACP-C2 .45
		"Binocular"									// Binoculars
	};
	magazines[] = {
		"9Rnd_45ACP_Mag",							// .45 ACP 9Rnd Mag
		"200Rnd_65x39_cased_Box",					// 6.5mm 200Rnd Belt Case
		"200Rnd_65x39_cased_Box",					// 6.5mm 200Rnd Belt Case
		"200Rnd_65x39_cased_Box_Tracer",			// 6.5mm 200Rnd Belt Case Tracer (Yellow)
		"200Rnd_65x39_cased_Box_Tracer"				// 6.5mm 200Rnd Belt Case Tracer (Yellow)
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
		"H_HelmetIA",								// MICH
		"V_BandollierB_khk",						// Slash Bandolier (Coyote)
		// Rifle Attachments:
		"optic_Arco",								// ARCO								// Magnification: 10x
		//"muzzle_snds_H_MG",						// Sound Suppressor LMG (6.5 mm)	// Mk 200
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