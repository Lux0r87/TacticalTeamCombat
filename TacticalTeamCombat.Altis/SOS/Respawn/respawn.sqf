/*
	This script initializes the respawn positions and respawn inventory for the player.
	
	Created by Lux0r
*/


diag_log format["respawn.sqf: player = %1", player];

// Client-side: Define respawn positions and respawn inventory for specific roles.
if (!isDedicated) then {
	private ["_side","_role"];

	waitUntil {!(IsNull player) && (time > 0.0)};

	_side = side player;
	_role = player getVariable "SOS_role";	
	if (!isNil "_role") then {
		diag_log format["respawn.sqf: SOS_role is not Null! player = %1, _side = %2, _role = %3", player, _side, _role];

		switch (_role) do {
			// Platoon Lead
			case "PlatoonLeader": {
				[player, "BaseSpawn"] call BIS_fnc_addRespawnPosition;
				[player, format["BaseSpawn_%1", _side]] call BIS_fnc_addRespawnPosition;
				[player, format["%1_PL_SL", _side]] call bis_fnc_addRespawnInventory;
			};
			case "PlatoonMedic": {
				[player, format["BaseSpawn_%1", _side]] call BIS_fnc_addRespawnPosition;
				[player, format["%1_PL_Medic", _side]] call bis_fnc_addRespawnInventory;
			};
			case "PlatoonAA": {
				[player, format["BaseSpawn_%1", _side]] call BIS_fnc_addRespawnPosition;
				[player, format["%1_PL_AA", _side]] call bis_fnc_addRespawnInventory;
			};
			// Ghost 1 + 2, Shadow 1 + 2
			case "TeamLeader": {
				[player, format["BaseSpawn_%1", _side]] call BIS_fnc_addRespawnPosition;
				[player, format["%1_TL", _side]] call bis_fnc_addRespawnInventory;
			};
			case "MMG": {
				[player, format["BaseSpawn_%1", _side]] call BIS_fnc_addRespawnPosition;
				[player, format["%1_MMG_Mk200", _side]] call bis_fnc_addRespawnInventory;
				[player, format["%1_MMG_MXSW", _side]] call bis_fnc_addRespawnInventory;
			};
			case "AntiTank": {
				[player, format["BaseSpawn_%1", _side]] call BIS_fnc_addRespawnPosition;
				[player, format["%1_AT", _side]] call bis_fnc_addRespawnInventory;
			};
			case "CombatEngineer": {
				[player, format["BaseSpawn_%1", _side]] call BIS_fnc_addRespawnPosition;
				[player, format["%1_CombatEngineer", _side]] call bis_fnc_addRespawnInventory;
			};
			case "Grenadier": {
				[player, format["BaseSpawn_%1", _side]] call BIS_fnc_addRespawnPosition;
				[player, format["%1_Grenadier", _side]] call bis_fnc_addRespawnInventory;
			};
			case "AssistantMMG": {
				[player, format["BaseSpawn_%1", _side]] call BIS_fnc_addRespawnPosition;
				[player, format["%1_AssistantMMG", _side]] call bis_fnc_addRespawnInventory;
			};
			case "Medic": {
				[player, format["BaseSpawn_%1", _side]] call BIS_fnc_addRespawnPosition;
				[player, format["%1_Medic", _side]] call bis_fnc_addRespawnInventory;
			};
			// Pilots
			case "HelicopterPilot": {
				//[player, format["HeliSpawn_%1", _side]] call BIS_fnc_addRespawnPosition;
				[player, format["BaseSpawn_%1", _side]] call BIS_fnc_addRespawnPosition;
				[player, format["%1_HelicopterPilot", _side]] call bis_fnc_addRespawnInventory;
			};
			default {
				diag_log format["respawn.sqf: SOS_role is unknown! player = %1, _side = %2", player, _side];
			};
		};
	} else {
		diag_log format["respawn.sqf: SOS_role is Null! player = %1, _side = %2", player, _side];
	};
} else {
	diag_log format["respawn.sqf: Is not dedicated! player = %1", player];
};