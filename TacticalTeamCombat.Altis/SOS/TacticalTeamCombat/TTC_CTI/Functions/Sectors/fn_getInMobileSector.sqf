/*
	Created by Lux0r
*/


#define TTC_timeOut 30

private ["_veh","_position","_unit","_turret","_sector","_sectorSide","_side"];

_veh		= [_this, 0] call BIS_fnc_param;
_position	= [_this, 1] call BIS_fnc_param;
_unit		= [_this, 2] call BIS_fnc_param;
_turret		= [_this, 3] call BIS_fnc_param;

_sector		= _veh getVariable ["TTC_sector", objNull];

/*[
	["TTC_CTI: getInMobileSector:"], ["_veh = %1", _veh], ["_position = %1", _position], ["_unit = %1", _unit], ["_turret = %1", _turret], ["_sector = %1", _sector]
] call TTC_CORE_fnc_log;*/


if (!isNull _sector) then {
	_sectorSide	= _sector getVariable "TTC_CTI_sector_side";
	_side		= side _unit;

	// Move out from vehicle, if the unit is not from the side which controls the mobile sector.
	if (_sectorSide != _side) then {
		if (_position == "driver") then {
			_unit action ["engineOff", _veh];
		};

		moveOut _unit;
	} else {
		// Check if the vehicle is (possibly) not moving.
		if (!(_veh getVariable ["TTC_isMoving", false])) then {
			TTC_CTI_mobileSector_timeOut = TTC_timeOut;
			[_veh, _unit, _sector, _sectorSide] spawn TTC_CTI_fnc_mobileSectorIsMoving;
		};
	};
};