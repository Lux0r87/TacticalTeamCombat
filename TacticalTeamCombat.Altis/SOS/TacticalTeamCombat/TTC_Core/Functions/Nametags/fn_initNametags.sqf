/*
	Created by Lux0r
*/


private ["_nametags","_keyDownEHid"];


// Create 3D name tags.
_nametags = addMissionEventHandler ["Draw3D", TTC_CORE_fnc_draw3D];
missionNamespace setVariable ["TTC_CORE_draw3D_nametags", _nametags];

// Add 'KeyDown' event handler to toggle the name tags.
_keyDownEHid = (findDisplay 46) displayAddEventHandler ["KeyDown", TTC_CORE_fnc_keyDown];

systemChat "Press 'Ctrl + L' to toggle the name tags.";