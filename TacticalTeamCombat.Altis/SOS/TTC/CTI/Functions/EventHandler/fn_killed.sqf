/*
	Created by Lux0r
*/


private ["_unit","_killer","_sector","_corpses"];

_unit			= [_this, 0] call BIS_fnc_param;
_killer			= [_this, 1] call BIS_fnc_param;

/*[
	["Function: %1", "TTC_CTI_fnc_killed"], ["_unit = %1", _unit], ["_killer = %1", _killer],
] call TTC_CORE_fnc_log;*/


if (!isPlayer _unit) then {
	_sector		= _unit getVariable "TTC_CTI_sector";
	_corpses	= _sector getVariable ["TTC_CTI_sector_corpses", []];

	// Add the dead unit to the sector's corpses variable.
	_corpses pushBack [time, typeOf _unit];

	// Update the corpse variable.
	_sector setVariable ["TTC_CTI_sector_corpses", _corpses];
};
