/*
	Check the injured unit.
	
	Parameter(s):
		0: OBJECT - injured unit
		
    Created by BauerMitFackel
*/


#define _STANCE_STAND	"STAND"
#define _STANCE_CROUCH	"CROUCH"
#define _STANCE_PRONE	"PRONE"


_showHint = {
	
	private ["_injured", "_isSelf", "_delay", "_injuredName", "_blph", "_description"];
	
	_injured	= [_this, 0] call BIS_fnc_param;
	_isSelf		= [_this, 1] call BIS_fnc_param;
	_delay 		= [_this, 2, 0] call BIS_fnc_param;
	
	sleep _delay;
	
	_injuredName = if !(_isSelf) then {
		format ["%1 is", (name _injured)]
	} else {
		"I am"
	}; 
	
	_blph = _injured getVariable [TTC_MED_var_BLOOD_LOSS_PER_HEARTBEAT, 0];
	_description = [TTC_MED_var_BLOOD_LOSS_PER_HEARTBEAT, _blph] call TTC_MED_fnc_getVariableDescription;

	hint parseText format ["%1 %2 bleeding", _injuredName, _description];
};


//////////


_injured	= [_this, 0] call BIS_fnc_param;
_isSelf		= [_this, 1, false] call BIS_fnc_param;

[_injured, _isSelf, 1] spawn _showHint;

if (currentWeapon player == primaryWeapon player) then {

	switch (stance player) do {
		case _STANCE_STAND	: {
			player playMoveNow "AinvPercMstpSrasWrflDnon";
		};
		case _STANCE_CROUCH : {
			player playMoveNow "AinvPknlMstpSrasWrflDnon";
		};
		case _STANCE_PRONE	: {
			player playMoveNow "AinvPpneMstpSrasWrflDnon";
		};
	};
};

if (currentWeapon player == secondaryWeapon player) then {

	switch (stance player) do {
		case _STANCE_STAND : {
			player playMoveNow "AinvPercMstpSrasWlnrDnon";
		};
		case _STANCE_CROUCH : {
			player playMoveNow "AinvPknlMstpSrasWlnrDnon";
		};
	};
};

if (currentWeapon player == handgunWeapon player) then {

	switch (stance player) do {
		case _STANCE_STAND : {
			player playMoveNow "AinvPercMstpSrasWpstDnon";
		};
		case _STANCE_CROUCH : {
			player playMoveNow "AinvPknlMstpSrasWpstDnon";
		};
		case _STANCE_PRONE : {
			player playMoveNow "AinvPpneMstpSrasWpstDnon";
		};
	};
};

// Player has not weapon in hands
if (currentWeapon player == "") then {

	switch (stance player) do {
		case _STANCE_STAND : {
			player playMoveNow "AinvPercMstpSnonWnonDnon";
		};
		case _STANCE_CROUCH : {
			player playMoveNow "AinvPknlMstpSnonWnonDnon";
		};
		case _STANCE_PRONE : {
			player playMoveNow "AinvPpneMstpSnonWnonDnon";
		};
	};
};
