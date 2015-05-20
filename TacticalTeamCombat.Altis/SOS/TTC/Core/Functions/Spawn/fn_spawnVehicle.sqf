/*
	Use this script to allow specific classes to spawn vehicles.

	Created by Lux0r
*/


private ["_vehicleType","_spawnPos","_spawnDir","_texture","_lock","_veh"];

_vehicleType	= [_this, 0] call BIS_fnc_param;
_spawnPos		= [_this, 1] call BIS_fnc_param;
_spawnDir		= [_this, 2] call BIS_fnc_param;
_texture		= [_this, 3, "", [""]] call BIS_fnc_param;
_lock			= [_this, 4, true, [true]] call BIS_fnc_param;

/*[
	["Function: %1", "TTC_CORE_fnc_spawnVehicle"], ["_vehicleType = %1", _vehicleType], ["_spawnPos = %1", _spawnPos], ["_spawnDir = %1", _spawnDir],
	["_texture = %1", _texture], ["_lock = %1", _lock]
] call TTC_CORE_fnc_log;*/


// Create the vehicle.
_veh = _vehicleType createVehicle [_spawnPos select 0, _spawnPos select 1, 0.5];
_veh setDir _spawnDir;
_veh setVectorUp (surfaceNormal (getPos _veh));
_veh lock _lock;

// Remove weapons, magazines, items and backpacks.
clearWeaponCargoGlobal _veh;
clearMagazineCargo _veh;
clearItemCargoGlobal _veh;
clearBackpackCargoGlobal _veh;

// Change texture
if (_texture != "") then {
	switch (_vehicleType) do {
		case "B_G_Offroad_01_F";
		case "I_G_Offroad_01_F";
		case "B_G_Offroad_01_armed_F";
		case "I_G_Offroad_01_armed_F": {
			_veh setVariable ["BIS_enableRandomization", false];
			_veh setObjectTextureGlobal [0, format["SOS\Textures\%1.paa", _texture]];
			_veh setObjectTextureGlobal [1, format["SOS\Textures\%1.paa", _texture]];
		};
		case "B_Quadbike_01_F";
		case "O_Quadbike_01_F";
		case "I_Quadbike_01_F": {
			_veh setVariable ["BIS_enableRandomization", false];
			_veh setObjectTextureGlobal [0, format["SOS\Textures\%1.paa", _texture]];
		};
		case "B_APC_Tracked_01_rcws_F": {
			_veh setObjectTextureGlobal [0, format["SOS\Textures\%1.paa", _texture]];
			_veh setObjectTextureGlobal [1, format["SOS\Textures\%1.paa", _texture]];
			_veh setObjectTextureGlobal [2, format["SOS\Textures\%1.paa", _texture]];
		};
		case "I_APC_tracked_03_cannon_F": {
			_veh setObjectTextureGlobal [0, format["SOS\Textures\%1Turret.paa", _texture]];
			_veh setObjectTextureGlobal [1, format["SOS\Textures\%1Hull.paa", _texture]];
		};
	};
};

// Add lock/unlock actions.
[_veh] call TTC_CORE_fnc_addAction_lock;
[_veh] call TTC_CORE_fnc_addAction_unlock;

if (TTC_disableThermal == 1) then {
	_veh disableTIEquipment true;
};

_veh;