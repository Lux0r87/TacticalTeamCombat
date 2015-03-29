/*
	Function to end the mission for all players.

	Created by Lux0r
*/


private ["_sides","_winner"];

_sides	= [_this, 0] call BIS_fnc_param;
_winner	= [_this, 1] call BIS_fnc_param;

{
	_end = if (_x == _winner) then {"END1";} else {"LOSER";};	
	[_end, "TTC_CORE_fnc_endMission", _x, false] call BIS_fnc_MP;
} forEach _sides;