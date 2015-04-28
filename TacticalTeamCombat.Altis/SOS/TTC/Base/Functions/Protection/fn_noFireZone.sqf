/*
	Add an event handler that instantly removes any kind of bullet/grenade/satchel/mine,
	if fired or placed by the player in the noFireZone (defined radius around the marker).
	Remove all weapons from the player, when fired more than 3 times within 30sec inside the noFireZone.

	IMPORTANT:
	It requires a marker for each playable team:
	E.g.: mrk_Base_West, mrk_Base_East, mrk_Base_Guer

	Edited by Lux0r
*/


// Run this script only on client-side.
if (hasInterface) then {
	waitUntil {!isNull player};

	player addEventHandler ["Fired", {
		private ["_radius","_unit","_projectile","_basePos"];

		_radius		= 500;
		_unit		= _this select 0;
		_projectile = _this select 6;
		_basePos	= getMarkerPos format ["mrk_Base_%1", side _unit];

		if ((format ["%1", _basePos] != "[0,0]") && ((_unit distance _basePos) < _radius)) then {
			deleteVehicle (_projectile);

			"No Fire Zone" hintC [
				"Don't shoot at base!",
				"Don't throw grenades at base!",
				"Don't place mines/explosives at base!"
			];

			TTC_BASE_hintC_EH = findDisplay 72 displayAddEventHandler ["unload", {
				0 = _this spawn {
					_this select 0 displayRemoveEventHandler ["unload", TTC_BASE_hintC_EH];
					hintSilent "";
				};
			}];
		};
	}];
};
