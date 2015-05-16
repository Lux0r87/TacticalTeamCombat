/*
	This script removes destroyed, immobile, and out of fuel vehicles with no crew in a defined radius around all bases.

	Created by Lux0r
*/


private ["_radius","_timer","_positions","_vehicles"];

_radius		= 500;
_timer		= 60;


// Loop forever and clear the vehicles around the positions.
while {true} do {
_positions	= [] call TTC_CORE_fnc_getBasePositions;

	{
		_vehicles = nearestObjects [_x, ["LandVehicle", "Air"], _radius];

		{
			//if (!alive _x || ((!canMove _x || fuel _x <= 0) && {alive _x} count crew _x < 1)) then {
			if ((!alive _x) && ({alive _x} count crew _x < 1)) then {
				deleteVehicle _x;
			};
		} forEach _vehicles;
	} forEach _positions;

	sleep _timer;
};
