/*
	Spawns the base for the given side.

	Created by Lux0r
*/

#define TTC_BASE_safetyDistance 1200

private ["_side","_prefix","_location","_basePos","_mrk","_respawnPos","_mrkName","_mrkColor","_dome","_dir","_domePos"];

_side	= [_this, 0] call BIS_fnc_param;


_prefix		= [_side] call TTC_CORE_fnc_getPrefix;
_location	= [] call TTC_CORE_fnc_getLocation;

// Compile configuration file
[] call compile preprocessFileLineNumbers format["SOS\TacticalTeamCombat\TTC_Base\Locations\%1.sqf", _location];

// Get base position
_basePos	= missionNamespace getVariable [format["TTC_BASE_%1", _side], [0,0]];

if (format ["%1", _basePos] != "[0,0]") then {
	// Create respawn position
	_mrk		= format["BaseSpawn_%1", _side];
	_respawnPos = [_side, _mrk] call BIS_fnc_addRespawnPosition;

	// Create global marker
	_mrkName	= format ["mrk_Base_%1", _side];
	_mrkColor	= [_side, true] call BIS_fnc_sideColor;
	_mrk		= [_mrkName, _basePos, "", _mrkColor, TTC_BASE_safetyDistance, TTC_BASE_safetyDistance, 0, "ELLIPSE", "Empty", 0.3] call TTC_CORE_fnc_createMarker;

	// Spawn dome
	_dome	= createVehicle ["Land_Dome_Small_F", _basePos, [], 0, "CAN_COLLIDE"];
	_dir	= [_dome, missionNamespace getVariable format["%1_VehicleSpawn_Helipad", _prefix]] call BIS_fnc_DirTo;
	_dome setDir _dir;
	_domePos = getPos _dome;
	_dome setVectorUp (surfaceNormal _domePos);
	_dome setPos [_domePos select 0, _domePos select 1, -0.3];
	_dome allowDamage false;

	// Only for test purpose! Easier to find the centre of the dome for a good position
	/*_pole	= createVehicle ["Metal_Pole_F", _basePos, [], 0, "CAN_COLLIDE"];
	_pole setVectorUp (surfaceNormal _basePos);*/

	// Lock the doors
	_dome setVariable ['bis_disabled_Door_1',1,true];
	_dome setVariable ['bis_disabled_Door_2',1,true];

	// Wait before unlocking the doors
	sleep TTC_saveTime;
	_dome setVariable ['bis_disabled_Door_1',0,true];
	_dome setVariable ['bis_disabled_Door_2',0,true];

	// Delete trigger, area and module
	deleteVehicle (missionNamespace getVariable format["%1_Base_ZoneProtection_Trigger2", _prefix]);
	deleteVehicle (missionNamespace getVariable format["%1_Base_ZoneProtection_Area2", _prefix]);
	deleteVehicle (missionNamespace getVariable format["%1_Base_ZoneProtection2", _prefix]);
};