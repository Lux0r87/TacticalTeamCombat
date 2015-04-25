/*
	This function teleports the player to the selected sector.

    Created by Lux0r
*/


#define TTC_TP_radius 15
#define TTC_TP_sleep_blackOut 4
#define TTC_TP_sleep_blackIn 2

private["_pos","_price","_safePos"];

_pos	= [_this, 0] call BIS_fnc_param;
_price	= [_this, 1] call BIS_fnc_param;

/*[
	["Function: %1", "TTC_TP_fnc_teleport"], ["_pos = %1", _pos], ["_price = %1", _price]
] call TTC_CORE_fnc_log;*/


// Pay a fee for the teleport
["Teleport", -_price] spawn TTC_BTC_fnc_addBalanceChange;

// Display text and fade out.
titleText ["Teleporting ...", "BLACK OUT", TTC_TP_sleep_blackOut];

// Run animation.
player playMoveNow "AmovPercMstpSnonWnonDnon_AmovPknlMstpSnonWnonDnon";
sleep TTC_TP_sleep_blackOut;
player playMove "AmovPknlMstpSrasWpstDnon_AmovPknlMstpSrasWrflDnon_end";

// Find a safe position near to the sector and "teleport" the player.
_safePos = [_pos, 0, TTC_TP_radius, 1, 0, 1000, 0, [], [_pos, _pos]] call BIS_fnc_findSafePos;
player setPos _safePos;

// Display text and fade in.
titleText ["Teleporting ...", "BLACK IN", TTC_TP_sleep_blackIn];
