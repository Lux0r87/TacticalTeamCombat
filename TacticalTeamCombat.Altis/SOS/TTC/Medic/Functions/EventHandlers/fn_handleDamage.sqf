/*
	This event handler is triggered when a unit is damaged. 
	See: 
		https://community.bistudio.com/wiki/User:Killzone_Kid#HandleDamage
		https://resources.bisimulations.com/wiki/Category:VBS:_Event_Handlers#HandleDamage
	
	Parameter(s):
		0: OBJECT - Unit that got damaged.
		1: STRING - Name of the selection where the unit was damaged. Empty string ("") for overall damage. "?" for unknown/unnamed selection.
		2: NUMBER - Damage value inflicted by this hit.
		3: OBJECT - The source unit that caused the damage.
		4: STRING - Class name of projectile that caused the damage. Empty string ("") if damage was caused by different means (e.g. a fall or impact).
		
    Created by BauerMitFackel
*/

// Constants
#define _SELECTION_BODY "body"
#define _SELECTION_HANDS "head_hit"
#define _SELECTION_HEAD "head"
#define _SELECTION_LEGS "hand_r"
#define _SELECTION_OVERALL ""
#define _SELECTION_UNKNOWN "?"
#define _SELECTIONS [_SELECTION_BODY, _SELECTION_HANDS, _SELECTION_HEAD, _SELECTION_LEGS]
#define _HEADSHOT_DEFLECTION_PROBABILITY 0.05
#define _MISFIRE_PROBABILITY 0.05
#define _DAMAGE_MODIFIER_HEADSHOT_DEFLECTED 0.01
#define _DAMAGE_MODIFIER_LIMBS 0.60
#define _DAMAGE_THRESHOLD 2.5


_modifyDamage = {
	
	private ["_selection", "_damage", "_source", "_projectile", "_sound", "_limbs"];
	
	_selection	= [_this, 0] call BIS_fnc_param;
	_damage		= [_this, 1] call BIS_fnc_param;
	_source 	= [_this, 2] call BIS_fnc_param;
	_projectile	= [_this, 3] call BIS_fnc_param;
		
	if (
		(_selection == _SELECTION_HEAD) && 
		(_damage > 1) && 
		!(isNull _source)
	) then {
	
		if (
			((headgear player) in TTC_MED_const_HELMETS) && 
			!(player getVariable TTC_MED_var_IS_INCAPACITATED) && 
			(random 1 <= _HEADSHOT_DEFLECTION_PROBABILITY)
		) then {			
			_damage = _damage * _DAMAGE_MODIFIER_HEADSHOT_DEFLECTED;
			_sound = TTC_MED_const_HIT_SOUNDS_METAL call BIS_fnc_selectRandom;
			playSound3D [_hitSound, player, false, getPosASL player, 30.0, 1.0, 15.0];
		};
	};
	
	_limbs = [_SELECTION_HANDS, _SELECTION_LEGS];
	if (_selection in _limbs) then {		
		_damage = _damage * _DAMAGE_MODIFIER_LIMBS;
	};
		
	// Return the modified damage
	_damage;
};


//////////


_target  	= [_this, 0] call BIS_fnc_param;
_selection	= [_this, 1] call BIS_fnc_param;
_damage		= [_this, 2] call BIS_fnc_param;
_source 	= [_this, 3] call BIS_fnc_param;
_projectile	= [_this, 4] call BIS_fnc_param;


if (TTC_MED_debug) then {
	[_target, _selection, _damage, _source, _projectile] call BIS_fnc_log;
};

if ((_target == player) && (alive player)) then {

	_damage = [_selection, _damage, _source, _projectile] call _modifyDamage;
	if (_damage > _DAMAGE_THRESHOLD) exitWith {player setDamage 1.0;};
	
	if ((_selection in _SELECTIONS) && (_damage > 0.9)) then {
		if (player getVariable TTC_MED_var_IS_INCAPACITATED) exitWith {player setDamage 1.0;};
		[_source] spawn TTC_MED_fnc_incapacitate;
	};
	
	// Hit in hand > Shoot weapon
	if (!(isNull _source)) then {			
		if ((_selection == _SELECTION_HANDS) && (random 1 <= _MISFIRE_PROBABILITY)) then {
			player forceWeaponFire [currentWeapon player, currentWeaponMode player];
		};
	};
	
	// Hit in leg > Play fall animation
	if (
		(_selectionName == _SELECTION_LEGS) && 
		!(player getVariable TTC_MED_var_IS_INCAPACITATED) && 
		(animationState player != "AinjPpneMstpSnonWrflDnon_injuredHealed") && 
		((random 1.0 <= 0.6) && (_damage > 0.2))
	) then {
		if (currentWeapon player == primaryWeapon player) then {
			player playMove "AmovPpneMstpSrasWrflDnon";
		};
		if (currentWeapon player == handgunWeapon player) then {
			player playMove "AmovPpneMstpSrasWpstDnon";
		};
		if (currentWeapon player == "") then {
			player playMove "AmovPpneMstpSnonWnonDnon";
		};
	};
};

_damage = 0.9 min _damage;
_damage;
	