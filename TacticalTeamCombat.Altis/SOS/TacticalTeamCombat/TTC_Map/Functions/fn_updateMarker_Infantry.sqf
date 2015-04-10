/*
	TODO: Documentation
	Params: [_unit, _marker]
	Created by BauerMitFackel
*/

if (isDedicated) exitWith {
	diag_log "INFO (TTC_MAP_fnc_updateMarker_Infantry): This script can only be executed on the client side"; nil
};


/*
	Returns the type of the marker for a given unit.
*/
_getMarkerType = {
	_prefix = [_side] call TTC_CORE_fnc_getMrkTypePrefix;
	_unit getVariable ["TTC_markerType", format["%1_unknown", _prefix]];
};


/*
	Returns the color of the marker for a given unit.
	Params: _unit
*/
_getMarkerColor = {

	private["_color"];

	_color = [_side, true] call BIS_fnc_sideColor;
	_color;
};


/*
	Returns the alpha of the marker for a given unit.
	Params: _unit
*/
_getMarkerAlpha = {

	private["_alpha"];

	_alpha = 0.5;
	if (isPlayer _unit) then {
	
		_alpha = 0.75;
		if (_unit == player) then {
			_alpha = 1.0;
		} ;
	};
	
	_alpha;
};


/*
	Returns the size of the marker for a given unit.
	Params: _unit
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
			[0.0, 0.0];
		};
	};
		
	_size;
};


/*
	Returns the text of the marker for a given unit.
	Params: _unit
*/
_getMarkerText = {

	private["_text"];

	_text = name _unit;
	_text;
};


//////////	


_unit		= [_this, 0] call BIS_fnc_param;
_marker		= [_this, 1] call BIS_fnc_param;
_side		= side _unit;
	
_marker setMarkerPosLocal	(getPos _unit);
_marker setMarkerTypeLocal	([] call _getMarkerType);	
_marker setMarkerColorLocal	([] call _getMarkerColor);	
_marker setMarkerAlphaLocal	([] call _getMarkerAlpha);	
_marker setMarkerSizeLocal	([] call _getMarkerSize);
_marker setMarkerTextLocal	([] call _getMarkerText);