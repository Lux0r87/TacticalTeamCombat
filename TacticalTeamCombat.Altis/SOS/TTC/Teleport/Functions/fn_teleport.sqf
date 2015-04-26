/*
	This function teleports the player to the selected sector.

    Created by Lux0r
*/


#define TTC_TP_radius 15
#define TTC_TP_time_blackOut 5
#define TTC_TP_time_blackIn 3

private["_pos","_price","_weaponClass","_type","_animation","_safePos"];

_pos	= [_this, 0] call BIS_fnc_param;
_price	= [_this, 1] call BIS_fnc_param;

/*[
	["Function: %1", "TTC_TP_fnc_teleport"], ["_pos = %1", _pos], ["_price = %1", _price]
] call TTC_CORE_fnc_log;*/


// Pay a fee for the teleport
["Teleport", -_price] spawn TTC_BTC_fnc_addBalanceChange;

// Choose the animation according to the player's current weapon.
_weaponClass = currentWeapon player;
_type = getNumber (configFile >> "CfgWeapons" >> _weaponClass >> "type");

_animation = switch (_type) do {
	case 2: {
		"AmovPknlMstpSrasWpstDnon";
	};
	case 1: {
		"AmovPknlMstpSrasWpstDnon_AmovPknlMstpSrasWrflDnon_end";
	};
	case 4: {
		"AmovPknlMstpSrasWlnrDnon";
	};
	default {
		"AmovPknlMstpSnonWnonDnon";
	};
};

// Display text and fade out.
titleText ["Teleporting ...", "BLACK OUT", TTC_TP_time_blackOut];

// Run animation.
player playMoveNow "AmovPknlMstpSnonWnonDnon_relax";
sleep TTC_TP_time_blackOut;
player playMoveNow _animation;

// Find a safe position near to the sector and "teleport" the player.
_safePos = [_pos, 0, TTC_TP_radius, 1, 0, 1000, 0, [], [_pos, _pos]] call BIS_fnc_findSafePos;
player setPos _safePos;

// Display text and fade in.
titleText ["Teleporting ...", "BLACK IN", TTC_TP_time_blackIn];
