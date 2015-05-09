/*
	Created by Lux0r
*/


#include "sectorVariables.inc"

private [
	"_sector","_update_position","_update_isConnected","_update_canSee","_update_teleportUI","_target","_mrkArea","_mrk","_visibilityOld","_connectedOld","_pos",
	"_visibility","_isNull","_sides","_return","_connected","_find","_canSee"
];

_sector				= [_this, 0] call BIS_fnc_param;
_update_position	= [_this, 1, false, [false]] call BIS_fnc_param;		// Update the marker positions.
_update_isConnected	= [_this, 2, false, [false]] call BIS_fnc_param;		// Recalculate "isConnectedToBase".
_update_canSee		= [_this, 3, false, [false]] call BIS_fnc_param;		// Recalculate "canSee", otherwise use stored value.
_update_teleportUI	= [_this, 4, false, [false]] call BIS_fnc_param;		// Refresh the teleport UI, if it's open.
_target				= [_this, 5, ObjNull, [ObjNull]] call BIS_fnc_param;

_mrkArea		= TTC_CTI_sectorVariable_markerArea(_sector);
_mrk			= TTC_CTI_sectorVariable_marker(_sector);
_visibilityOld	= TTC_CTI_sectorVariable_visibility(_sector);
_connectedOld	= TTC_CTI_sectorVariable_isConnectedToBase(_sector);
_pos			= getPos _sector;

_visibility	= _visibilityOld;
_isNull		= isNull _target;
_sides		= if (!_isNull) then {[side _target]} else {TTC_CTI_sides};

/*[_sector, "TTC_CTI_fnc_updateSector",
	[["_update_position = %1", _update_position], ["_update_isConnected = %1", _update_isConnected], ["_update_canSee = %1", _update_canSee],
	["_update_teleportUI = %1", _update_teleportUI], ["_target = %1", _target], ["_isNull = %1", _isNull], ["_sides = %1", _sides]]
] call TTC_CTI_fnc_logSector;*/


// Update the marker positions.
if (_update_position) then {
	_mrkArea setMarkerPos _pos;
	_mrk setMarkerPos _pos;
};

// Check if the sector is connected to the base.
if (_update_isConnected) then {
	_return		= [_sector] call TTC_CTI_fnc_isSectorConnectedToBase;
	_connected	= _return select 0;

	// Only update the variable, if it changed.
	if !(_connected isEqualTo _connectedOld) then {
		_sector setVariable ["TTC_CTI_sector_isConnectedToBase", _connected, true];
	};
};

{
	if (_isNull) then {
		_target = _x;
	};

	_find = ([TTC_CTI_sides, _x] call BIS_fnc_arrayFindDeep) select 0;

	if (_update_canSee) then {
		_canSee = [_sector, _x] call TTC_CTI_fnc_canSeeSector;
		_visibility set [_find, _canSee];
	} else {
		_canSee = _visibility select _find;
	};

	[[_sector, _canSee, _mrkArea, _mrk, _update_teleportUI], "TTC_CTI_fnc_updateSectorLocal", _target, false] call BIS_fnc_MP;
} forEach _sides;

// Only update the variable, if it changed.
if !(_visibility isEqualTo _visibilityOld) then {
	_sector setVariable ["TTC_CTI_sector_visibility", _visibility, true];
};
