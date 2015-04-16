/*
	This script initializes the respawn inventory for the player.
	
	Created by Lux0r
*/


// Client-side:
if (hasInterface) then {
	private ["_side","_roleId"];
	waitUntil {!(IsNull player) && (time > 0.0)};

	_side	= side player;
	_roleId	= player getVariable "TTC_roleId";

	// Use respawn inventory for the specific role.
	if (!isNil "_roleId") then {
		switch (_roleId) do {
			// Platoon Lead
			case PLATOON_LEADER_ID: {
				[player, format["%1_PL", _side]] call BIS_fnc_addRespawnInventory;
			};
			// Archer / Knight
			case TEAM_LEADER_ID	: {
				[player, format["%1_TL", _side]] call BIS_fnc_addRespawnInventory;
			};
			case MACHINE_GUNNER_ID: {
				[player, format["%1_MG_Mk200", _side]] call BIS_fnc_addRespawnInventory;
				[player, format["%1_MG_MXSW", _side]] call BIS_fnc_addRespawnInventory;
			};
			case MISSILE_SPECIALIST_ID: {
				[player, format["%1_MS", _side]] call BIS_fnc_addRespawnInventory;
			};
			case COMBAT_ENGINEER_ID: {
				[player, format["%1_CE", _side]] call BIS_fnc_addRespawnInventory;
			};
			case MEDIC_ID: {
				[player, format["%1_MED", _side]] call BIS_fnc_addRespawnInventory;
			};
			// Recon
			case SCOUT_ID: {
				[player, format["%1_SCT", _side]] call BIS_fnc_addRespawnInventory;
			};
			case MARKSMAN_ID: {
				[player, format["%1_MM", _side]] call BIS_fnc_addRespawnInventory;
			};
			case PARAMEDIC_ID: {
				[player, format["%1_PMED", _side]] call BIS_fnc_addRespawnInventory;
			};
			// Pilots
			case PILOT_ID: {
				[player, format["%1_Pilot", _side]] call BIS_fnc_addRespawnInventory;
			};
			default {
				diag_log format["TTC_CORE - addRespawnInventory: TTC_roleId is unknown! player = %1, _side = %2", player, _side];
			};
		};
	} else {
		diag_log format["TTC_CORE - addRespawnInventory: TTC_roleId is Nil! player = %1, _side = %2", player, _side];
	};
};