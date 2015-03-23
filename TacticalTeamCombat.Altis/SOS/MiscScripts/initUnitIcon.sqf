/*
	Creates a local marker at the units position.
	This function should be spawned!

	Created by Lux0r
*/

private ["_unit", "_mkrAlpha","_mkrBrush","_mkrText","_side","_mkrType","_mkrColor","_mrk"];


_unit		= [_this, 0, player] call BIS_fnc_param;
_mkrAlpha	= [_this, 1, 0.8] call BIS_fnc_param;
_mkrBrush	= [_this, 2, "Solid", [""]] call BIS_fnc_param;
_mkrText	= [_this, 3, "", [""]] call BIS_fnc_param;


_time		= 0;
_side		= side _unit;
_mkrType	= switch (_side) do {
	case west: {
		"b_inf";
	};
	default {
		"n_inf";
	};
};
_mkrColor	= [((_side call bis_fnc_sideID) call bis_fnc_sideType), true] call bis_fnc_sidecolor;

// Create a local marker
_mrk = createMarkerLocal [format["%1_%2", vehicleVarName _unit, name _unit], getPos _unit];
_mrk setMarkerTypeLocal _mkrType;
_mrk setMarkerColorLocal _mkrColor;
_mrk setMarkerAlphaLocal _mkrAlpha;
_mrk setMarkerBrushLocal _mkrBrush;
_mrk setMarkerTextLocal _mkrText;

while {true} do {
	//Show the marker only, if the unit is alive and is not the leader of his group.
	if ((alive _unit) && !(leader _unit == _unit)) then {
		_mrk setMarkerAlphaLocal _mkrAlpha;
		_mrk setMarkerPosLocal (getPos _unit);
	} else {
		_mrk setMarkerAlphaLocal 0;
	};

	sleep _time;
};