/*
	Created by Lux0r
*/

private ["_triggers", "_statements"];

_triggers	= [_this, 0] call BIS_fnc_param;
_statements	= [_this, 1] call BIS_fnc_param;


// Iterate over all triggers.
{
	_x setTriggerStatements _statements;
} forEach _triggers ;