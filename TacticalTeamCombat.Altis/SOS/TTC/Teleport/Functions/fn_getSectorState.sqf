/*
	Returns the sector state.
	
    Created by Lux0r
*/


#include "UI\sectorStates.hpp"

private["_sector","_dominance","_isConnected","_state"];

_sector			= [_this, 0] call BIS_fnc_param;
_dominance		= [_this, 1, _sector getVariable ["TTC_CTI_sector_dominance", 0], [0]] call BIS_fnc_param;
_isConnected	= [_this, 2, _sector getVariable ["TTC_CTI_sector_isConnectedToBase", false], [false]] call BIS_fnc_param;

/*[_sector, "TTC_TP_fnc_getSectorState",
	[["_dominance = %1", _dominance], ["_isConnected = %1", _isConnected]]
] call TTC_CTI_fnc_logSector;*/


// Calculate the current state of the sector.
_state = if (_isConnected) then {
	switch (true) do {
		case (_dominance == 100): {
			TTC_TP_UI_sectorState_safe;
		};
		case (_dominance >= 75): {
			TTC_TP_UI_sectorState_warning;
		};
		default {
			TTC_TP_UI_sectorState_danger;
		};
	};
} else {
	TTC_TP_UI_sectorState_cutOff;
};

_state;
