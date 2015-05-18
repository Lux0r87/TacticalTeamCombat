/*
	Created by Lux0r
*/



private ["_side","_texture"];


_side	= [_this, 0] call BIS_fnc_param;

//[["Function: %1", "TTC_CORE_fnc_getFlagForSide"],	["_side = %1", _side]] call TTC_CORE_fnc_log;


_texture = switch (_side) do {
	case west: {
		"\A3\Data_F\Flags\flag_nato_co.paa";	
	};
	case east: {
		"\A3\Data_F\Flags\flag_csat_co.paa";	
	};
	case resistance: {
		"\A3\Data_F\Flags\flag_aaf_co.paa";	
	};
	default {
		"\A3\Data_F\Flags\flag_green_co.paa";	
	};
};

_texture
