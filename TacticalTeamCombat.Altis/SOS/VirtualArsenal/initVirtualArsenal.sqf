/*
	This script initializes the Virtual Arsenal and adds it to the defined objects.

	IMPORTANT:
	There must be a script available, which contains the backpacks, weapons, magazines and items for all roles of the players side.
	E.g.: virtualArsenalWest.sqf, virtualArsenalEast.sqf, virtualArsenalGuer.sqf, virtualArsenalCiv.sqf

	Created by Lux0r
*/


// Run this script only on client-side.
if (!isDedicated) then {
	private ["_objects","_gear","_backpacks","_weapons","_magazines","_items"];
	_objects = [AmmoBox1, AmmoBox2, AmmoBox3, AmmoBox4, AmmoBox5, AmmoBox6, B_HelicopterSpawn_Sign, I_HelicopterSpawn_Sign];

	waitUntil {!IsNull player && alive player};

	_side = side player;
	if !(_side in [sideLogic, sideEnemy]) then {
		[] call compile preprocessFileLineNumbers format["SOS\VirtualArsenal\virtualArsenal%1.sqf", _side];

		_role = player getVariable "SOS_role";		
		if (!isNil "_role") then {
			diag_log format["initVirtualArsenal: SOS_role is not Null! player = %1, _side = %2, _role = %3", player, _side, _role];

			_gear = switch (_role) do {
				// Platoon Lead
				case "PlatoonLeader":	{[VA_PL_SL_Backpacks, VA_PL_SL_Weapons, VA_PL_SL_Magazines, VA_PL_SL_Items];};
				case "PlatoonMedic":	{[VA_PL_Medic_Backpacks, VA_PL_Medic_Weapons, VA_PL_Medic_Magazines, VA_PL_Medic_Items];};
				case "PlatoonAA":		{[VA_PL_AA_Backpacks, VA_PL_AA_Weapons, VA_PL_AA_Magazines, VA_PL_AA_Items];};

				// Ghost 1 + 2, Shadow 1 + 2
				case "TeamLeader":		{[VA_TL_Backpacks, VA_TL_Weapons, VA_TL_Magazines, VA_TL_Items];};
				case "MMG":			    {[VA_MMG_Backpacks, VA_MMG_Weapons, VA_MMG_Magazines, VA_MMG_Items];};
				case "AntiTank":		{[VA_AT_Backpacks, VA_AT_Weapons, VA_AT_Magazines, VA_AT_Items];};
				case "CombatEngineer":  {[VA_CombatEngineer_Backpacks, VA_CombatEngineer_Weapons, VA_CombatEngineer_Magazines, VA_CombatEngineer_Items];};
				case "AssistantMMG":	{[VA_Assmmg_Backpacks, VA_Assmmg_Weapons, VA_Assmmg_Magazines, VA_Assmmg_Items];};
				case "Medic":			{[VA_Medic_Backpacks, VA_Medic_Weapons, VA_Medic_Magazines, VA_Medic_Items];};
				case "Grenadier":		{[VA_Grenadier_Backpacks, VA_Grenadier_Weapons, VA_Grenadier_Magazines, VA_Grenadier_Items];};

				// Pilots
				case "HelicopterPilot":	{[VA_Reaper_Backpacks, VA_Reaper_Weapons, VA_Reaper_Magazines, VA_Reaper_Items];};
				default 				{[[], [], [], []]};
			};

			_backpacks	= _gear select 0;
			_weapons	= _gear select 1;
			_magazines	= _gear select 2;
			_items		= _gear select 3;

			{
				[_x, _backpacks] call BIS_fnc_addVirtualBackpackCargo;
				[_x, _weapons] call BIS_fnc_addVirtualWeaponCargo;
				[_x, _magazines] call BIS_fnc_addVirtualMagazineCargo;
				[_x, _items] call BIS_fnc_addVirtualItemCargo;
			} forEach _objects;

			// Remove unauthorized gear from the player.
			[_backpacks, _weapons, _items] execVM "SOS\VirtualArsenal\removeUnauthorizedGear.sqf";
		} else {
			diag_log format["initVirtualArsenal: SOS_role is Null! player = %1, _side = %2", player, _side];
		};
	};
};