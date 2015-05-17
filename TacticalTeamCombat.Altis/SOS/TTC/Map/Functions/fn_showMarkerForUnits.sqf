/*
	This client side script creates and updates local markers for units.
	Created by BauerMitFackel
*/


if (isDedicated) exitWith {
	diag_log "INFO (TTC_MAP_fnc_showMarkerForUnits): This script can only be executed on the client side"
};


_RUN = false;
_MARKER_PREFIX = "TTC_MAP_UNIT_MARKER";


/*
	Returns true if a marker for the given unit should be shown on the map.
*/
_showMarkerForUnit = {

	private["_unit", "_vehicle", "_show"];
	
	_unit = _this;
	_vehicle = vehicle _unit;
	_show = false;
	
	if (_vehicle == _unit) then {
		_show = (side player == side _unit);// && (alive _unit);
	} else {
		_show = (getNumber(configFile >> "CfgVehicles" >> typeOf _vehicle >> "isUav") != 1);
	};
	
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


_updateMarkers = {
	
	_markerNumber = 0; 
	_units = allUnits - allDead;
	
	if (count _units > 0) then {
	
		_unit = _units select 0;
		while {!isNil{_unit}} do {
				
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
};


//////////


waitUntil {!(IsNull player) && (time > 0.0)};
waitUntil {
	[] call _updateMarkers;
	_RUN
};
