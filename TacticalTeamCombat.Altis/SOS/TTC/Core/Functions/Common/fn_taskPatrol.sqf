/*
	Created by Lux0r
*/


private ["_grp","_pos","_radius","_wpType","_wpBehaviour","_wpCombatMode","_wpSpeed","_wpFormation","_debug","_safePos","_wp"];

_grp			= [_this, 0] call BIS_fnc_param;
_pos			= [_this, 1] call BIS_fnc_param;
_radius			= [_this, 2, 50, [0]] call BIS_fnc_param;
_wpType			= [_this, 3, "LOITER", [""]] call BIS_fnc_param;		// "MOVE", "SAD", "HOLD", "SENTRY", "GUARD", "TALK", "SCRIPTED", "LOITER", ...
_wpBehaviour	= [_this, 4, "AWARE", [""]] call BIS_fnc_param;			// "UNCHANGED", "CARELESS", "SAFE", "AWARE", "COMBAT", "STEALTH"
_wpCombatMode	= [_this, 5, "YELLOW", [""]] call BIS_fnc_param; 		// "NO CHANGE", "BLUE", "GREEN", "WHITE", "YELLOW", "RED"
_wpSpeed		= [_this, 6, "NORMAL", [""]] call BIS_fnc_param;		// "NO CHANGE", "LIMITED", "NORMAL", "FULL"
_wpFormation	= [_this, 7, "STAG COLUMN", [""]] call BIS_fnc_param;	// "NO CHANGE", "COLUMN", "STAG COLUMN", "WEDGE", "LINE", ...

_debug = false;

// Delete all previous waypoints.
for [{_i = 0},{_i < count waypoints _grp},{_i = _i + 1}] do {
	deleteWaypoint [_grp, _i];
};

// Create start waypoint.
_wp = [_grp, _pos, _wpType, _wpBehaviour, _wpCombatMode, _wpSpeed, _wpFormation] call TTC_CORE_fnc_addWaypoint;

// Create one waypoint in each direction.
{
	_safePos = [_x, 0, (_radius*0.25), 0, 0, 1000, 0, [], [_pos, _pos]] call BIS_fnc_findSafePos;
	_wp = [_grp, _safePos, _wpType, _wpBehaviour, _wpCombatMode, _wpSpeed, _wpFormation] call TTC_CORE_fnc_addWaypoint;
} forEach [	[(_pos select 0) - (_radius*0.75),	(_pos select 1)],
			[(_pos select 0),					(_pos select 1) + (_radius*0.75)],
			[(_pos select 0) + (_radius*0.75),	(_pos select 1)],
			[(_pos select 0),					(_pos select 1) - (_radius*0.75)] ];

// Cycle back to the start position.
_wp = [_grp, _pos, "CYCLE", _wpBehaviour, _wpCombatMode, _wpSpeed, _wpFormation] call TTC_CORE_fnc_addWaypoint;

// Create markers, if debug is enabled.
if (_debug) then {
	private ["_mrkName","_wpPos","_mrk"];

	{
		_mrkName	= format["wp%1_%2", _forEachIndex, _grp];
		_wpPos		= waypointPosition _x;
		_mrk		= [_mrkName, _wpPos, _mrkName, "ColorOrange", 1, 1, 0, "ICON", "hd_flag", 1] call TTC_CORE_fnc_createMarker;
	} forEach waypoints _grp;
};