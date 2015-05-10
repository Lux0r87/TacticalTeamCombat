/*
	Add action to the given vehicle.

	Created by Lux0r
*/


private ["_vehicle","_className","_displayName"];

_vehicle		= [_this, 0] call BIS_fnc_param;
_className		= typeOf _vehicle;
_displayName	= getText(configFile >> "CfgVehicles" >> _className >> "displayName");


// Unlock vehicle.
_vehicle addAction [
	format ["<t color='#00FF00'>Unlock %1</t>", _displayName],
	{(_this select 0) lock false;},
	[],
	10,
	true,
	true,
	"",
	"(alive _target) &&
	(locked _target > 1) &&
	(_this distance _target) < ((sizeOf typeOf _target) / 2) &&
	((_target getVariable ['TTC_isOwner', objNull]) == _this)"
];
