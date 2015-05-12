/*
	Use this script to allow specific classes to spawn helicopters.

	Created by Lux0r
*/


private ["_vehicleType","_spawnPos","_spawnDir","_texture","_lock","_veh"];

_vehicleType	= [_this, 0] call BIS_fnc_param;
_spawnPos		= [_this, 1] call BIS_fnc_param;
_spawnDir		= [_this, 2] call BIS_fnc_param;
_texture		= [_this, 3, "", [""]] call BIS_fnc_param;
_lock			= [_this, 4, true, [true]] call BIS_fnc_param;

/*[
	["Function: %1", "TTC_CORE_fnc_spawnHelicopter"], ["_vehicleType = %1", _vehicleType], ["_spawnPos = %1", _spawnPos], ["_spawnDir = %1", _spawnDir],
	["_texture = %1", _texture], ["_lock = %1", _lock]
] call TTC_CORE_fnc_log;*/


// Create the vehicle.
_veh = _vehicleType createVehicle [_spawnPos select 0, _spawnPos select 1, 0.5];
_veh setDir _spawnDir;
_veh lock _lock;

// Remove weapons, magazines, items and backpacks.
clearWeaponCargoGlobal _veh;
clearMagazineCargo _veh;
clearItemCargoGlobal _veh;
clearBackpackCargoGlobal _veh;

// Replace yellow tracers with red for the armed Hellcat
if (_vehicleType == "I_Heli_light_03_F") then {
	_veh removeMagazineTurret ["5000Rnd_762x51_Yellow_Belt", [-1]];
	_veh addMagazineTurret ["5000Rnd_762x51_Belt", [-1]];
};

// Add smoke for helicopter ("lm_helo_support.sqf" must me initialized first!)
if (_vehicleType in lm_HS_supportedHeloTypes) then {
	[[_veh], 'lm_HS_fnc_initHelo', true, true] call BIS_fnc_MP;
};

// Open door script
switch (_vehicleType) do {
	case "B_Heli_Transport_01_F":		{ [[[_veh],"panda_doors\doors_ghosthawk\addaction.sqf"],"BIS_fnc_execVM",true,true] call BIS_fnc_MP; };
	case "B_Heli_Transport_01_camo_F":	{ [[[_veh],"panda_doors\doors_ghosthawk\addaction.sqf"],"BIS_fnc_execVM",true,true] call BIS_fnc_MP; };
	case "I_Heli_Transport_02_F":		{ [[[_veh],"panda_doors\doors_mohawk\addaction.sqf"],"BIS_fnc_execVM",true,true] call BIS_fnc_MP; };
};

// Change texture
if (_texture != "") then {
	switch (_vehicleType) do {
		case "I_Heli_light_03_unarmed_F";
		case "I_Heli_light_03_F": {
			_veh setObjectTextureGlobal [0, format["SOS\Textures\%1.paa", _texture]];
		};
		case "I_Heli_Transport_02_F": {
			_veh setObjectTextureGlobal [0, format["SOS\Textures\%1.paa", _texture]];
			_veh setObjectTextureGlobal [1, format["SOS\Textures\%1.paa", _texture]];
			_veh setObjectTextureGlobal [2, format["SOS\Textures\%1.paa", _texture]];
		};
	};
};

// Add lock/unlock actions.
[_veh] call TTC_CORE_fnc_addAction_lock;
[_veh] call TTC_CORE_fnc_addAction_unlock;

if (TTC_disableThermal == 1) then {
	_veh disableTIEquipment true;
};

_veh