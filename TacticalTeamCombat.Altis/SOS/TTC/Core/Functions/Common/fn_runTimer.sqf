/*
	Run a timer with the specified duration from the mission parameters. This function must be spawned!

	Created by Lux0r
*/


if (isNil "TTC_safetyTime") then {
	TTC_safetyTime = ["TTC_CORE_safetyTime", 300] call BIS_fnc_getParamValue;
};

while {TTC_safetyTime > 0} do {
	sleep 1;
	TTC_safetyTime = TTC_safetyTime - 1;
	publicVariable "TTC_safetyTime";
};
