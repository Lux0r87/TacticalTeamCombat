/*
	Created by Lux0r
*/

private ["_ammoBox"];

_ammoBox = [_this, 0] call BIS_fnc_param;


clearWeaponCargoGlobal _ammoBox; 
clearMagazineCargoGlobal _ammoBox; 
clearItemCargoGlobal _ammoBox; 
clearBackpackCargoGlobal _ammoBox;
