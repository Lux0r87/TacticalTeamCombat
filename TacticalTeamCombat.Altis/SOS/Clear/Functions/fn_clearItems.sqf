/*
	This script removes dropped items/weapons in a defined radius around all bases.

	Created by Lux0r
*/


private ["_radius","_positions","_objects"];

_radius		= 500;


// Loop forever and clear the items around the positions.
while {true} do {
_positions	= [] call CLR_fnc_getBasePositions;

	{
		_objects = nearestObjects [_x, ["WeaponHolder", "GroundWeaponHolder", "WeaponHolderSimulated"], _radius];

		{
			deleteVehicle _x;
		} forEach _objects;
	} forEach _positions;

	sleep 60;
};