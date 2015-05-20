/*
	Draw connection between the sectors.

	Created by Lux0r
*/


// Main map.
[] spawn {
	waitUntil {!isNull ((findDisplay 12) displayCtrl 51)};
	(findDisplay 12 displayCtrl 51) ctrlAddEventHandler ["Draw", TTC_CTI_fnc_drawSectorConnections];
};

// Briefing.
[] spawn {
	disableSerialization;
	private["_display","_control"];

	waitUntil {
		_display	= if (isServer) then {findDisplay 52;} else {findDisplay 53;};
		_control	= _display displayCtrl 51;
		!isNull (_control)
	};

	_control ctrlAddEventHandler ["Draw", TTC_CTI_fnc_drawSectorConnections];
};

// Respawn menu... doesn't work!
/*[] spawn {
	waitUntil {!isNull ((findDisplay 58) displayCtrl 101)};
	diag_log "Respawn menu";
	(findDisplay 58 displayCtrl 101) ctrlAddEventHandler ["Draw", TTC_CTI_fnc_drawSectorConnections];
};*/

// GPS.
[] spawn {
	waitUntil {visibleGPS};
	_controls	= [133, 101] call TTC_CORE_fnc_findControls;
	_control	= _controls select 1;
	_control ctrlAddEventHandler ["Draw", TTC_CTI_fnc_drawSectorConnections];
};

// UAV terminal.
[] spawn {
	while {true} do {
		waitUntil {!isNull ((findDisplay 160) displayCtrl 51)};
		(findDisplay 160 displayCtrl 51) ctrlAddEventHandler ["Draw", TTC_CTI_fnc_drawSectorConnections];
		waitUntil {isNull ((findDisplay 160) displayCtrl 51)};
	};
};
