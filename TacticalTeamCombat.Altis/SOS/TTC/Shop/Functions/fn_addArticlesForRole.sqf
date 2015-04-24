/*
    Created by Lux0r
*/


private ["_side","_roleId","_roleName"];

waitUntil {!(IsNull player) && (time > 0.0)};

_side		= side player;
_roleId		= player getVariable "TTC_roleId";
_roleName	= _roleId call TTC_CORE_fnc_getRoleNameById;

[] call compile preprocessFileLineNumbers format ["SOS\TTC\Shop\Configurations\%1\%2.sqf", _side, _roleName];