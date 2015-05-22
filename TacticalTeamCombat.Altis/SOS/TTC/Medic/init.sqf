/*
	TTC Medic initialization script.
	
	Created by BauerMitFackel
*/


[] call TTC_MED_fnc_initializeVariables;
[] call TTC_MED_fnc_initializeEventHandlers;
[] call TTC_MED_fnc_initializeDynamicBlur;

[player, "TTC_MED_fnc_initializeActions", true, false] call BIS_fnc_MP;

systemChat ("Medic System initialized");
