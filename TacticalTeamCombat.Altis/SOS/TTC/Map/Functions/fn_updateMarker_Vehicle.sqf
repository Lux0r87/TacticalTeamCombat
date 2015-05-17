/*
	TODO: Documentation
	Params: [_unit, _marker]
	Created by BauerMitFackel
*/

if (isDedicated) exitWith {
	diag_log "INFO (TTC_MAP_fnc_updateMarker_Vehicle): This script can only be executed on the client side"; nil
};


/*
	Returns the type of the marker for a given unit.
*/
_getMarkerType = {

	private["_prefix", "_vehicleClass", "_suffix", "_type"];
	_prefix = [_side] call TTC_CORE_fnc_getMrkTypePrefix;
	
	_markerType = "mil_triangle";
	if (_prefix == "") then {
		_markerType = "mil_dot";
	} else {
	
		_vehicleClass = getText(configFile >> "CfgVehicles" >> typeOf _vehicle >> "vehicleClass");
		_suffix = switch (_vehicleClass) do {
			case "Air": {
				"air";
			};
			case "Armored": {
				"armor";
			};
			case "Autonomous": {
				"uav";
			};
			default {
				"motor_inf";
			};
		};
		
		_markerType = format ["%1_%2", _prefix, _suffix];
	};

	_markerType;
};


/*
	Returns the color of the marker.
*/
_getMarkerColor = {

	private["_color"];

	_color = [_side, true] call BIS_fnc_sideColor;
	_color;
};


/*
	Returns the alpha of the marker.
*/
_getMarkerAlpha = {

	private["_alpha"];

	_alpha = 1.0;		
	_alpha;
};


/*
	Returns the size of the marker.
*/
_getMarkerSize = {

	private["_size"];

	_size = switch (_side) do {
		case west: {
			[1.0, 1.0];
		};
		case east: {
			[1.1, 0.7];
		};
		case independent: {
			[1.1, 0.7];
		};
		default {
			[1.0, 1.0];
		};
	};
		
	_size;
};


/*
	Returns the text of the marker.
*/
_getMarkerText = {

	private["_text"];

	_text = getText(configFile >> "CfgVehicles" >> typeOf _vehicle >> "displayName");
	
	if (isNull driver _vehicle) then {
		_text = format["%1 (%2", _text, name (crew _vehicle select 0)];
	} else {
		_text = format["%1 (%2", _text, name driver _vehicle];	
	};
	
	_additionalCrewMembers = (count _crew) - 1;
	if (_additionalCrewMembers > 0) then {
		_text = format["%1 +%2", _text, _additionalCrewMembers];
	};
	
	_text = format["%1)", _text];	
	_text;
};


//////////	


_vehicle	= [_this, 0] call BIS_fnc_param;
_marker		= [_this, 1] call BIS_fnc_param;
_crew 		= crew _vehicle;
_side		= [faction (_crew select 0)] call TTC_CORE_fnc_getSideForFaction;

_marker setMarkerPosLocal	(getPos _vehicle);
_marker setMarkerTypeLocal	([] call _getMarkerType);	
_marker setMarkerColorLocal	([] call _getMarkerColor);	
_marker setMarkerAlphaLocal	([] call _getMarkerAlpha);	
_marker setMarkerSizeLocal	([] call _getMarkerSize);
_marker setMarkerTextLocal	([] call _getMarkerText);