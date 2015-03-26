/*
	Created by BauerMitFackel
*/

private ["_ammoBox"];

_ammoBox = [_this, 0] call BIS_fnc_param;

// Run this script only on server-side.
if (isServer) then {
	diag_log format["TTC_CORE: initAmmoBox: Is server! _ammoBox = %1", _ammoBox];
	
	_ammoBox allowDamage false; 
	clearWeaponCargoGlobal _ammoBox; 
	clearMagazineCargoGlobal _ammoBox; 
	clearItemCargoGlobal _ammoBox; 
	clearBackpackCargoGlobal _ammoBox;
} else {
	diag_log format["TTC_CORE: initAmmoBox: Is NOT server! _ammoBox = %1", _ammoBox];
};