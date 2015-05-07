/*
	Spawns the base for the given side.

	Created by Lux0r
*/

#define TTC_BASE_safetyDistance 500

private [
	"_side","_basePos","_sides","_mrk","_mrkTypePrefix","_mrkName","_mrkColor","_mrkText","_respawnPos","_className","_cargoHq","_dir","_cargoHqPos",
	"_infoPos","_shopPos","_teleporterPos"
];

_side		= [_this, 0] call BIS_fnc_param;
_basePos	= missionNamespace getVariable [format["TTC_BASE_%1", _side], [0,0]];


//[["Function: %1", "TTC_Base_fnc_spawnBase"], ["_side = %1", _side], ["_basePos = %1", _basePos]] call TTC_CORE_fnc_log;


if (format ["%1", _basePos] != "[0,0]") then {
	// Only for test purpose! Easier to find the centre of the dome for a good position.
	/*_pole	= createVehicle ["Metal_Pole_F", _basePos, [], 0, "CAN_COLLIDE"];
	_pole setVectorUp (surfaceNormal _basePos);*/

	// Create zone protection, so no other team can enter the base.
	_sides = [west, east, resistance] - [_side];

	{
		["", _basePos, TTC_BASE_safetyDistance, TTC_BASE_safetyDistance, 0, false, format["%1", _x], "PRESENT"] call TTC_CORE_fnc_createZoneProtection;
	} forEach _sides;

	// Create zone protection, to prevent that players leave the base before the match starts.
	_return = ["", _basePos, 10, 10, 0, false, format["%1", _side], "NOT PRESENT"] call TTC_CORE_fnc_createZoneProtection;

	{
		diag_log format["_x = %1, synchronizedObjects = %2", _x, synchronizedObjects  _x];
	} forEach _return;

	// Create global marker (base).
	_mrkTypePrefix	= _side call TTC_CORE_fnc_getMrkTypePrefix;
	_mrkName	= format ["mrk_Base_%1", _side];
	_mrkColor	= [_side, true] call BIS_fnc_sideColor;
	_mrkText	= format["Base %1 (HQ)", _side];
	_mrkType	= format["%1_hq", _mrkTypePrefix];
	_mrk		= [_mrkName, _basePos, _mrkText, _mrkColor, 1, 1, 0, "ICON", _mrkType] call TTC_CORE_fnc_createMarker;

	// Create respawn position.
	_respawnPos = [_side, _mrk] call BIS_fnc_addRespawnPosition;

	// Create global marker (base protection).
	_mrkName	= format ["mrk_BaseProtection_%1", _side];
	_mrk		= [_mrkName, _basePos, "", _mrkColor, TTC_BASE_safetyDistance, TTC_BASE_safetyDistance, 0, "ELLIPSE", "Empty", 0.3] call TTC_CORE_fnc_createMarker;

	// Spawn cargo HQ.
	_className = switch (_side) do {
		case west: {
			"Land_Cargo_HQ_V1_F";
		};
		case east: {
			"Land_Cargo_HQ_V2_F";
		};
		case resistance: {
			"Land_Cargo_HQ_V3_F";
		};
	};

	_cargoHq	= createVehicle [_className, _basePos, [], 0, "CAN_COLLIDE"];
	_dir		= [_cargoHq, missionNamespace getVariable format["TTC_BASE_%1_VehSpawnPos", _side]] call BIS_fnc_DirTo;
	_cargoHq setDir _dir;
	_cargoHqPos = getPos _cargoHq;
	_cargoHq setVectorUp (surfaceNormal _cargoHqPos);
	_cargoHq setPos [_cargoHqPos select 0, _cargoHqPos select 1, -0.3];
	_cargoHq allowDamage false;

	// Lock the doors of the cargo HQ.
	_cargoHq setVariable ['bis_disabled_Door_1', 1, true];
	_cargoHq setVariable ['bis_disabled_Door_2', 1, true];

	// Spawn info area.
	_infoPos = [((_basePos select 0) - (cos(_dir + 135) * 10)), ((_basePos select 1) + (sin(_dir + 135) * 10)), 0];
	//[_side, _infoPos, (_dir + 45)] call TTC_BASE_fnc_spawnInfoArea;

	// Spawn shop.
	_shopPos = [((_basePos select 0) - (cos(_dir + 45) * 10)), ((_basePos select 1) + (sin(_dir + 45) * 10)), 0];
	//[_side, _shopPos, (_dir + 315)] call TTC_BASE_fnc_spawnShop;

	// Spawn teleporter.
	_teleporterPos = [((_basePos select 0) - (cos(_dir + 325) * 10)), ((_basePos select 1) + (sin(_dir + 325) * 10)), 0];
	//[_side, _teleporterPos, (_dir + 225)] call TTC_BASE_fnc_spawnTeleporter;

	// Wait before unlocking the doors.
	sleep TTC_safetyTime;
	_cargoHq setVariable ['bis_disabled_Door_1',0,true];
	_cargoHq setVariable ['bis_disabled_Door_2',0,true];

	// Delete trigger, area and module.
	{
		deleteVehicle _x;
	} forEach _return;
};
