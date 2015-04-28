/*
	Created by Lux0r
*/


#define TTC_CORE_isLocked (_locked > 1 || _isLocked)
#define TTC_CORE_isOwner (_unit == _container getVariable ["TTC_isOwner", objNull])
#define TTC_CORE_displayName (getText (configFile >> "CfgVehicles" >> format["%1", typeOf _container] >> "displayName"))

private ["_unit","_container","_result","_locked","_isLocked"];

_unit		= [_this, 0] call BIS_fnc_param;
_container	= [_this, 1] call BIS_fnc_param;

_result		= false;
_locked		= locked _container;
_isLocked	= _container getVariable ["TTC_isLocked", false];

switch (true) do {
	// Check if container is a shop item.
	case ((_container isKindOf "Library_WeaponHolder") && (_container getVariable ["TTC_isShopItem", false])): {
		hintC "Nice try, but it's not allowed to steal in the shop.\nShame on you!";
		[format["%1 tried to steal in the shop!", name _unit], "TTC_CORE_fnc_systemChat", side _unit, false] call BIS_fnc_MP;
		_result = true;
	};
	// Check if container is a backpack.
	case (_container isKindOf "Bag_Base"): {
		hintSilent format["The %1 is locked!", TTC_CORE_displayName];
		_result = true;
	};
	// Check if container is a person.
	case (_container isKindOf "Man"): {
		if (TTC_CORE_isLocked) then {
			hintSilent "The unit's inventory is locked!";
			_result = true;
		};
	};
	// Check if container is a vehicle/helicopter.
	case (_container isKindOf "LandVehicle");
	case (_container isKindOf "Air"): {
		if (TTC_CORE_isLocked && !TTC_CORE_isOwner) then {
			hintSilent format["The %1's inventory is locked!", TTC_CORE_displayName];
			_result = true;
		};
	};
	default {
		if (TTC_CORE_isLocked && !TTC_CORE_isOwner) then {
			hintSilent "The object is locked!";
			_result = true;
		};
	};
};

_result