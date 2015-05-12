/*
	Created by Lux0r
*/


#define TTC_CORE_isLocked (_locked > 1 || _isLocked)
#define TTC_CORE_isOwner (_unit == _container getVariable ["TTC_isOwner", objNull])
#define TTC_CORE_displayName (getText (configFile >> "CfgVehicles" >> format["%1", typeOf _container] >> "displayName"))

private ["_unit","_container","_result","_locked","_isLocked","_containers"];

_unit		= [_this, 0] call BIS_fnc_param;
_container	= [_this, 1] call BIS_fnc_param;

_result		= false;
_locked		= locked _container;
_isLocked	= _container getVariable ["TTC_isLocked", false];
_containers	= everyContainer _container;

/*[
	["Function: %1", "TTC_CORE_fnc_inventoryOpened"],
	["_unit = %1", _unit], ["_container = %1", _container], ["type = %1", typeOf _container], ["_result = %1", _result],["_locked = %1", _locked],
	["_isLocked = %1", _isLocked], ["isShopItem = %1", _container getVariable ["TTC_isShopItem", false]], ["_containers = %1", _containers]
] call TTC_CORE_fnc_log;*/


switch (true) do {
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
	// Check if container is a shop item.
	/*case (_container getVariable ["TTC_isShopItem", false]): {
		//hintC "Nice try, but it's not allowed to steal in the shop.\nShame on you!";
		[format["%1 tried to steal in the shop!", name _unit], "TTC_CORE_fnc_systemChat", side _unit, false] call BIS_fnc_MP;
		//_result = true;
	};*/
	// Check if unit is in the shop.
	/*case (((getPos _unit) distance (getMarkerPos format ["mrk_TTC_BASE_shopPos_%1", side _unit])) <= 4): {
		hintC "Don't open your inventory in the shop.\nPlease leave the area first.";
		_result = true;
	};*/
	default {
		if (TTC_CORE_isLocked && !TTC_CORE_isOwner) then {
			hintSilent "The object is locked!";
			_result = true;
		};
	};
};

_result