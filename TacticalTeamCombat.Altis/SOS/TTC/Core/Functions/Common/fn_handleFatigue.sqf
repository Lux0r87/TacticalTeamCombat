/*
	Created by Lux0r
*/


private ["_unit","_fatigueMax"];

_unit		= [_this, 0] call BIS_fnc_param;
_fatigueMax = ["TTC_CORE_fatigueMax", 50] call BIS_fnc_getParamValue;


if (_fatigueMax <= 0) then {
	_unit enableFatigue false;
} else {
	[_unit,_fatigueMax] spawn {
		private ["_unit","_fatigueMax"];

		_unit		= [_this, 0] call BIS_fnc_param;
		_fatigueMax	= ([_this, 1] call BIS_fnc_param) / 100;

		while {true} do {
			if ((getFatigue _unit) > _fatigueMax) then {
				_unit setFatigue _fatigueMax;
			};

			sleep 1;
		};
	};
};