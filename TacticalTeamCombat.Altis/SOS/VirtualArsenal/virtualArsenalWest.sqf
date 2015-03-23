/*
	The script contains public variables which define the available
	backpacks, weapons, magazines and items for all possible NATO roles.

	Created by Lux0r
*/

private [
	"_VA_Uniforms","_VA_Helmets","_VA_Shemags","_VA_Berets","_VA_AssaultBackpacks","_VA_CarryallBackpacks","_VA_Kitbags","_VA_Scopes","_VA_Scopes_SMG","_VA_Scopes_Marksman",
	"_VA_Rook40","_VA_P07","_VA_4five","_VA_Vermin","_VA_Sting","_VA_MXC","_VA_MX","_VA_MX_GL","_VA_Mk20C","_VA_Mk20","_VA_Mk20_GL","_VA_MX_SW","_VA_MXM",
	"_VA_Mk200","_VA_Mk18","_VA_Mines","_VA_Engi","_VA_Basic_Weapons","_VA_Basic_Magazines","_VA_Basic_Items","_VA_SMGs","_VA_Carbines","_VA_AssaultRifles","_VA_Rifles",
	"_VA_GrenadeLauncher","_VA_AutoRifles","_VA_SniperRifles"
];


// Arrays for convenience:

_VA_Uniforms = [
	"U_B_CombatUniform_mcam",			// Combat Fatigues (MTP)
	"U_B_CombatUniform_mcam_vest"		// Recon Fatigues (MTP)
];

_VA_Helmets = [
	//"H_HelmetB",						// ECH
	"H_HelmetB_camo"					// ECH (Camo)
	//"H_HelmetB_paint",				// ECH (Spraypaint)
	//"H_HelmetB_light",				// ECH (Light)
	//"H_HelmetB_grass",				// ECH (Grass)
	//"H_HelmetB_snakeskin",			// ECH (Snakeskin)
	//"H_HelmetB_desert",				// ECH (Desert)
	//"H_HelmetB_black",				// ECH (Black)
	//"H_HelmetB_sand"					// ECH (Sand)
];

_VA_Shemags = [
	"H_Shemag_khk",						// Shemag mask (Khaki)
	"H_Shemag_tan",						// Shemag mask (Tan)
	"H_Shemag_olive",					// Shemag (Olive)
	"H_Shemag_olive_hs",				// Shemag (Olive, Headset)
	"H_ShemagOpen_khk",					// Shemag (Khaki)
	"H_ShemagOpen_tan"					// Shemag (Tan)
];

_VA_Berets = [
	"H_Beret_blk",						// Beret (Black)
	"H_Beret_02",						// Beret [NATO]
	"H_Beret_Colonel"					// Beret [NATO] (Colonel)
];

_VA_AssaultBackpacks = [
	"B_AssaultPackG",					// Assault Pack
	"B_AssaultPack_khk",				// Assault Pack (Khaki)
	"B_AssaultPack_dgtl",				// Assault Pack (Digi)
	"B_AssaultPack_rgr",				// Assault Pack (Green)
	//"B_AssaultPack_sgg",				// Assault Pack (Sage)
	"B_AssaultPack_blk",				// Assault Pack (Black)
	"B_AssaultPack_cbr",				// Assault Pack (Coyote)
	"B_AssaultPack_mcamo",				// Assault Pack (MTP)
	"B_AssaultPack_ocamo"				// Assault Pack (Hex)
];

_VA_CarryallBackpacks = [
	"B_Carryall_ocamo",					// Carryall Backpack (Hex)
	"B_Carryall_oucamo",				// Carryall Backpack (Urban)
	"B_Carryall_mcamo",					// Carryall Backpack (MTP)
	"B_Carryall_oli",					// Carryall Backpack (Olive)
	"B_Carryall_khk",					// Carryall Backpack (Khaki)
	"B_Carryall_cbr"					// Carryall Backpack (Coyote)
];

_VA_Kitbags = [
	"B_Kitbag_rgr",						// Kitbag (Green)
	"B_Kitbag_mcamo",					// Kitbag (MTP)
	//"B_Kitbag_sgg",					// Kitbag (Sage)
	"B_Kitbag_cbr"						// Kitbag (Coyote)
];

_VA_Scopes = [
	"optic_MRD",						// MRD					// Magnification: 1x
	"optic_Yorris",						// Yorris J2			// Magnification: 1x
	"optic_Aco",						// ACO (Red)
	"optic_ACO_grn",					// ACO (Green)
	"optic_Holosight",					// MK17 Holosight		// Magnification:  1x - 2x
	"optic_MRCO",						// MRCO					// Magnification:  1x - 6x
	"optic_Hamr",						// RCO					// Magnification: 10x
	"optic_Arco"						// ARCO					// Magnification: 10x
];

_VA_Scopes_SMG = [
	"optic_Aco_smg",					// ACO SMG (Red)
	"optic_ACO_grn_smg",				// ACO SMG (Green)
	"optic_Holosight_smg"				// Mk17 Holosight SMG	// Magnification:  1x - 2x
];

_VA_Scopes_Marksman = [
	//"optic_SOS",						// SOS					// Magnification:  18x - 75x
	//"optic_LRPS",						// LRPS					// Magnification:  18x - 75x
	"optic_DMS",						// DMS					// Magnification:  1x - 12x
	"optic_NVS"							// NVS					// Magnification: 10x
];

_VA_Rook40 = [
	"hgun_Rook40_F"						// Rook-40 9 mm
	//"hgun_Rook40_snds_F"				// Rook-40 9 mm
];

_VA_P07 = [
	"hgun_P07_F"						// P07 9 mm
	//"hgun_P07_snds_F"					// P07 9 mm
];

_VA_4five = [
	"hgun_Pistol_heavy_01_F",			// 4-five .45
	"hgun_Pistol_heavy_01_MRD_F"		// 4-five .45
	//"hgun_Pistol_heavy_01_snds_F"		// 4-five .45
];

_VA_Vermin = [
	"SMG_01_F",							// Vermin SMG .45 ACP
	"SMG_01_Holo_F",					// Vermin SMG .45 ACP
	//"SMG_01_Holo_pointer_snds_F",		// Vermin SMG .45 ACP
	"SMG_01_ACO_F"						// Vermin SMG .45 ACP
];

_VA_Sting = [
	"SMG_02_F",							// Sting 9 mm
	"SMG_02_ACO_F",						// Sting 9 mm
	"SMG_02_ARCO_pointg_F"				// Sting 9 mm
];

_VA_MXC = [
	"arifle_MXC_F",						// MXC 6.5 mm
	"arifle_MXC_Holo_F",				// MXC 6.5 mm
	"arifle_MXC_Holo_pointer_F",		// MXC 6.5 mm
	"arifle_MXC_ACO_F",					// MXC 6.5 mm
	//"arifle_MXC_Holo_pointer_snds_F",	// MXC 6.5 mm
	//"arifle_MXC_SOS_point_snds_F",	// MXC 6.5 mm
	//"arifle_MXC_ACO_pointer_snds_F",	// MXC 6.5 mm
	"arifle_MXC_ACO_pointer_F",			// MXC 6.5 mm
	"arifle_MXC_Black_F"				// MXC 6.5 mm
];

_VA_MX = [
	"arifle_MX_F",						// MX 6.5 mm
	"arifle_MX_pointer_F",				// MX 6.5 mm
	"arifle_MX_Holo_pointer_F",			// MX 6.5 mm
	"arifle_MX_Hamr_pointer_F",			// MX 6.5 mm
	"arifle_MX_ACO_pointer_F",			// MX 6.5 mm
	"arifle_MX_ACO_F",					// MX 6.5 mm
	//"arifle_MX_ACO_pointer_snds_F",	// MX 6.5 mm
	//"arifle_MX_RCO_pointer_snds_F",	// MX 6.5 mm
	"arifle_MX_Black_F",				// MX 6.5 mm (Black)
	"arifle_MX_Black_Hamr_pointer_F"	// MX 6.5 mm (Black)
];

_VA_MX_GL = [
	"arifle_MX_GL_F",					// MX 3GL 6.5 mm
	"arifle_MX_GL_ACO_F",				// MX 3GL 6.5 mm
	"arifle_MX_GL_ACO_pointer_F",		// MX 3GL 6.5 mm
	"arifle_MX_GL_Hamr_pointer_F",		// MX 3GL 6.5 mm
	//"arifle_MX_GL_Holo_pointer_snds_F",	// MX 3GL 6.5 mm
	"arifle_MX_GL_Black_Hamr_pointer_F",// MX 3GL 6.5 mm (Black)
	"arifle_MX_GL_Black_F"				// MX 3GL 6.5 mm (Black)
];

_VA_Mk20C = [
	"arifle_Mk20C_F",					// Mk20C 5.56 mm (C)
	"arifle_Mk20C_plain_F",				// Mk20C 5.56 mm
	"arifle_Mk20C_ACO_F",				// Mk20C 5.56 mm (C)
	"arifle_Mk20C_ACO_pointer_F"		// Mk20C 5.56 mm (C)
];

_VA_Mk20 = [
	"arifle_Mk20_F",					// Mk20 5.56 mm (C)
	"arifle_Mk20_plain_F",				// Mk20 5.56 mm (C)
	"arifle_Mk20_pointer_F",			// Mk20 5.56 mm (C)
	"arifle_Mk20_Holo_F",				// Mk20 5.56 mm (C)
	"arifle_Mk20_ACO_F",				// Mk20 5.56 mm (C)
	"arifle_Mk20_ACO_pointer_F",		// Mk20 5.56 mm (C)
	"arifle_Mk20_MRCO_F",				// Mk20 5.56 mm (C)
	"arifle_Mk20_MRCO_plain_F",			// Mk20 5.56 mm (C)
	"arifle_Mk20_MRCO_pointer_F"		// Mk20 5.56 mm (C)
];

_VA_Mk20_GL = [
	"arifle_Mk20_GL_F",					// Mk20 EGLM 5.56 mm (C)
	"arifle_Mk20_GL_plain_F",			// Mk20 EGLM 5.56 mm (C)
	"arifle_Mk20_GL_MRCO_pointer_F",	// Mk20 EGLM 5.56 mm (C)
	"arifle_Mk20_GL_ACO_F"				// Mk20 EGLM 5.56 mm (C)
];

_VA_MX_SW = [
	"arifle_MX_SW_F",					// MX SW 6.5 mm
	"arifle_MX_SW_pointer_F",			// MX SW 6.5 mm
	"arifle_MX_SW_Hamr_pointer_F",		// MX SW 6.5 mm
	"arifle_MX_SW_Black_F",				// MX SW 6.5 mm (Black)
	"arifle_MX_SW_Black_Hamr_pointer_F"	// MX SW 6.5 mm (Black)
];

_VA_MXM = [
	"arifle_MXM_F",						// MXM 6.5 mm
	"arifle_MXM_Hamr_pointer_F",		// MXM 6.5 mm
	//"arifle_MXM_SOS_pointer_F",		// MXM 6.5 mm
	//"arifle_MXM_RCO_pointer_snds_F",	// MXM 6.5 mm
	"arifle_MXM_DMS_F",					// MXM 6.5 mm
	"arifle_MXM_Black_F"				// MXM 6.5 mm (Black)
];

_VA_Mk200 = [
	"LMG_Mk200_F",						// Mk200 6.5 mm
	"LMG_Mk200_MRCO_F",					// Mk200 6.5 mm
	"LMG_Mk200_pointer_F"				// Mk200 6.5 mm
];

_VA_Mk18 = [
	"srifle_EBR_F",						// Mk18 ABR 7.62 mm
	"srifle_EBR_ACO_F",					// Mk18 ABR 7.62 mm
	"srifle_EBR_MRCO_pointer_F",		// Mk18 ABR 7.62 mm
	//"srifle_EBR_SOS_F",				// Mk18 ABR 7.62 mm
	"srifle_EBR_ARCO_pointer_F",		// Mk18 ABR 7.62 mm
	//"srifle_EBR_ARCO_pointer_snds_F",	// Mk18 ABR 7.62 mm
	"srifle_EBR_DMS_F",					// Mk18 ABR 7.62 mm
	"srifle_EBR_Hamr_pointer_F"			// Mk18 ABR 7.62 mm
	//"srifle_EBR_DMS_pointer_snds_F"	// Mk18 ABR 7.62 mm
];

_VA_Mines = [
	//"SatchelCharge_Remote_Mag",		// Explosive Satchel
	//"DemoCharge_Remote_Mag",			// Explosive Charge
	"ATMine_Range_Mag",					// AT Mine
	"APERSMine_Range_Mag",				// APERS Mine
	"APERSBoundingMine_Range_Mag",		// APERS Bounding Mine
	"APERSTripMine_Wire_Mag",			// APERS Tripwire Mine
	"SLAMDirectionalMine_Wire_Mag"		// M6 SLAM Mine
];

_VA_Engi = [
	"ToolKit",							// Tool Kit
	"MineDetector"						// Mine Detector
];

// Define basic weapons, magazines and items available to (almost) all roles.
_VA_Basic_Weapons = _VA_Rook40 + _VA_P07 + [
	"Binocular"						// Binoculars
	//"Rangefinder"					// Rangefinder
];
_VA_Basic_Magazines = [
	// Ammo
	"16Rnd_9x21_Mag",					// 9mm 16Rnd Mag
	"30Rnd_9x21_Mag",					// 9mm 30Rnd Mag
	"6Rnd_45ACP_Cylinder",				// .45 ACP 6Rnd Cylinder
	"9Rnd_45ACP_Mag",					// .45 ACP 9Rnd Mag
	"11Rnd_45ACP_Mag",					// .45 ACP 11Rnd Mag
	"30Rnd_45ACP_Mag_SMG_01",			// .45 ACP 30Rnd Vermin Mag
	"30Rnd_45ACP_Mag_SMG_01_Tracer_Green",	// .45 30Rnd VerminTracers (Green) Mag
	"30Rnd_556x45_Stanag",				// 5.56mm 30rnd STANAG Mag
	"30Rnd_556x45_Stanag_Tracer_Yellow",	// 5.56mm 30rnd Tracer (Yellow) Mag
	"30Rnd_65x39_caseless_mag",			// 6.5mm 30Rnd STANAG Mag
	"30Rnd_65x39_caseless_mag_Tracer",	// 6.5mm 30Rnd Tracer (Red) Mag
	"100Rnd_65x39_caseless_mag",		// 6.5mm 100Rnd Belt Case
	"100Rnd_65x39_caseless_mag_Tracer",	// 6.5mm 100Rnd Tracer (Red) Belt Case
	"200Rnd_65x39_cased_Box",			// 6.5mm 200Rnd Belt Case
	"200Rnd_65x39_cased_Box_Tracer",	// 6.5mm 200Rnd Belt Case Tracer (Yellow)
	"20Rnd_762x51_Mag",					// 7.62mm 20Rnd Mag
	"NLAW_F",							// PCML Missile
	"RPG32_F",							// RPG-42 Rocket
	"RPG32_HE_F",						// RPG-42 HE Rocket
	"Titan_AA",							// Titan AA Missile
	"Titan_AP",							// Titan AP Missile
	"Titan_AT",							// Titan AT Missile

	// Throw Items
	"HandGrenade",						// RGO Frag Grenade
	"MiniGrenade",						// Mini Grenade
	"SmokeShellRed",					// Smoke Grenade (Red)
	"SmokeShellGreen",					// Smoke Grenade (Green)
	"SmokeShellYellow",					// Smoke Grenade (Yellow)
	"SmokeShellPurple",					// Smoke Grenade (Purple)
	"SmokeShellBlue",					// Smoke Grenade (Blue)
	"SmokeShellOrange",					// Smoke Grenade (Orange)
	"B_IR_Grenade",						// IR Grenade [NATO]
	//"I_IR_Grenade",					// IR Grenade [AAF]
	"Chemlight_red",					// Chemlight (Red)
	"Chemlight_green",					// Chemlight (Green)
	"Chemlight_yellow",					// Chemlight (Yellow)
	"Chemlight_blue",					// Chemlight (Blue)

	// Grenade Launcher HE
	"1Rnd_HE_Grenade_shell",			// 40mm HE Grenade Round
	"3Rnd_HE_Grenade_shell",			// 40mm 3Rnd HE Grenade

	// Grenade Launcher Smoke
	"1Rnd_SmokeRed_Grenade_shell",		// Smoke Round (Red)
	"3Rnd_SmokeRed_Grenade_shell",		// 3Rnd 3GL Smoke Rounds (Red)
	"1Rnd_SmokeGreen_Grenade_shell",	// Smoke Round (Green)
	"3Rnd_SmokeGreen_Grenade_shell",	// 3Rnd 3GL Smoke Rounds (Green)
	"1Rnd_SmokeYellow_Grenade_shell",	// Smoke Round (Yellow)
	"3Rnd_SmokeYellow_Grenade_shell",	// 3Rnd 3GL Smoke Rounds (Yellow)
	"1Rnd_SmokePurple_Grenade_shell",	// Smoke Round (Purple)
	"3Rnd_SmokePurple_Grenade_shell",	// 3Rnd 3GL Smoke Rounds (Purple)
	"1Rnd_SmokeBlue_Grenade_shell",		// Smoke Round (Blue)
	"3Rnd_SmokeBlue_Grenade_shell",		// 3Rnd 3GL Smoke Rounds (Blue)
	"1Rnd_SmokeOrange_Grenade_shell",	// Smoke Round (Orange)
	"3Rnd_SmokeOrange_Grenade_shell",	// 3Rnd 3GL Smoke Rounds (Orange)

	// Grenade Launcher Flare
	"UGL_FlareWhite_F",					// Flare Round (White)
	"3Rnd_UGL_FlareWhite_F",			// 3Rnd 3GL Flares (White)
	"UGL_FlareRed_F",					// Flare Round (Red)
	"3Rnd_UGL_FlareRed_F",				// 3Rnd 3GL Flares (Red)
	"UGL_FlareGreen_F",					// Flare Round (Green)
	"3Rnd_UGL_FlareGreen_F",			// 3Rnd 3GL Flares (Green)
	"UGL_FlareYellow_F",				// Flare Round (Yellow)
	"3Rnd_UGL_FlareYellow_F",			// 3Rnd 3GL Flares (Yellow)
	"UGL_FlareCIR_F",					// Flare Round (IR)
	"3Rnd_UGL_FlareCIR_F"				// 3Rnd 3GL Flares (IR)
];
_VA_Basic_Items = [
	// Items
	"ItemCompass",						// Compass
	//"ItemGPS",						// GPS
	"ItemMap",							// Map
	"ItemRadio",						// Radio
	"ItemWatch",						// Watch
	"NVGoggles",						// NV Goggles (Brown)
	"NVGoggles_OPFOR",					// NV Goggles (Black)
	"NVGoggles_INDEP",					// NV Goggles (Green)
	"FirstAidKit",						// First Aid Kit
	//"Medikit",						// Medikit
	//"ToolKit",						// Tool Kit
	//"MineDetector",					// Mine Detector
	
	// Goggles
	"G_Diving",							// Diving Goggles
	"G_Shades_Black",					// Shades (Black)
	"G_Shades_Blue",					// Shades (Blue)
	"G_Sport_Blackred",					// Sport Shades (Vulcan)
	"G_Tactical_Clear",					// Tactical Glasses
	"G_Spectacles",						// Spectacle Glasses
	"G_Spectacles_Tinted",				// Tinted Spectacles
	"G_Combat",							// Combat Goggles
	"G_Lowprofile",						// Low Profile Goggles
	"G_Shades_Green",					// Shades (Green)
	"G_Shades_Red",						// Shades (Red)
	"G_Squares",						// Square Spectacles
	"G_Squares_Tinted",					// Square Shades
	"G_Sport_BlackWhite",				// Sport Shades (Shadow)	
	"G_Sport_Blackyellow",				// Sport Shades (Poison)	
	"G_Sport_Greenblack",				// Sport Shades (Yetti)	
	"G_Sport_Checkered",				// Sport Shades (Style)	
	"G_Sport_Red",						// Sport Shades (Fire)	
	"G_Tactical_Black",					// Tactical Shades
	"G_Aviator",						// Aviator Glasses
	"G_Lady_Mirror",					// Ladies Shades (Iridium)
	"G_Lady_Dark",						// Ladies Shades (Sea)
	"G_Lady_Red",						// Ladies Shades (Fire)
	"G_Lady_Blue",						// Ladies Shades (Ice)
	"G_Balaclava_blk",					// Balaclava
	"G_Balaclava_lowprofile",			// Balaclava
	"G_Balaclava_combat",				// Balaclava
	"G_Balaclava_oli",					// Balaclava
	"G_Bandanna_aviator",				// Bandanna
	"G_Bandanna_beast",					// Bandanna
	"G_Bandanna_tan",					// Bandanna
	"G_Bandanna_sport",					// Bandanna
	"G_Bandanna_blk",					// Bandanna
	"G_Bandanna_oli",					// Bandanna
	"G_Bandanna_shades",				// Bandanna

	// Muzzle Attachments
	//"muzzle_snds_acp",				// Sound Suppressor (.45 ACP)
	//"muzzle_snds_L",					// Sound Suppressor (9 mm)
	//"muzzle_snds_M",					// Sound Suppressor (5.56 mm)
	//"muzzle_snds_H",					// Sound Suppressor (6.5 mm)
	//"muzzle_snds_H_SW",				// Sound Suppressor LMG (6.5 mm)	// MX SW
	//"muzzle_snds_H_MG",				// Sound Suppressor LMG (6.5 mm)	// Mk 200
	//"muzzle_snds_B",					// Sound Suppressor (7.62 mm)

	// Rail Attachments
	"acc_pointer_IR",					// IR Laser Pointer
	"acc_flashlight",					// Flashlight

	// Vests
	"V_Rangemaster_belt",				// Rangemaster Belt							// Side(s): Blufor
	//"V_BandollierB_khk",				// Slash Bandolier (Khaki)					// Side(s): All
	//"V_BandollierB_cbr",				// Slash Bandolier (Coyote)					// Side(s): -
	//"V_BandollierB_rgr",				// Slash Bandolier (Green)					// Side(s): Blufor
	//"V_BandollierB_blk",				// Slash Bandolier (Black)					// Side(s): All
	//"V_BandollierB_oli",				// Slash Bandolier (Olive)					// Side(s): Independent
	//"V_PlateCarrier1_rgr",			// Carrier Lite (Green)						// Side(s): Blufor
	//"V_PlateCarrier2_rgr",			// Carrier Rig (Green)						// Side(s): Blufor
	//"V_PlateCarrier3_rgr",			// Carrier Rig (Green)						// Side(s): -
	//"V_PlateCarrierGL_rgr",			// Carrier GL Rig (Green)					// Side(s): Blufor
	//"V_PlateCarrier1_blk",			// Carrier Lite (Black)						// Side(s): -
	//"V_PlateCarrierSpec_rgr",			// Carrier Special Rig (Green)				// Side(s): Blufor
	//"V_Chestrig_khk",					// Chest rig (Khaki)						// Side(s): Opfor
	"V_Chestrig_rgr",					// Chest rig (Green)						// Side(s): Blufor
	"V_Chestrig_blk",					// Fighter Chestrig (Black)					// Side(s): All
	"V_Chestrig_oli"					// Fighter Chestrig (Olive)					// Side(s): All
	//"V_TacVest_khk",					// Tactical Vest (Khaki)					// Side(s): Opfor, Independent
	//"V_TacVest_brn",					// Tactical Vest (Brown)					// Side(s): Opfor
	//"V_TacVest_oli",					// Tactical Vest (Olive)					// Side(s): Independent
	//"V_TacVest_blk",					// Tactical Vest (Black)					// Side(s): All
	//"V_TacVest_camo",					// Tactical Vest (Camo)						// Side(s): -
	//"V_TacVest_blk_POLICE",			// Tactical Vest (Police)					// Side(s): -
	//"V_TacVestIR_blk",				// Raven Vest								// Side(s): -
	//"V_TacVestCamo_khk",				// Camouflaged Vest							// Side(s): -
	//"V_HarnessO_brn",					// LBV Harness								// Side(s): Opfor
	//"V_HarnessOGL_brn",				// LBV Grenadier Harness					// Side(s): Opfor
	//"V_HarnessO_gry",					// LBV Harness (Gray)						// Side(s): Opfor
	//"V_HarnessOGL_gry",				// LBV Grenadier Harness (Gray)				// Side(s): Opfor
	//"V_HarnessOSpec_brn",				// ELBV Harness								// Side(s): Opfor
	//"V_HarnessOSpec_gry",				// ELBV Harness (Gray)						// Side(s): -
	//"V_PlateCarrierIA1_dgtl",			// GA Carrier Lite (Digi)					// Side(s): Independent
	//"V_PlateCarrierIA2_dgtl",			// GA Carrier Rig (Digi)					// Side(s): Independent
	//"V_PlateCarrierIAGL_dgtl",		// GA Carrier GL Rig (Digi)					// Side(s): Independent
	//"V_RebreatherB",					// Rebreather [NATO]						// Side(s): Blufor
	//"V_RebreatherIR",					// Rebreather [CSAT]						// Side(s): Opfor
	//"V_RebreatherIA",					// Rebreather [AAF]							// Side(s): Independent
	//"V_PlateCarrier_Kerry",			// US Plate Carrier Rig (Kerry)				// Side(s): Blufor (Story)
	//"V_PlateCarrierL_CTRG",			// CTRG Plate Carrier Rig Mk.1 (Light)		// Side(s): Blufor
	//"V_PlateCarrierH_CTRG",			// CTRG Plate Carrier Rig Mk.2 (Heavy)		// Side(s): Blufor
	//"V_I_G_resistanceLeader_F",		// Tactical Vest (Stavrou)					// Side(s): Independent
	//"V_Press_F"						// Vest (Press)								// Side(s): -
];

_VA_SMGs			= _VA_Vermin + _VA_Sting;

_VA_Carbines		= _VA_MXC + _VA_Mk20C;

_VA_AssaultRifles	= _VA_MX + _VA_Mk20;

_VA_Rifles			= _VA_Carbines + _VA_AssaultRifles;

_VA_GrenadeLauncher	= _VA_MX_GL + _VA_Mk20_GL;

_VA_AutoRifles		= _VA_MX_SW + _VA_Mk200;

_VA_SniperRifles	= _VA_MXM + _VA_Mk18;

// ----------------------------------------------------------------------------------------------------
// NATO default weapons. Requirement for "removeUnauthorizedGear.sqf".
VA_WeaponsWest = _VA_Basic_Weapons + _VA_SMGs + _VA_Rifles + _VA_GrenadeLauncher + _VA_AutoRifles + _VA_SniperRifles + [
	"launch_NLAW_F",					// PCML
	"launch_RPG32_F",					// RPG-42 Alamut
	"Binocular",						// Binoculars
	"Rangefinder"						// Rangefinder
];

// ----------------------------------------------------------------------------------------------------
// Arrays with backpacks, weapons, magazines and items for all different roles of this side:

// Platoon Lead - Squad Leader
VA_PL_SL_Backpacks = _VA_AssaultBackpacks + [
	// Add more/new backpacks here.
];
VA_PL_SL_Weapons = _VA_Basic_Weapons + _VA_4five + _VA_SMGs + _VA_GrenadeLauncher + [
	"Rangefinder"						// Rangefinder
];
VA_PL_SL_Magazines = _VA_Basic_Magazines + [
	// Add more/new weapons here.
];
VA_PL_SL_Items = _VA_Basic_Items + _VA_Uniforms + _VA_Scopes + _VA_Scopes_SMG + _VA_Helmets + _VA_Berets + [
	//"ItemGPS"							// GPS
];

// Platoon - Medic
VA_PL_Medic_Backpacks = _VA_AssaultBackpacks + [
	// Add more/new backpacks here.
];
VA_PL_Medic_Weapons = _VA_Basic_Weapons + _VA_SMGs + _VA_Rifles + [
	"Rangefinder"						// Rangefinder
];
VA_PL_Medic_Magazines = _VA_Basic_Magazines + [
	// Add more/new magazines here.
];
VA_PL_Medic_Items = _VA_Basic_Items + _VA_Uniforms + _VA_Scopes + _VA_Scopes_SMG + _VA_Helmets + [
	"U_B_CombatUniform_mcam_tshirt",	// Combat Fatigues (MTP) (Tee)
	//"ItemGPS",						// GPS
	"Medikit"							// Medikit
];

// Platoon Lead - Missile Specialist (AA)
VA_PL_AA_Backpacks = _VA_CarryallBackpacks + [
	// Add more/new backpacks here.
];
VA_PL_AA_Weapons = _VA_Basic_Weapons + _VA_SMGs + _VA_Rifles + [
	"launch_B_Titan_F",					// Titan MPRL Launcher
	"Rangefinder"						// Rangefinder
];
VA_PL_AA_Magazines = _VA_Basic_Magazines + [
	// Add more/new magazines here.
];
VA_PL_AA_Items = _VA_Basic_Items + _VA_Uniforms + _VA_Scopes + _VA_Scopes_SMG + _VA_Helmets + [
	// Add more/new items here.
];

// Ghost 1+2 Teamleader
VA_TL_Backpacks = _VA_Kitbags + [
	// Add more/new backpacks here.
];
VA_TL_Weapons = _VA_Basic_Weapons + _VA_4five + _VA_SMGs + _VA_GrenadeLauncher + [
	"Rangefinder"						// Rangefinder
];
VA_TL_Magazines = _VA_Basic_Magazines + [
	// Add more/new weapons here.
];
VA_TL_Items = _VA_Basic_Items + _VA_Uniforms + _VA_Scopes + _VA_Scopes_SMG + _VA_Helmets + [
	//"ItemGPS"							// GPS
];

// Ghost 1+2 - MMG
VA_MMG_Backpacks = _VA_AssaultBackpacks + [
	// Add more/new backpacks here.
];
VA_MMG_Weapons = _VA_Basic_Weapons + _VA_AutoRifles + [
	// Add more/new weapons here.
];
VA_MMG_Magazines = _VA_Basic_Magazines + [
	// Add more/new magazines here.
];
VA_MMG_Items = _VA_Basic_Items + _VA_Uniforms + _VA_Scopes + _VA_Scopes_SMG + _VA_Helmets + [
	// Add more/new items here.
];

// Ghost 1+2 - AssistantMMG
VA_Assmmg_Backpacks = _VA_CarryallBackpacks + [
	// Add more/new backpacks here.
];
VA_Assmmg_Weapons = _VA_Basic_Weapons + _VA_SMGs + _VA_Rifles + [
	"Rangefinder"						// Rangefinder
];
VA_Assmmg_Magazines = _VA_Basic_Magazines + [
	// Add more/new magazines here.
];
VA_Assmmg_Items = _VA_Basic_Items + _VA_Uniforms + _VA_Scopes + _VA_Scopes_SMG + _VA_Helmets + [
	//"ItemGPS"							// GPS
];

// Ghost 1+2 - Antitank
VA_AT_Backpacks = _VA_AssaultBackpacks + [
	// Add more/new backpacks here.
];
VA_AT_Weapons = _VA_Basic_Weapons + _VA_SMGs + _VA_Rifles + [
	//"launch_NLAW_F",					// PCML
	"launch_RPG32_F"					// RPG-42 Alamut
];
VA_AT_Magazines = _VA_Basic_Magazines + [
	// Add more/new magazines here.
];
VA_AT_Items = _VA_Basic_Items + _VA_Uniforms + _VA_Scopes + _VA_Scopes_SMG + _VA_Helmets + [
	"U_B_CombatUniform_mcam_tshirt"		// Combat Fatigues (MTP) (Tee)
];

// Ghost 1+2 - Medic
VA_Medic_Backpacks = _VA_AssaultBackpacks + [
	// Add more/new backpacks here.
];
VA_Medic_Weapons = _VA_Basic_Weapons +_VA_SMGs +  _VA_Rifles + [
	// Add more/new weapons here.
];
VA_Medic_Magazines = _VA_Basic_Magazines + [
	// Add more/new magazines here.
];
VA_Medic_Items = _VA_Basic_Items + _VA_Uniforms + _VA_Scopes + _VA_Scopes_SMG + _VA_Helmets + [
	"U_B_CombatUniform_mcam_tshirt",	// Combat Fatigues (MTP) (Tee)
	//"ItemGPS",						// GPS
	"Medikit"							// Medikit
];

// Ghost 1+2 - CombatEngineer
VA_CombatEngineer_Backpacks = _VA_AssaultBackpacks + _VA_CarryallBackpacks + [
	// Add more/new backpacks here.
];
VA_CombatEngineer_Weapons = _VA_Basic_Weapons + _VA_SMGs + _VA_Rifles + [
	// Add more/new weapons here.
];
VA_CombatEngineer_Magazines = _VA_Basic_Magazines + _VA_Mines + [
	// Add more/new magazines here.
];
VA_CombatEngineer_Items = _VA_Basic_Items + _VA_Uniforms + _VA_Scopes + _VA_Scopes_SMG + _VA_Engi + _VA_Helmets + [
	// Add more/new items here.
];

// Ghost 1+2 - Grenadier
VA_Grenadier_Backpacks = _VA_AssaultBackpacks + [
	// Add more/new backpacks here.
];
VA_Grenadier_Weapons = _VA_Basic_Weapons + _VA_SMGs + _VA_GrenadeLauncher + [
	// Add more/new weapons here.
];
VA_Grenadier_Magazines = _VA_Basic_Magazines + [
	// Add more/new magazines here.
];
VA_Grenadier_Items = _VA_Basic_Items + _VA_Uniforms + _VA_Scopes + _VA_Scopes_SMG + _VA_Helmets + [
	// Add more/new items here.
];

// Reaper
VA_Reaper_Backpacks = [
	"B_Parachute" 						// Steerable Parachute
];
VA_Reaper_Weapons = _VA_Basic_Weapons + _VA_SMGs + [
	// Add more/new weapons here.
];
VA_Reaper_Magazines = _VA_Basic_Magazines + [
	// Add more/new magazines here.
];
VA_Reaper_Items = _VA_Basic_Items + _VA_Scopes_SMG + [
	"H_PilotHelmetHeli_B",				// Heli Pilot Helmet [NATO]
	"U_B_HeliPilotCoveralls"			// Heli Pilot Coveralls
];