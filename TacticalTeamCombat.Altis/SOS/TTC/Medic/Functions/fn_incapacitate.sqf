/*
	TODO: Write documentation
		
    Created by BauerMitFackel
*/


_by = [_this, 0, nil] call BIS_fnc_param;


player setVariable [TTC_MED_var_IS_INCAPACITATED, true, true];
player setVariable [TTC_MED_var_IS_INCAPACITATED_BY, _by, true];

[player, _by] call BIS_fnc_log;
systemChat format["Player %1 incapacitated by %2", player, _by];