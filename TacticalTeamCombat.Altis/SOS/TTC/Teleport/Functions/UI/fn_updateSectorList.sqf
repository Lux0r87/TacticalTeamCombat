/*
	Updates the sector list.

	Parameter(s):
		0: ARRAY - the sectors to display

	Created by Lux0r
*/


disableSerialization;

#include "sectorStates.hpp"
#include "tooltipsTeleport.hpp"

#define TTC_TP_UI_basicPrice 250
#define TTC_TP_UI_distancePrice 20


private[
	"_control","_side","_basePos","_safe","_warning","_danger","_cutOff","_sectorSide","_displayName","_sectorPos",
	"_distance","_distPrice","_price","_state","_icon","_teleport"
];

/*[
	["Function: %1", "TTC_TP_UI_fnc_updateSectorList"], ["_control = %1", _control], ["_this = %1", _this]
] call TTC_CORE_fnc_log;*/

_control = uiNamespace getVariable ["TTC_TP_UI_sectorList", nil];

if (!isNil {_control}) then {
	lnbClear _control;

	if (_this isEqualTo []) then {
		["Sector array is empty"] call BIS_fnc_log;
	} else {
		_side		= side player;
		_basePos	= missionNamespace getVariable [format["TTC_BASE_%1", _side], [0, 0]];
		_safe		= [];
		_warning	= [];
		_danger		= [];
		_cutOff		= [];

		// Iterate over all sectors.
		{
			_sectorSide	= _x getVariable ["TTC_CTI_sector_side", sideUnknown];

			// Check if player's side controls this sector.
			if (_side == _sectorSide) then {
				// Get the display name for the sector.
				_displayName	= [_x] call TTC_CTI_fnc_getSectorText;

				// Calculate the price.
				_sectorPos	= getPos _x;
				_distance	= _basePos distance _sectorPos;
				_distPrice	= (floor (_distance / 100)) * TTC_TP_UI_distancePrice;
				_price		= TTC_TP_UI_basicPrice + _distPrice;

				// Get the state of the sector.
				_state = [_x] call TTC_TP_fnc_getSectorState;
				_x setVariable ["TTC_TP_sectorState", _state];

				// Choose the icon according to the sector's state.
				switch (_state) do {
					case TTC_TP_UI_sectorState_safe: {
						_safe pushBack [_forEachIndex, _displayName, _price, "SOS\TTC\Teleport\Icons\sector_icon_safe.paa"];
					};
					case TTC_TP_UI_sectorState_warning: {
						_warning pushBack [_forEachIndex, _displayName, _price, "SOS\TTC\Teleport\Icons\sector_icon_warning.paa"];
					};
					case TTC_TP_UI_sectorState_danger: {
						_danger pushBack [_forEachIndex, _displayName, _price, "SOS\TTC\Teleport\Icons\sector_icon_danger.paa"];
					};
					case TTC_TP_UI_sectorState_cutOff: {
						_cutOff pushBack [_forEachIndex, _displayName, _price, "SOS\TTC\Teleport\Icons\sector_icon_cutOff.paa"];
					};
				};
			};
		} forEach _this;

		// Sort the sectors by price.
		_safe		= [_safe, [], {_x select 2}, "ASCEND"] call BIS_fnc_sortBy;
		_warning	= [_warning, [], {_x select 2}, "ASCEND"] call BIS_fnc_sortBy;
		_danger		= [_danger, [], {_x select 2}, "ASCEND"] call BIS_fnc_sortBy;
		_cutOff		= [_cutOff, [], {_x select 2}, "ASCEND"] call BIS_fnc_sortBy;

		// Add the sectors.
		{
			_id				= _x select 0;
			_displayName	= _x select 1;
			_price			= _x select 2;
			_icon			= _x select 3;

			// Add a new row: set name, picture and value.
			_index	= _control lnbAddRow [_displayName, format["%1 BTC", _price]];
			_control lnbSetPicture [[_index, 0], _icon];

			// Save additional values.
			_control lnbSetValue [[_index, 0], _id];
			_control lnbSetValue [[_index, 1], _price];
		} forEach (_safe + _warning + _danger + _cutOff);

		// Select first row
		//_control lnbSetCurSelRow 0;

		// Check if no row is selected.
		if ((lnbCurSelRow _control) < 0) then {
			// Get the control of the 'Teleport' button.
			_teleport = uiNamespace getVariable ["TTC_TP_UI_teleport", nil];

			// Disable the 'Teleport' button
			if (!isNil "_teleport") then {
				_teleport ctrlEnable false;
				_teleport ctrlSetTooltip TTC_TP_UI_tooltipTeleport_selectSector;
			};
		};
	};
} else {
	["Variable TTC_TP_UI_sectorList not defined"] call BIS_fnc_error;
};
