/*
	Created by Lux0r
*/


#define TTC_CORE_availableLocations ["Paros_Kalochori", "Athanos_Test"]

private ["_index"];


// Safety measure: Only select a new location, if TTC_CORE_location is not defined.
if (isNil "TTC_CORE_location") then {
	// Get the selected location from the mission parameter. -1 = random.
	_index = ["TTC_SC_locations", -1] call BIS_fnc_getParamValue;

	// Select a random location, if chosen in the mission parameter
	TTC_CORE_location = if (_index < 0) then {
		TTC_CORE_availableLocations call BIS_fnc_selectRandom;
	} else {
		TTC_CORE_availableLocations select _index;
	};
};

TTC_CORE_location