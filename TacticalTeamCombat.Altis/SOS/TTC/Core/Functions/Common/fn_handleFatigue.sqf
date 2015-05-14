/*
	Created by Lux0r
*/


_updateFatigue = {
	
	private["_unit", "_fatigueReduction", "_fatigueDeltaModifier","_previousFatigue", "_fatigue"];
	
	_unit = [_this, 0] call BIS_fnc_param;
	_fatigueReduction = [_this, 1] call BIS_fnc_param;
	_fatigueDeltaModifier = _fatigueReduction / 100;
	
	_previousFatigue = 0;
	while {true} do {
		
		_fatigue = getFatigue _unit;
		if (_fatigue > _previousFatigue) then {
			if (_fatigue < 60) then {
				_fatigueDelta = _fatigue - _previousFatigue;
				_fatigue = _fatigue - (_fatigueDelta * _fatigueDeltaModifier);
				_unit setFatigue _fatigue;
			};
		};
		
		_previousFatigue = _fatigue;
		sleep 1;
	};
};


private ["_unit","_fatigueReduction"];

_unit = [_this, 0] call BIS_fnc_param;
_fatigueReduction = ["TTC_CORE_fatigueReduction", 0] call BIS_fnc_getParamValue;
if (_fatigueReduction > 0) then {
	[_unit, _fatigueReduction] spawn _updateFatigue;
};

