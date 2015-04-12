// Initialize Tactical Team Combat
[] call TTC_fnc_initTTC;

// Set 'false' if you want to disable "None" option for terrain
CHVD_allowNoGrass = false;

// Run the briefing file.
[] execVM "Briefing.sqf";

// Server-side scripts:
if (isServer) then {
	// Initialize time of day (chosen in the mission parameters).
	[] execVM "SOS\Time\setTime.sqf";

	// Set overcast, fog and rain (chosen in the mission parameters).
	[] execVM "SOS\Weather\setWeather.sqf";

	// Begin script that keeps the base clear of dropped items/weapons and destroyed vehicles.
	[] execVM "SOS\Clear\initClear.sqf";
};

// Client-side scripts:
if (hasInterface) then {
	// Initialize jump script.
	[] execVM "SOS\MiscScripts\jump.sqf";

	// Initialize Virtual Arsenal.
	//[] execVM "SOS\VirtualArsenal\initVirtualArsenal.sqf";
	
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

//Initialize LM Rating.
[] execVM "SOS\MiscScripts\lm_friend_rating.sqf";

// Initialize helicopter smoke support.
[] execVM "SOS\MiscScripts\lm_helo_support.sqf";

// Initialize LM Medic System.
[] execVM "SOS\MiscScripts\lm_medic_system.sqf";

// Initialize Mag Repack.
[] execVM "outlw_magRepack\MagRepack_init_sv.sqf";