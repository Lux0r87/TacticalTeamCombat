/*
	This script initializes the respawn inventory for the player.
	
	Created by Lux0r
*/


diag_log format["respawn.sqf: player = %1", player];

// Client-side: Define respawn positions and respawn inventory for specific roles.
if (!isDedicated) then {

	_rolesFile = "TTC_ROLES" call TTC_CORE_fnc_getConstantsFile;
	[] call compile preprocessFileLineNumbers _rolesFile;

	private ["_side","_roleId"];

	waitUntil {!(IsNull player) && (time > 0.0)};

	_side = side player;
	_roleId = player getVariable "TTC_roleId";	
	if (!isNil "_roleId") then {
		diag_log format["respawn.sqf: TTC_roleId is not Null! player = %1, _side = %2, _roleId = %3", player, _side, _roleId];
		
		switch (_roleId) do {
			// Platoon Lead
			case _PLATOON_LEADER_ID: {
				[player, format["%1_PL_SL", _side]] call bis_fnc_addRespawnInventory;
			};
			case _MEDIC_ID: {
				[player, format["%1_PL_Medic", _side]] call bis_fnc_addRespawnInventory;
			};
			// Ghost 1 + 2, Shadow 1 + 2
			case _TEAM_LEADER_ID	: {
				[player, format["%1_TL", _side]] call bis_fnc_addRespawnInventory;
			};
			case _MACHINE_GUNNER_ID: {
				[player, format["%1_MMG_Mk200", _side]] call bis_fnc_addRespawnInventory;
				[player, format["%1_MMG_MXSW", _side]] call bis_fnc_addRespawnInventory;
			};
			case _MISSILE_SPECIALIST_ID: {
				[player, format["%1_AT", _side]] call bis_fnc_addRespawnInventory;
			};
			case _COMBAT_ENGINEER_ID: {
				[player, format["%1_CombatEngineer", _side]] call bis_fnc_addRespawnInventory;
			};
			case _MEDIC_ID: {
				[player, format["%1_Medic", _side]] call bis_fnc_addRespawnInventory;
			};
			// Pilots
			case _PILOT_ID: {
				[player, format["%1_HelicopterPilot", _side]] call bis_fnc_addRespawnInventory;
			};
			default {
				diag_log format["respawn.sqf: SOS_role is unknown! player = %1, _side = %2", player, _side];
			};
		};
	} else {
		diag_log format["respawn.sqf: TTC_roleId is Null! player = %1, _side = %2", player, _side];
	};
} else {
	diag_log format["respawn.sqf: Is not dedicated! player = %1", player];
};