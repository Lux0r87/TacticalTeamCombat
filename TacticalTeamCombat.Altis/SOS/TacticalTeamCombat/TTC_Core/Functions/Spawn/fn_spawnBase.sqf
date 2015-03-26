/*
	Spawns the base for the given side.

	Created by Lux0r
*/

#define TTC_CORE_saveDistance 1500

private ["_side","_prefix","_mrkPos","_mrk","_respawnPos","_mrkName","_mrkColor","_dome","_dir","_domePos"];

_side	= [_this, 0] call BIS_fnc_param;
_prefix = [_side] call TTC_CORE_fnc_getPrefix;


_mrkPos	= getMarkerpos format["Base_%1", _side];
diag_log format["TTC_CORE: spawnBase: _side = %1, _prefix = %2, _mrkPos = %3", _side, _prefix, _mrkPos];

if (format ["%1", _mrkPos] != "[0,0,0]") then {
	// Create respawn position
	_mrk		= format["BaseSpawn_%1", _side];
	_respawnPos = [_side, _mrk] call BIS_fnc_addRespawnPosition;

	// Create marker
	_mrkName	= format ["mrk_Base_%1", _side];
	_mrkColor	= [_side, true] call BIS_fnc_sideColor;
	_mrk = [_mrkName, _mrkPos, "", _mrkColor, TTC_CORE_saveDistance, TTC_CORE_saveDistance, 0, "ELLIPSE", "Empty", 0.5] call TTC_CORE_fnc_createMarker;

	// Spawn dome
	_dome	= createVehicle ["Land_Dome_Small_F", _mrkPos, [], 0, "CAN_COLLIDE"];
	_dir	= [_dome, missionNamespace getVariable format["%1_VehicleSpawn_Helipad", _prefix]] call BIS_fnc_DirTo;
	_dome setDir _dir;
	_domePos = getPos _dome;
	_dome setVectorUp (surfaceNormal _domePos);
	_dome setPos [_domePos select 0, _domePos select 1, -0.3];
	_dome allowDamage false;

	// Only for test purpose! Easier to find the centre of the dome for a good position
	/*_pole	= createVehicle ["Metal_Pole_F", _mrkPos, [], 0, "CAN_COLLIDE"];
	_pole setVectorUp (surfaceNormal _mrkPos);*/

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