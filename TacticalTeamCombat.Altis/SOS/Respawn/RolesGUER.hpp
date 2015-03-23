// Independent:
class GUER_PL_SL {
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

class GUER_PL_Medic {
	displayName = "Platoon Medic";
	icon = "\A3\Ui_f\data\GUI\Cfg\Ranks\private_gs.paa";

	weapons[] = {
		"arifle_TRG21_F",							// TRG-21 5.56 mm
		"hgun_ACPC2_F",								// ACP-C2 .45
		"Rangefinder"								// Rangefinder
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
		"30Rnd_556x45_Stanag",						// 5.56mm 30rnd STANAG Mag
		"30Rnd_556x45_Stanag_Tracer_Yellow",		// 5.56mm 30rnd Tracer (Yellow) Mag
		"30Rnd_556x45_Stanag_Tracer_Yellow",		// 5.56mm 30rnd Tracer (Yellow) Mag
		"30Rnd_556x45_Stanag_Tracer_Yellow",		// 5.56mm 30rnd Tracer (Yellow) Mag
		"30Rnd_556x45_Stanag_Tracer_Yellow",		// 5.56mm 30rnd Tracer (Yellow) Mag
		"30Rnd_556x45_Stanag_Tracer_Yellow",		// 5.56mm 30rnd Tracer (Yellow) Mag
		"30Rnd_556x45_Stanag_Tracer_Yellow"			// 5.56mm 30rnd Tracer (Yellow) Mag
	};
	items[] = {
		"SmokeShellGreen",							// Smoke Grenade (Green)
		"SmokeShellGreen",							// Smoke Grenade (Green)
		"SmokeShellGreen",							// Smoke Grenade (Green)
		"SmokeShellOrange",							// Smoke Grenade (Orange)
		"SmokeShellOrange",							// Smoke Grenade (Orange)
		"SmokeShellOrange",							// Smoke Grenade (Orange)
		"HandGrenade",								// RGO Frag Grenade
		"HandGrenade",								// RGO Frag Grenade
		"HandGrenade",								// RGO Frag Grenade
		// -------------------- Backpack Items --------------------
		"Medikit",									// Medikit
		"FirstAidKit",								// First Aid Kit
		"FirstAidKit",								// First Aid Kit
		"FirstAidKit",								// First Aid Kit
		"FirstAidKit",								// First Aid Kit
		"FirstAidKit",								// First Aid Kit
		"FirstAidKit",								// First Aid Kit
		"FirstAidKit",								// First Aid Kit
		"FirstAidKit",								// First Aid Kit
		"FirstAidKit",								// First Aid Kit
		"FirstAidKit"								// First Aid Kit
	};
	linkedItems[] = {
		"H_HelmetIA",								// MICH
		"V_BandollierB_khk",						// Slash Bandolier (Coyote)
		// Rifle Attachments:
		"optic_Arco",								// ARCO								// Magnification: 10x
		//"muzzle_snds_M",							// Sound Suppressor (5.56 mm)
		//"acc_pointer_IR",							// IR Laser Pointer
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

class GUER_PL_AA {
	displayName = "Platoon Missile Specialist (AA)";
	icon = "\A3\Ui_f\data\GUI\Cfg\Ranks\private_gs.paa";

	weapons[] = {
		"arifle_TRG21_F",							// TRG-21 5.56 mm
		"hgun_ACPC2_F",								// ACP-C2 .45
		"launch_B_Titan_F",							// Titan MPRL Launcher
		"Rangefinder"								// Rangefinder
	};
	magazines[] = {
		"Titan_AA",									// Titan AA Missile
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
		"SmokeShellOrange",							// Smoke Grenade (Orange)
		"SmokeShellOrange",							// Smoke Grenade (Orange)
		"HandGrenade",								// RGO Frag Grenade
		"HandGrenade",								// RGO Frag Grenade
		"HandGrenade",								// RGO Frag Grenade
		// -------------------- Backpack Items --------------------
		"Titan_AA",									// Titan AA Missile
		"Titan_AA",									// Titan AA Missile
		"Titan_AA"									// Titan AA Missile
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
	backpack = "B_Carryall_mcamo";					// Carryall Backpack (MTP)
};

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

class GUER_MMG_Mk200 {
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

class GUER_MMG_MXSW {
	displayName = "Autorifleman MX SW";
	icon = "\A3\Ui_f\data\GUI\Cfg\Ranks\private_gs.paa";

	weapons[] = {
		"arifle_MX_SW_F",							// MX SW 6.5 mm
		"hgun_ACPC2_F",								// ACP-C2 .45
		"Binocular"									// Binoculars
	};
	magazines[] = {
		"9Rnd_45ACP_Mag",							// .45 ACP 9Rnd Mag
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
		"H_HelmetIA",								// MICH
		"V_BandollierB_khk",						// Slash Bandolier (Coyote)
		// Rifle Attachments:
		"optic_Arco",								// ARCO								// Magnification: 10x
		//"muzzle_snds_H_SW",						// Sound Suppressor LMG (6.5 mm)	// MX SW
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

class GUER_AT {
	displayName = "Rifleman (AT)";
	icon = "\A3\Ui_f\data\GUI\Cfg\Ranks\private_gs.paa";

	weapons[] = {
		"arifle_TRG21_F",							// TRG-21 5.56 mm
		"hgun_ACPC2_F",								// ACP-C2 .45
		"launch_RPG32_F",							// RPG-42 Alamut
		"Binocular"									// Binoculars
	};
	magazines[] = {
		"RPG32_F",									// RPG-42 Rocket
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
		"RPG32_F",									// RPG-42 Rocket
		"RPG32_HE_F"								// RPG-42 HE Rocket
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

class GUER_CombatEngineer {
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

class GUER_AssistantMMG {
	displayName = "Assistant MMG";
	icon = "\A3\Ui_f\data\GUI\Cfg\Ranks\private_gs.paa";

	weapons[] = {
		"arifle_TRG21_F",							// TRG-21 5.56 mm
		"hgun_ACPC2_F",								// ACP-C2 .45
		"Rangefinder"								// Rangefinder
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
		"HandGrenade"								// RGO Frag Grenade
	};
	linkedItems[] = {
		"H_HelmetIA",								// MICH
		"V_BandollierB_khk",						// Slash Bandolier (Coyote)
		// Rifle Attachments:
		"optic_Arco",								// ARCO								// Magnification: 10x
		//"muzzle_snds_M",							// Sound Suppressor (5.56 mm)
		"acc_pointer_IR",							// IR Laser Pointer
		// Pistol Attachments:
		//"muzzle_snds_acp",							// Sound Suppressor (.45 ACP)
		// Items:
		"NVGoggles_INDEP",							// NV Goggles (Green)
		//"ItemGPS",								// GPS
		"ItemMap",									// Map
		"ItemCompass",								// Compass
		"ItemWatch",								// Watch
		"ItemRadio"									// Radio
	};
	uniformClass = "U_BG_leader";					// Guerilla Uniform
	backpack = "B_Carryall_mcamo";					// Carryall Backpack (MTP)
};

class GUER_Medic {
	displayName = "Medic";
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
		"30Rnd_556x45_Stanag",						// 5.56mm 30rnd STANAG Mag
		"30Rnd_556x45_Stanag_Tracer_Yellow",		// 5.56mm 30rnd Tracer (Yellow) Mag
		"30Rnd_556x45_Stanag_Tracer_Yellow",		// 5.56mm 30rnd Tracer (Yellow) Mag
		"30Rnd_556x45_Stanag_Tracer_Yellow",		// 5.56mm 30rnd Tracer (Yellow) Mag
		"30Rnd_556x45_Stanag_Tracer_Yellow",		// 5.56mm 30rnd Tracer (Yellow) Mag
		"30Rnd_556x45_Stanag_Tracer_Yellow",		// 5.56mm 30rnd Tracer (Yellow) Mag
		"30Rnd_556x45_Stanag_Tracer_Yellow"			// 5.56mm 30rnd Tracer (Yellow) Mag
	};
	items[] = {
		"SmokeShellGreen",							// Smoke Grenade (Green)
		"SmokeShellGreen",							// Smoke Grenade (Green)
		"SmokeShellGreen",							// Smoke Grenade (Green)
		"SmokeShellBlue",							// Smoke Grenade (Blue)
		"SmokeShellBlue",							// Smoke Grenade (Blue)
		"SmokeShellBlue",							// Smoke Grenade (Blue)
		"HandGrenade",								// RGO Frag Grenade
		"HandGrenade",								// RGO Frag Grenade
		"HandGrenade",								// RGO Frag Grenade
		// -------------------- Backpack Items --------------------
		"Medikit",									// Medikit
		"FirstAidKit",								// First Aid Kit
		"FirstAidKit",								// First Aid Kit
		"FirstAidKit",								// First Aid Kit
		"FirstAidKit",								// First Aid Kit
		"FirstAidKit",								// First Aid Kit
		"FirstAidKit",								// First Aid Kit
		"FirstAidKit",								// First Aid Kit
		"FirstAidKit",								// First Aid Kit
		"FirstAidKit",								// First Aid Kit
		"FirstAidKit"								// First Aid Kit
	};
	linkedItems[] = {
		"H_HelmetIA",								// MICH
		"V_BandollierB_khk",						// Slash Bandolier (Coyote)
		// Rifle Attachments:
		"optic_Arco",								// ARCO								// Magnification: 10x
		//"muzzle_snds_M",							// Sound Suppressor (5.56 mm)
		"acc_pointer_IR",							// IR Laser Pointer
		// Pistol Attachments:
		//"muzzle_snds_acp",							// Sound Suppressor (.45 ACP)
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

class GUER_Grenadier {
	displayName = "Grenadier";
	icon = "\A3\Ui_f\data\GUI\Cfg\Ranks\corporal_gs.paa";

	weapons[] = {
		"arifle_TRG21_GL_F",						// TRG-21 EGLM 5.56 mm
		"hgun_ACPC2_F",								// ACP-C2 .45
		"Binocular"									// Binoculars
	};
	magazines[] = {
		"9Rnd_45ACP_Mag",							// .45 ACP 9Rnd Mag
		"9Rnd_45ACP_Mag",							// .45 ACP 9Rnd Mag
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
		"HandGrenade"								// RGO Frag Grenade
	};
	linkedItems[] = {
		"H_HelmetIA",								// MICH
		"V_BandollierB_khk",						// Slash Bandolier (Coyote)
		// Rifle Attachments:
		"optic_Arco",								// ARCO								// Magnification: 10x
		//"muzzle_snds_M",							// Sound Suppressor (5.56 mm)
		"acc_pointer_IR",							// IR Laser Pointer
		// Pistol Attachments:
		//"muzzle_snds_acp",							// Sound Suppressor (.45 ACP)
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