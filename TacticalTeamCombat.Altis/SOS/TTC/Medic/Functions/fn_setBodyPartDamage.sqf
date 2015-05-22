/*
	Sets the damage of the given body part.
	
	Parameter(s):
		0: STRING - Name of the body part where the unit was damaged. Empty string ("") for overall damage. "?" for unknown/unnamed selection.
		1: NUMBER - Damage.
		
    Created by BauerMitFackel
*/


_bodyPart	= [_this, 0] call BIS_fnc_param;
_damage		= [_this, 1] call BIS_fnc_param;


if (TTC_MED_debug) then {
	[_selection, _damage] call BIS_fnc_log;
};


switch (_bodyPart) do {
	case TTC_MED_const_BODY_PART_BODY : {
		TTC_MED_damagePerBodyPart set [0, _damage];
	};
	case TTC_MED_const_BODY_PART_HANDS : {
		TTC_MED_damagePerBodyPart set [1, _damage];
	};
	case TTC_MED_const_BODY_PART_HEAD : {
		TTC_MED_damagePerBodyPart set [2, _damage];
	};
	case TTC_MED_const_BODY_PART_LEGS : {
		TTC_MED_damagePerBodyPart set [3, _damage];
	};
};
