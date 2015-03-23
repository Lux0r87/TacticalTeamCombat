// Add respawn positions.
[] execVM "SOS\Respawn\respawn.sqf";

// Set 'false' if you want to disable "None" option for terrain
CHVD_allowNoGrass = false;

// Initialize global variables for different scripts.
initGlobalVariables = [] execVM "SOS\MiscScripts\initGlobalVariables.sqf";

// Run the briefing file.
[] execVM "Briefing.sqf";

// Initialize Tactical Team Combat
[] execVM "SOS\TacticalTeamCombat\initTTC.sqf";

// Server-side scripts:
if (isServer) then {
	// Initialize time of day (chosen in the mission parameters). Default: 14
	_startingTimeHour = ["TimeOfDay", 17] call BIS_fnc_getParamValue;
	setDate [2035, 7, 6, _startingTimeHour, 0];

	// Set overcast, fog and rain (chosen in the mission parameters).
	[] execVM "SOS\Weather\setWeather.sqf";

	// Begin script that keeps the base clear of dropped items/weapons and destroyed vehicles.
	[] execVM "SOS\Clear\initClear.sqf";
};

// Client-side scripts:
if (hasInterface) then {
	// Initialize jump script.
	[] execVM "SOS\MiscScripts\jump.sqf";

	// Initialize unit icon
	[] execVM "SOS\MiscScripts\initUnitIcon.sqf";

	// Initialize Virtual Arsenal.
	[] execVM "SOS\VirtualArsenal\initVirtualArsenal.sqf";
	
	// Firing in base protection.
	[] execVM "SOS\MiscScripts\noFireZone.sqf";

	// Aircraft resupply zones.
	[] execVM "SOS\MiscScripts\aircraftResupplyZone.sqf";

	// Initialize the texture of the uniform.
	[] execVM "SOS\Textures\initUniformTexture.sqf";

	// Disable AI radio chatter.
	player disableConversation true;
	player setVariable ["BIS_noCoreConversations", true];

	// Enable ghost mode, teleport and free camera for server admin.
	[player] call compile preprocessFileLineNumbers "SOS\AdminActions\main.sqf";
};

// Scripts for all machines:

// Manage groups and groupIcons.
[] execVM "SOS\Groups\initGroups.sqf";

//Initialize LM Rating.
[] execVM "SOS\MiscScripts\lm_friend_rating.sqf";

// Initialize helicopter smoke support.
[] execVM "SOS\MiscScripts\lm_helo_support.sqf";

// Initialize LM Medic System.
[] execVM "SOS\MiscScripts\lm_medic_system.sqf";

// Initialize global variables for the object spawn.
[] execVM "SOS\ObjectSpawn\initObjectSpawn.sqf";

// Initialize Mag Repack.
[] execVM "outlw_magRepack\MagRepack_init_sv.sqf";

// Start TPWCAS.
_suppression_enabled	= ["Suppression_Enabled", 1] call BIS_fnc_getParamValue;
tpwcas_mode				= ["Suppression_Mode", 2] call BIS_fnc_getParamValue;

if (_suppression_enabled == 1) then {
	diag_log format ["%1 - starting TPWCAS_A3 with tpwcas_mode [%2]", time, tpwcas_mode];
	[tpwcas_mode] execVM "tpwcas\tpwcas_script_init.sqf";

	// enable AI Suppression statistics logging (once every 60 seconds)
	if (tpwcas_mode == 2 || isServer) then {
		waitUntil {!(isNil "bdetect_init_done")};

		[] spawn tpwcas_fnc_log_benchmark;
	};
};