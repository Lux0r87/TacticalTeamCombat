/*
	Add action to the given vehicle.

	Created by Lux0r
*/


private ["_vehicle","_className","_displayName"];

_vehicle		= [_this, 0] call BIS_fnc_param;
_className		= typeOf _vehicle;
_displayName	= getText(configFile >> "CfgVehicles" >> _className >> "displayName");


// Lock vehicle.
_vehicle addAction [
	format ["<t color='#FF0000'>Lock %1</t>", _displayName],
	{
		_veh	= _this select 0;
		_caller	= _this select 1;

		// Check for UAV/UGV.
		if(getNumber(configFile >> "CfgVehicles" >> typeOf _veh >> "isUav") == 1) then {
			if (vehicle _caller == _caller) then {
				// Delete the crew.
				{
					_x action ["engineOff", _veh];
					_veh deleteVehicleCrew _x;
				} forEach (crew _veh);

				_veh lock true;
			} else {
				hintSilent "You can't lock the UAV/UGV, while you're controlling it.";
			};
		} else {
			_veh lock true;
		};
	},
	[],
	10,
	true,
	true,
	"",
	"(alive _target) &&
	(locked _target <= 1) &&
	(_this distance _target) < ((sizeOf typeOf _target) / 2) &&
	(_target in (missionNamespace getVariable ['TTC_CORE_vehicles', []]))"
];
