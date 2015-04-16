/*
	Created by Lux0r
*/


private ["_veh","_speedLimit","_speed","_vel","_dir","_veh"];

_veh		= [_this, 0] call BIS_fnc_param;
_speedLimit	= [_this, 1] call BIS_fnc_param;


while {true} do {
	_speed = speed _veh;

	if (_speed > _speedLimit) then {
		_vel = velocity _veh;
		_dir = direction _veh;

		_speed = _speed - _speedLimit;
		_veh setVelocity [(_vel select 0)-(sin _dir*_speed),(_vel select 1)- (cos _dir*_speed),(_vel select 2)];
	};

	sleep 0.1;
};