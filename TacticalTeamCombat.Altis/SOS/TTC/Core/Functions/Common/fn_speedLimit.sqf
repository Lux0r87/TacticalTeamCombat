/*
	Created by Lux0r
*/


private ["_veh","_speedLimit","_speed","_vel","_dir","_newVel"];

_veh		= [_this, 0] call BIS_fnc_param;
_speedLimit	= [_this, 1] call BIS_fnc_param;

//[["Function: %1", "TTC_CORE_fnc_speedLimit"], ["_veh = %1", _veh], ["_speedLimit = %1", _speedLimit]] call TTC_CORE_fnc_log;


while {true} do {
	_speed = speed _veh;

	if (_speed > _speedLimit) then {
		_vel = velocity _veh;
		_dir = direction _veh;

		_speed	= _speed - _speedLimit;
		_newVel	= [(_vel select 0) - (sin _dir * _speed), (_vel select 1) - (cos _dir * _speed), (_vel select 2)];
		[[_veh, _newVel], "TTC_CORE_fnc_setVelocity", _veh, false] call BIS_fnc_MP;
	};

	sleep 0.1;
};
