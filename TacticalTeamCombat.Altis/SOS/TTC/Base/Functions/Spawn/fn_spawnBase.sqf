/*
	Spawns the base for the given side.

	Created by Lux0r
*/


private [
	"_side","_basePos","_sides","_return","_mrkTypePrefix","_mrkName","_mrkColor","_mrkText","_mrkType","_mrk","_respawnPos","_vehSpawnPos","_vehSpawnDir",
	"_dir","_signPos","_sign","_heliSpawnPos","_heliSpawnDir","_helipad","_maintenancePos","_maintenanceDir","_prefix","_trigger","_className","_baseDir",
	"_cargoHq","_cargoHqPos","_infoPos","_teleporterPos","_teleporterDir","_teleporter","_tower"
];

_side		= [_this, 0] call BIS_fnc_param;
_basePos	= missionNamespace getVariable [format["TTC_BASE_%1_Pos", _side], [0,0]];


//[["Function: %1", "TTC_BASE_fnc_spawnBase"], ["_side = %1", _side], ["_basePos = %1", _basePos]] call TTC_CORE_fnc_log;


if (format ["%1", _basePos] != "[0,0]") then {
	// Create zone protection, so no other team can enter the base.
	_sides = [west, east, resistance] - [_side];

	{
		["", _basePos, TTC_BASE_safetyDistance, TTC_BASE_safetyDistance, 0, false, format["%1", _x], "PRESENT"] call TTC_CORE_fnc_createZoneProtection;
	} forEach _sides;

	// Create zone protection, to prevent that players leave the base before the match starts.
	_return = ["", _basePos, 10, 10, 0, false, format["%1", _side], "NOT PRESENT"] call TTC_CORE_fnc_createZoneProtection;

	// Create global marker (base).
	_mrkTypePrefix	= _side call TTC_CORE_fnc_getMrkTypePrefix;
	_mrkName		= format ["mrk_Base_%1", _side];
	_mrkColor		= [_side, true] call BIS_fnc_sideColor;
	_mrkText		= format["Base %1 (HQ)", _side];
	_mrkType		= format["%1_hq", _mrkTypePrefix];
	_mrk			= [_mrkName, _basePos, _mrkText, _mrkColor, 1, 1, 0, "ICON", _mrkType] call TTC_CORE_fnc_createMarker;

	// Create respawn position.
	_respawnPos = [_side, _mrk] call BIS_fnc_addRespawnPosition;

	// Create global marker (safety distance).
	_mrkName	= format ["mrk_Base_%1_safetyDistance", _side];
	_mrk		= [_mrkName, _basePos, "", _mrkColor, TTC_BASE_safetyDistance, TTC_BASE_safetyDistance, 0, "ELLIPSE", "Empty", 0.3] call TTC_CORE_fnc_createMarker;

	// --------------- Vehicle spawn ---------------
	_vehSpawnPos	= missionNamespace getVariable [format["TTC_BASE_%1_VehSpawnPos", _side], [0,0]];
	_vehSpawnDir	= missionNamespace getVariable [format["TTC_BASE_%1_VehSpawnDir", _side], 0];

	_dir			= [_vehSpawnPos, _basePos] call BIS_fnc_DirTo;
	_signPos		= [((_vehSpawnPos select 0) - (cos(_dir + 90) * 6)), ((_vehSpawnPos select 1) + (sin(_dir + 90) * 6)), -0.5];
	_sign			= createVehicle ["Land_Sign_WarningMilitaryVehicles_F", _signPos, [], 0, "CAN_COLLIDE"];
	_sign setDir (_dir - 180);

	// --------------- Helicopter spawn ---------------
	_heliSpawnPos	= missionNamespace getVariable [format["TTC_BASE_%1_HeliSpawnPos", _side], [0,0]];
	_heliSpawnDir	= missionNamespace getVariable [format["TTC_BASE_%1_HeliSpawnDir", _side], 0];

	// Create helipad.
	_helipad		= createVehicle ["Land_HelipadSquare_F", _heliSpawnPos, [], 0, "CAN_COLLIDE"];
	_helipad setDir _heliSpawnDir;

	// --------------- Maintenance ---------------
	_maintenancePos	= missionNamespace getVariable [format["TTC_BASE_%1_MaintenancePos", _side], [0,0]];
	_maintenanceDir	= missionNamespace getVariable [format["TTC_BASE_%1_MaintenanceDir", _side], 0];

	// Create global marker.
	_mrkName		= format ["mrk_Base_%1_Maintenance", _side];
	_mrkText		= "Maintenance";
	_mrkType		= format["%1_maint", _mrkTypePrefix];
	_mrk			= [_mrkName, _maintenancePos, _mrkText, _mrkColor, 1, 1, 0, "ICON", _mrkType] call TTC_CORE_fnc_createMarker;

	// Create helipad.
	_helipad		= createVehicle ["Land_HelipadSquare_F", _maintenancePos, [], 0, "CAN_COLLIDE"];
	_helipad setDir _maintenanceDir;

	// Move existing trigger to maintenance position.
	_prefix		= [_side] call TTC_CORE_fnc_getPrefix;
	_trigger	= missionNamespace getVariable format["%1_Maintenance_Trigger", _prefix];
	_trigger setPos _maintenancePos;
	_trigger setDir _maintenanceDir;

	// --------------- Cargo HQ ---------------
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

	_baseDir	= _dir - 90;
	_cargoHq	= createVehicle [_className, _basePos, [], 0, "CAN_COLLIDE"];
	_cargoHq setDir _baseDir;
	_cargoHqPos = getPos _cargoHq;
	_cargoHq allowDamage false;

	// Lock the doors of the cargo HQ.
	_cargoHq setVariable ['bis_disabled_Door_1', 1, true];
	_cargoHq setVariable ['bis_disabled_Door_2', 1, true];

	// --------------- Info area ---------------
	//_infoPos = [((_basePos select 0) - (cos(_baseDir + 135) * 10)), ((_basePos select 1) + (sin(_baseDir + 135) * 10)), 0];
	//[_side, _infoPos, (_baseDir + 45)] call TTC_BASE_fnc_spawnInfoArea;

	// --------------- Shop ---------------
	[_side, _cargoHq, _baseDir, -3.28] call TTC_BASE_fnc_spawnShop;

	// --------------- Teleporter ---------------
	_teleporterPos	= missionNamespace getVariable [format["TTC_BASE_%1_TeleportPos1", _side], [0,0]];
	_teleporterDir	= missionNamespace getVariable [format["TTC_BASE_%1_TeleportDir1", _side], 0];
	_teleporter		= [_side, _teleporterPos, _teleporterDir] call TTC_BASE_fnc_spawnTeleporter;

	_teleporterPos	= missionNamespace getVariable [format["TTC_BASE_%1_TeleportPos2", _side], [0,0]];
	_teleporterDir	= missionNamespace getVariable [format["TTC_BASE_%1_TeleportDir2", _side], 0];
	_teleporter		= [_side, _teleporterPos, _teleporterDir] call TTC_BASE_fnc_spawnTeleporter;

	// --------------- Safety time ---------------

	// Wait before unlocking the doors.
	sleep TTC_safetyTime;
	_cargoHq setVariable ['bis_disabled_Door_1',0,true];
	_cargoHq setVariable ['bis_disabled_Door_2',0,true];

	// Delete trigger, location area and module protection module.
	{
		deleteVehicle _x;
	} forEach _return;
};
