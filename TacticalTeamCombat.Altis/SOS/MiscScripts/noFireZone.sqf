/*
	Add an event handler that instantly removes any kind of bullet/grenade/satchel/mine,
	if fired or placed by the player in the noFireZone (250m around the marker).
	Remove all weapons from the player, when fired more than 3 times within 30sec inside the noFireZone.

	IMPORTANT:
	It requires a marker for each playable team:
	E.g.: BaseWest, BaseEast, BaseGuer, BaseCiv

	Edited by Lux0r
*/


// Run this script only on client-side.
if (!isDedicated) then {
	waitUntil {!isNull player};

	fDelay = 0;

	[] spawn {
		while {true} do {
			sleep 30;
			
			if (fDelay > 0 ) then {
				fDelay = fDelay - 1;
			};
		};
	};

	player addEventHandler ["Fired", {
		private ["_radius","_unit","_projectile","_basePos"];

		_radius		= 500;
		_unit		= _this select 0;
		_projectile = _this select 6;
		_basePos	= missionNamespace getVariable [format["TTC_BASE_%1", side _unit], [0,0]];

		if ((format ["%1", _basePos] != "[0,0]") && ((_unit distance _basePos) < _radius)) then {
			fDelay = fDelay + 1;
			deleteVehicle (_projectile);

			if (fDelay <= 3) then {				
				"No Fire Zone" hintC [
					"Don't shoot at base!",
					"Don't throw grenades at base!",
					"Don't place mines/explosives at base!"
				];

				hintC_arr_EH = findDisplay 72 displayAddEventHandler ["unload", {
					0 = _this spawn {
						_this select 0 displayRemoveEventHandler ["unload", hintC_arr_EH];
						hintSilent "";
					};
				}];
			} else {
				removeallWeapons _unit;
			};
		};
	}];
};