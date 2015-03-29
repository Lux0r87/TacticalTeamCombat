// Bluefor:
class WEST_PL_SL {
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

class WEST_TL {
	displayName = "Team Leader";
	icon = "\A3\Ui_f\data\GUI\Cfg\Ranks\sergeant_gs.paa";

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
		"H_HelmetB_camo",							// ECH (Camo)
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
	backpack = "B_Kitbag_rgr";						// Kitbag (Green)
};

class WEST_MMG_Mk200 {
	displayName = "Autorifleman Mk200";
	icon = "\A3\Ui_f\data\GUI\Cfg\Ranks\private_gs.paa";

	weapons[] = {
		"LMG_Mk200_F",								// Mk200 6.5 mm
		"hgun_P07_F",								// P07 9 mm
		"Binocular"									// Binoculars
	};
	magazines[] = {
		"16Rnd_9x21_Mag",							// 9mm 16Rnd Mag
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
		"H_HelmetB_camo",							// ECH (Camo)
		"V_Chestrig_blk",							// Fighter Chestrig (Black)
		// Rifle Attachments:
		"optic_Hamr",								// RCO								// Magnification: 10x
		//"muzzle_snds_H_MG",						// Sound Suppressor LMG (6.5 mm)	// Mk 200
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

class WEST_MMG_MXSW {
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

class WEST_AT {
	displayName = "Rifleman (AT)";
	icon = "\A3\Ui_f\data\GUI\Cfg\Ranks\private_gs.paa";

	weapons[] = {
		"arifle_MX_F",								// MX 6.5 mm
		"hgun_P07_F",								// P07 9 mm
		"launch_RPG32_F",							// RPG-42 Alamut
		"Binocular"									// Binoculars
	};
	magazines[] = {
		"RPG32_F",									// RPG-42 Rocket
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
		"RPG32_F",									// RPG-42 Rocket
		"RPG32_HE_F"								// RPG-42 HE Rocket
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
	uniformClass = "U_B_CombatUniform_mcam_tshirt";	// Combat Fatigues (MTP) (Tee)
	backpack = "B_AssaultPack_rgr";					// Assault Pack (Green)
};

class WEST_CombatEngineer {
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

class WEST_Medic {
	displayName = "Medic";
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
		"30Rnd_65x39_caseless_mag",					// 6.5mm 30Rnd STANAG Mag
		"30Rnd_65x39_caseless_mag_Tracer",			// 6.5mm 30Rnd Tracer (Red) Mag
		"30Rnd_65x39_caseless_mag_Tracer",			// 6.5mm 30Rnd Tracer (Red) Mag
		"30Rnd_65x39_caseless_mag_Tracer",			// 6.5mm 30Rnd Tracer (Red) Mag
		"30Rnd_65x39_caseless_mag_Tracer",			// 6.5mm 30Rnd Tracer (Red) Mag
		"30Rnd_65x39_caseless_mag_Tracer",			// 6.5mm 30Rnd Tracer (Red) Mag
		"30Rnd_65x39_caseless_mag_Tracer"			// 6.5mm 30Rnd Tracer (Red) Mag
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
	uniformClass = "U_B_CombatUniform_mcam_tshirt";	// Combat Fatigues (MTP) (Tee)
	backpack = "B_AssaultPack_rgr";					// Assault Pack (Green)
};

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