/*
	Initializes all event handlers.
		
    Created by BauerMitFackel
*/


player addEventHandler ["HandleDamage", {
	_this call TTC_MED_fnc_handleDamage;
}];


player addMPEventHandler ["MPHit", {
	_this call TTC_MED_fnc_handleHit;
}];


/*
player addMPEventHandler ["MPKilled", {
	_this call TTC_MED_fnc_onMPKilled;
}];

player addMPEventHandler ["Respawn", {
	[_this] call TTC_MED_fnc_onRespawn;
}];

["TTC_MED_onEachFrame", "onEachFrame", {	
	[] call TTC_MED_fnc_onEachFrame;
}] call BIS_fnc_addStackedEventHandler;
*/