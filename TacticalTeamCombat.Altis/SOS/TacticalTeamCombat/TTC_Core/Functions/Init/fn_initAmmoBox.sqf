/*
	Created by BauerMitFackel
*/

private ["_ammoBox"];

_ammoBox = [_this, 0] call BIS_fnc_param;

// Run this script only on server-side.
if (isServer) then {
	_ammoBox allowDamage false; 
	clearWeaponCargoGlobal _ammoBox; 
	clearMagazineCargoGlobal _ammoBox; 
	clearItemCargoGlobal _ammoBox; 
	clearBackpackCargoGlobal _ammoBox;
};