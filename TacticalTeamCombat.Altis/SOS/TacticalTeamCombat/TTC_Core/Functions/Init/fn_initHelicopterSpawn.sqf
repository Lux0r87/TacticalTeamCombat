/*
	Initialization script for helicopter spawn.
	Created by BauerMitFackel
*/

private ["_sign","_side"];

_sign = [_this, 0] call BIS_fnc_param;
_side = [_this, 1] call BIS_fnc_param;

diag_log format["TTC_CORE: initHelicopterSpawn: _sign = %1, _side = %2", _sign, _side];

// Client-side scripts:
[] call compile preprocessFileLineNumbers format["SOS\TacticalTeamCombat\Configurations\helicopterSpawn%1.sqf", _side];

// Iterate over every helicopter in the TTC_Helicopters array and add the corresponding action to the sign
{
	_label			= _x select 0;
	_vehicleType	= _x select 1;
	_texture		= _x select 2;
	_null = _sign addAction [_label, OS_fnc_spawnHelicopter, [_vehicleType, TTC_HelicopterSpawnLocation, false, _texture], 7, false, true]; 
} forEach TTC_Helicopters;

_sign allowDamage false; 
_sign setObjectTexture [0, TTC_HelicopterSignTexture];