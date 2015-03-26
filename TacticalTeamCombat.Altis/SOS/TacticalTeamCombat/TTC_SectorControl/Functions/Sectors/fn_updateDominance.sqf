/*
	Created by Lux0r
*/

#define TTC_SC_dominanceMin 0
#define TTC_SC_dominanceMax 100

// Don't add "_sector" to private variables. This function modifies the original variable.
private ["_side","_diff","_sectorName","_sectorSide","_dominance","_message"];

_sector	= [_this, 0] call BIS_fnc_param;
_side	= [_this, 1, east, [east]] call BIS_fnc_param;
_diff	= [_this, 2, 0, [0]] call BIS_fnc_param;

_sectorName	= _sector select 0;
_sectorSide	= _sector select 6;
_dominance	= _sector select 7;

diag_log format [
	"TTC_SC - updateDominance: _sector = %1, _side = %2, _diff = %3, _sectorName = %4, _sectorSide = %5, _dominance = %6",
	_sector, _side, _diff, _sectorName, _sectorSide, _dominance
];

// Enemy side is capturing the sector
if (_sectorSide != _side) then {
	_dominance = ((_dominance - _diff) max TTC_SC_dominanceMin);

	// If sector is captured: Set dominance to maximum + change side.
	if (_dominance == TTC_SC_dominanceMin) then {
		_dominance = TTC_SC_dominanceMax;
		_sector set [6, _side];

		// Show message for everyone.
		_message = parseText format ["<t align='center' size='2'>Sector Control</t><br/>
		<t align='center' size='1.5'>%1</t><br/><br/>
		The sector was captured by %2.", _sectorName, _side];

		[_message,"TTC_CORE_fnc_hint"] call BIS_fnc_MP;
	};
} else {
	_dominance = ((_dominance + _diff) min TTC_SC_dominanceMax);
};

// Update the dominance variable.
_sector set [7, _dominance];

// Update the sector markers.
[_sector] call TTC_SC_fnc_updateSectorMarkers;