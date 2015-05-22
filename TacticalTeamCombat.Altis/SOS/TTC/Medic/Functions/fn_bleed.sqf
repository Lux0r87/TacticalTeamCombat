/*
	TODO: Write documentation
		
    Created by BauerMitFackel
*/


#define _RESTING_HEART_RATE 60
#define _MAX_HEART_RATE 190
#define _BLOOD_LOSS_PER_HEART_BEAT (1 / 300) // <MAX BLOOD VOLUME> / <MAX BLEED DURATION>


_bleed = {

	while {true} do {
		
		_fatigue = getFatigue player;
		_heartRate = _RESTING_HEART_RATE + ((_MAX_HEART_RATE - _RESTING_HEART_RATE) * _fatigue);
		_sleepDuration = (60 / _heartRate);
		
		sleep _sleepDuration;
		
		_isIncapacitated = player call TTC_MED_fnc_isIncapacitated;
		
		if (!(alive player) || (!_isIncapacitated && (damage player <= 0.25))) exitWith {
			[player, false, true] call TTC_MED_fnc_setBleeding;
			if (TTC_MED_debug) then {
				_msg = format ["(%1) Bleeding stopped", (name player)];
				systemChat _msg;
			};
		};
		
		if (_isIncapacitated && !(player call TTC_MED_fnc_isBleeding)) exitWith {
			if (TTC_MED_debug) then {
				_msg = format ["(%1) Bleeding stopped", (name player)];
				systemChat _msg;
			};
		};
		
		_bloodLossPerHeartbeat = player getVariable [TTC_MED_var_BLOOD_LOSS_PER_HEARTBEAT, 0];
		_bloodVolume = player call TTC_MED_fnc_getBloodVolume;
		_bloodVolume = _bloodVolume - _BLOOD_LOSS_PER_HEART_BEAT;
		
		// Update the blood volume and broadcast the change
		[player, _bloodVolume, true] call TTC_MED_fnc_setBloodVolume;
				
		// Adjust blur post processing based on blood volume
		TTC_MED_dynamicBlur ppEffectAdjust [(1 - _bloodVolume) * 2];
		TTC_MED_dynamicBlur ppEffectCommit _sleepDuration;
		
		// Adjust color corrections post processing based on blood volume
		_holeSize = 0.35 max _bloodVolume;
		TTC_MED_colorCorrections ppEffectAdjust [(_bloodVolume / 8), 1, 0,  [0.5, 0.5, 0.5, 0.0], [1, 1, 1, 0.0], [0.8, 0.8, 0.8, 0.0], [_holeSize, _holeSize, 0, 0, 0, 0, _bloodVolume]];
		TTC_MED_colorCorrections ppEffectCommit _sleepDuration;

		_camShake = if !(_isIncapacitated) then {
			(1 - _bloodVolume) * 10;
		} else {
			1.0;
		};
		addCamShake [_camShake, 1, 10];
		
		if (_bloodVolume <= 0) then {
			player setDamage 1;
			player switchMove "";
		} else {
			if (!_isIncapacitated && (_bloodVolume <= 0.2)) then {
				[] call TTC_MED_fnc_incapacitate;	
			};
		};
	};
};


//////////


[4000] call BIS_fnc_bloodEffect;

_isBleeding = player call TTC_MED_fnc_isBleeding;
[_isBleeding] call BIS_fnc_log;

if (!_isBleeding) then {
	[player, true, true] call TTC_MED_fnc_setBleeding;
	[] spawn _bleed;
};
