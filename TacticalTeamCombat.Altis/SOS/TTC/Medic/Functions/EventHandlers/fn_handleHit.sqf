/*
	This event handler is triggered when a unit is hit/damaged. 
	See: 
		https://community.bistudio.com/wiki/User:Killzone_Kid#MPHit
		https://resources.bisimulations.com/wiki/Category:VBS:_Event_Handlers#MPHit
	
	Parameter(s):
		0: OBJECT - Unit that got injured/damaged.
		1: OBJECT - Unit that inflicted the damage. If injured by a vehicle impact or a fall the target itself is returned, or, in case of IEDs or artillery, the null object. 
					In case of explosives that were planted by someone (e.g. satchel charges), that unit is returned.
		2: NUMBER - Level of damage caused by the hit.
		
    Created by BauerMitFackel
*/


#define _MAX_BLOOD_LOSS_PER_HEARTBEAT 0.0075;


_target  	= [_this, 0] call BIS_fnc_param;
_shooter 	= [_this, 1] call BIS_fnc_param;
_damage		= [_this, 2] call BIS_fnc_param;


if (TTC_MED_debug) then {
	[_target, _shooter, _damage] call BIS_fnc_log;
};


if ((_target == player) && (alive player)) then {
	
	_damageBody = player getHit "body";
	_damageHands = player getHit "hands";
	_damageHead = player getHit "head";
	_damageLegs = player getHit "legs";
	
	if ((_damageHead > 0.25) || (_damageBody > 0.25) || (_damageHands > 0.25) || (_damageLegs > 0.25)) then {
		
		_blph = 0;
		_blph = _blph + _damageBody * 4.0;
		_blph = _blph + _damageLegs * 4.0;
		_blph = _blph + _damageHead * 1.0;
		_blph = _blph + _damageHands * 0.5;
		_blph = _blph * 0.0004;
		_blph = _blph min _MAX_BLOOD_LOSS_PER_HEARTBEAT;
		
		player setVariable [TTC_MED_var_BLOOD_LOSS_PER_HEARTBEAT, _blph, true];
		[] call TTC_MED_fnc_bleed;
	};
	
	_vehicle = vehicle player;
	if ((_vehicle != player) && !(alive _vehicle)) then {
		
		if (random 1.0 <= 0.1) then {
			_isIncapacitated = player getVariable [TTC_MED_var_IS_INCAPACITATED, false];	
			if (!_isIncapacitated) then {
				[] spawn TTC_MED_fnc_incapacitate;
			};
			moveOut player;
		} else {
			player setDamage 1.0;
		};
	};
};
