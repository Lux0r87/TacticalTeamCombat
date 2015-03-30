/*
	Returns the sector pattern of the mission.

	Created by Lux0r
*/


#define TTC_CORE_availablePatterns ["7 Sectors", "9 Sectors"]

private ["_index"];


// Safety measure: Only select a new pattern, if TTC_CORE_sectorPattern is not defined.
if (isNil "TTC_CORE_sectorPattern") then {
	// Get the selected location from the mission parameter. -1 = random.
	_index = ["TTC_CORE_sectorPatterns", -1] call BIS_fnc_getParamValue;

	// Select a random location, if chosen in the mission parameter
	TTC_CORE_sectorPattern = if (_index < 0) then {
		TTC_CORE_availablePatterns call BIS_fnc_selectRandom;
	} else {
		TTC_CORE_availablePatterns select _index;
	};
};

TTC_CORE_sectorPattern