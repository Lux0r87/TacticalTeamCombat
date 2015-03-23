/*
	This script removes destroyed, immobile, and out of fuel vehicles with no crew in a defined radius around all bases + sector control objectives.

	Created by Lux0r
*/


private ["_radius","_bases","_sectors","_positions","_vehicles"];

_radius		= 1300;
_bases		= [] call CLR_fnc_getBasePositions;
_sectors	= [] call CLR_fnc_getSectorPositions;
_positions	= _bases + _sectors;


// Loop forever and clear the vehicles around the positions.
while {true} do {
	{
		_vehicles = nearestObjects [_x, ["LandVehicle", "Air"], _radius];

		{
			if (!alive _x || ((!canMove _x || fuel _x <= 0) && {alive _x} count crew _x < 1)) then {
				deleteVehicle _x;
			};
		} forEach _vehicles;
	} forEach _positions;

	sleep 120;
};