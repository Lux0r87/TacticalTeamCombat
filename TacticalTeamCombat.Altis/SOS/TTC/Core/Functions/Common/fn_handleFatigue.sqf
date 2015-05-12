/*
	Created by Lux0r
*/


_updateFatigue = {
	
	private["_unit", "_fatigueModifier", "_previousFatigue", "_fatigue"];
	
	_unit = [_this, 0] call BIS_fnc_param;
	
	_previousFatigue = 0;
	while {true} do {
		
		_fatigue = getFatigue _unit;
		if (_fatigue > _previousFatigue) then {
			_fatigueModifier = 0.94 + (((_fatigue * 10) ^ 1.2) / 100);
			if (_fatigueModifier > 1) then {
				_fatigueModifier = 1;
			};
			
			diag_log format["Fatigue modifier: %1", _fatigueModifier];
			_fatigue = _fatigue * _fatigueModifier;
		};
		
		hint parseText format["Fatigue: %1", _fatigue];
		diag_log format["Fatigue: %1", _fatigue];
		
		_previousFatigue = _fatigue;
		_unit setFatigue _fatigue;
		sleep 1;
	};
};


private ["_unit","_fatigueModifier"];

_unit		= [_this, 0] call BIS_fnc_param;
_fatigueModifier = ["TTC_CORE_fatigueModifier", 0.987] call BIS_fnc_getParamValue;
[_unit, _fatigueModifier] spawn _updateFatigue;
