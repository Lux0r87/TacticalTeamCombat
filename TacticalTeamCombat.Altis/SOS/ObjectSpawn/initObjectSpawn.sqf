/*
	Define global variables, that are used by different scripts from the object spawn.

	Created by Lux0r
	Modified by BauerMitFackel
*/


OS_disableThermal = ["DisableThermal", 1] call BIS_fnc_getParamValue;

// Array with all unit types that are allowed to spawn vehicles.
OS_allowVehicleSpawnWest = [
	"B_Soldier_SL_F",	// BLUFOR Squad Leader
	"B_Soldier_TL_F",	// BLUFOR Team Leader
	"B_recon_TL_F",		// BLUFOR Recon Team Leader
	"I_Soldier_SL_F",	// OPFOR Squad Leader
	"I_Soldier_TL_F",	// OPFOR Team Leader
	"I_recon_TL_F"		// OPFOR Recon Team Leader
];

// Array with all unit types that are allowed to spawn APCs.
OS_allowAPCSpawnWest = [];

// Array with all unit types that are allowed to spawn tanks.
OS_allowTankSpawnWest = [];

// Array with all unit types that are allowed to spawn helicopters.
OS_allowHeliSpawnWest = [
	"B_Pilot_F",		// BLUFOR Pilot
	"B_Helipilot_F",	// BLUFOR Helicopter Pilot
	"B_helicrew_F",		// BLUFOR Helicopter Crew
	"I_Pilot_F",		// OPFOR Pilot
	"I_helipilot_F",	// OPFOR Helicopter Pilot
	"I_helicrew_F"		// OPFOR Helicopter Crew
];

// Array with all unit types that are allowed to spawn jets.
OS_allowJetSpawnWest = [];

// Array with all unit types that are allowed to spawn boats.
OS_allowBoatSpawnWest = [];

// Spawn delay to prevent vehicle spam.
[] execVM "SOS\ObjectSpawn\spawnDelay.sqf";