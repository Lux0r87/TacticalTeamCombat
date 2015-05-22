/*
	Returns the damage of the given body part.
	
	Parameter(s):
		0: STRING - Name of the body part for which to get the damaged.
		
    Created by BauerMitFackel
*/

private ["_bodyPart", "_damage"];


_bodyPart	= [_this, 0] call BIS_fnc_param;

if (TTC_MED_debug) then {
	[_bodyPart] call BIS_fnc_log;
};

_damage = switch (_bodyPart) do {
	case TTC_MED_const_BODY_PART_BODY	: {TTC_MED_damagePerBodyPart select 0};
	case TTC_MED_const_BODY_PART_HANDS	: {TTC_MED_damagePerBodyPart select 1};
	case TTC_MED_const_BODY_PART_HEAD	: {TTC_MED_damagePerBodyPart select 2};
	case TTC_MED_const_BODY_PART_LEGS	: {TTC_MED_damagePerBodyPart select 3};
	default {0.0};
};

_damage;
