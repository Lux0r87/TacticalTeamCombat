/*
	This script initializes the respawn inventory for the player.
	
	Created by Lux0r
*/


// Client-side:
if (hasInterface) then {
	private ["_unit","_side","_roleId"];

	_unit	= _this select 0;
	_side	= side _unit;
	_roleId	= _unit getVariable "TTC_roleId";

	// Use respawn inventory for the specific role.
	if (!isNil "_roleId") then {
		switch (_roleId) do {
			// Platoon Lead
			case PLATOON_LEADER_ID: {
				[_unit, format["%1_PL", _side]] call BIS_fnc_addRespawnInventory;
			};
			// Archer / Knight
			case TEAM_LEADER_ID	: {
				[_unit, format["%1_TL", _side]] call BIS_fnc_addRespawnInventory;
			};
			case MACHINE_GUNNER_ID: {
				[_unit, format["%1_MG", _side]] call BIS_fnc_addRespawnInventory;
			};
			case MISSILE_SPECIALIST_ID: {
				[_unit, format["%1_MS", _side]] call BIS_fnc_addRespawnInventory;
			};
			case COMBAT_ENGINEER_ID: {
				[_unit, format["%1_CE", _side]] call BIS_fnc_addRespawnInventory;
			};
			case MEDIC_ID: {
				[_unit, format["%1_MED", _side]] call BIS_fnc_addRespawnInventory;
			};
			// Recon
			case SCOUT_ID: {
				[_unit, format["%1_SCT", _side]] call BIS_fnc_addRespawnInventory;
			};
			case MARKSMAN_ID: {
				[_unit, format["%1_MM", _side]] call BIS_fnc_addRespawnInventory;
			};
			case PARAMEDIC_ID: {
				[_unit, format["%1_PMED", _side]] call BIS_fnc_addRespawnInventory;
			};
			// Pilots
			case PILOT_ID: {
				[_unit, format["%1_Pilot", _side]] call BIS_fnc_addRespawnInventory;
			};
			default {
				diag_log format["TTC_CORE - addRespawnInventory: TTC_roleId is unknown! _unit = %1, _side = %2", _unit, _side];
			};
		};
	} else {
		diag_log format["TTC_CORE - addRespawnInventory: TTC_roleId is Nil! _unit = %1, _side = %2", _unit, _side];
	};
};