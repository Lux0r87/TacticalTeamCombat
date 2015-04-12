/*
	Created by Lux0r
*/


private ["_unit","_pWeap","_sWeap"];

_unit = [_this, 0] call BIS_fnc_param;


// Remove primary weapon (rifle).
_pWeap = primaryWeapon _unit;
_unit removeWeapon _pWeap;

// Remove secondary weapon (launcher).
_sWeap = secondaryWeapon _unit;
_unit removeWeapon _sWeap;

// Remove all assigned items (Map, GPS, NVG, ...).
removeAllAssignedItems _unit;