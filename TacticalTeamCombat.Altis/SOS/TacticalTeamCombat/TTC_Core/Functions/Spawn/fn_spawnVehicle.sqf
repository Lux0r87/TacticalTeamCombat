/*
	Use this script to allow specific classes to spawn vehicles.

	Created by Lux0r
*/


private ["_vehicleType","_spawn","_texture","_spawnPos","_veh"];

_vehicleType	= _this select 0;
_spawn			= _this select 1;
_texture		= _this select 2;


// Create the vehicle
_spawnPos = getPos _spawn;
_veh = _vehicleType createVehicle [_spawnPos select 0, _spawnPos select 1, (_spawnPos select 2) + 0.5];
_veh setDir (getDir _spawn);

// Remove weapons and items, re-add some FAKs
clearWeaponCargoGlobal _veh;
clearItemCargoGlobal _veh;
_veh addItemCargoGlobal ["FirstAidKit", 5];

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

if (TTC_disableThermal == 1) then {
	_veh disableTIEquipment true;
};