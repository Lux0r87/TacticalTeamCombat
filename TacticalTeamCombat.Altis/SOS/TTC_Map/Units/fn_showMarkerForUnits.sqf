/*
	This client side script creates and updates local markers for units.
	Created by BauerMitFackel
*/


if (isDedicated) exitWith {
	diag_log "INFO (TTC_MAP_fnc_showMarkerForUnits): This script can only be executed on the client side"
};


_RUN = true;
_UPDATE_INTERVAL = 0.1;
_MARKER_PREFIX = "TTC_MAP_UNIT_MARKER";


/*
	Returns true if a marker for the given unit should be shown on the map.
*/
_showMarkerForUnit = {

	private["_unit", "_show"];
	
	_unit = _this;
	_show = (side player == side _unit);
	_show;
};


/*
	Returns the next marker. Increases _markerNumber by 1
*/
_getNextMarker = {
	
	_markerNumber = _markerNumber + 1;
	_marker = format["%1_%2", _MARKER_PREFIX, _markerNumber];
	
	_marker;
};


//////////


while {_RUN} do {
		
	_markerNumber = 0; 
	_units = allUnits;
	
	if (count _units > 0) then {
	
		_unit = _units select 0;
		while {!isNil{_unit}} do {
		
			_unitClass = getText(configFile >> "CfgVehicles" >> typeOf _unit >> "textSingular");
			diag_log format["XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX Unit Class = %1", _unitClass];
		
			if (_unit call _showMarkerForUnit) then {
				
				_marker = [] call _getNextMarker;
				if (getMarkerType _marker == "") then {
					createMarkerLocal [_marker, [0, 0, 0]];
				};
				
				_vehicle = vehicle _unit;
				if(_vehicle == _unit) then {	
				
					[_unit, _marker] call TTC_MAP_fnc_updateMarker_Infantry;
					_units = _units - [_unit];
					
				} else {
					
					_crew = crew _vehicle;
					[_vehicle, _marker] call TTC_MAP_fnc_updateMarker_Vehicle;
					_units = _units - _crew;
					
				};

			} else {
				_units = _units - [_unit];
			};
			
			
			// Got to next unit
			if (count _units > 0) then {
				_unit = _units select 0;
			} else {
				_unit = nil;
			};
		};
	};
	
	
	// Delete all unnecessary markers		
	_marker = [] call _getNextMarker;
	while {(getMarkerType _marker) != ""} do {
		deleteMarkerLocal _marker;
		_marker = [] call _getNextMarker;
	};

	
	if (_UPDATE_INTERVAL > 0.0) then {
		sleep _UPDATE_INTERVAL;
	};
};