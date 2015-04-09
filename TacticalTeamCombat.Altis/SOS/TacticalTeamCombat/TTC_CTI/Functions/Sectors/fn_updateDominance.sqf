/*
	Created by Lux0r
*/

#include "dominanceVariables.hpp"
#include "sectorVariables.hpp"

// Don't add "_sector" to private variables. This function modifies the original variable.
private ["_side","_diff","_sectorSide","_dominance","_recalculate","_respawnPos","_removed","_sectorName","_marker","_patrol","_veh","_message"];

_sector	= [_this, 0] call BIS_fnc_param;
_side	= [_this, 1, east, [east]] call BIS_fnc_param;
_diff	= [_this, 2, 0, [0]] call BIS_fnc_param;

_sectorSide	= _sector select TTC_CTI_sector_side;
_dominance	= _sector select TTC_CTI_sector_dominance;

/*[
	["TTC_CTI: updateDominance:"], ["_sector = %1", _sector], ["_side = %1", _side], ["_diff = %1", _diff], ["_sectorSide = %1", _sectorSide], ["_dominance = %1", _dominance]
] call TTC_CORE_fnc_log;*/


_TTC_CTI_update = {
	// Don't add "_sector" to private variables. This function modifies the original variable.
	private ["_dominance","_recalculate"];
	_sector			= _this select 0;
	_dominance		= _this select 1;
	_recalculate	= _this select 2;

	// Update the dominance variable.
	_sector set [TTC_CTI_sector_dominance, _dominance];

	// Update the sector markers.
	[_sector, TTC_CTI_dominanceMax, _recalculate] call TTC_CTI_fnc_updateSectorMarkers;

	if (_recalculate) then {
		// Update the sector markers for the neighbours.
		{
			[_x, TTC_CTI_dominanceMax, _recalculate] call TTC_CTI_fnc_updateSectorMarkers;
		} forEach TTC_CTI_sectors;
	};
};

// The attacking side is capturing the sector:
if (_sectorSide != _side) then {
	// Check if the attacking side can capture this sector.
	if ([_sector, _side] call TTC_CTI_fnc_canCapture) then {
		_recalculate	= false;
		_dominance		= ((_dominance - _diff) max TTC_CTI_dominanceMin);
		_respawnPos		= _sector select TTC_CTI_sector_respawnPos;

		// Remove respawn position, if dominance is too low.
		if ((count _respawnPos > 0) && (_dominance < TTC_CTI_dominanceSpawn)) then {
			_removed = _respawnPos call BIS_fnc_removeRespawnPosition;
			_sector set [TTC_CTI_sector_respawnPos, []];
		};

		// Sector captured by attacking side:
		if (_dominance == TTC_CTI_dominanceMin) then {
			_recalculate	= true;
			_sectorName		= _sector select TTC_CTI_sector_name;
			_marker			= _sector select TTC_CTI_sector_marker;

			// Set dominance to maximum + change side of sector.
			_dominance = TTC_CTI_dominanceMax;
			_sector set [TTC_CTI_sector_side, _side];

			// Create respawn position, for the team that captured the sector.
			_respawnPos = [_side, _marker] call BIS_fnc_addRespawnPosition;
			_sector set [TTC_CTI_sector_respawnPos, _respawnPos];

			// Create sector patrol.
			_patrol = [_sector] call TTC_CTI_fnc_createSectorPatrol;

			// Unlock the vehicle for mobile sector.
			if (count _sector >= 17) then {
				_veh = _sector select TTC_CTI_sector_vehicle;

				if (!isNull _veh) then {
					_veh lock false;
				};
			};

			// Show message for everyone.
			_message = parseText format ["<t align='center' size='2'>Sector Control</t><br/>
			<t align='center' size='1.5'>%1</t><br/><br/>
			The sector was captured by %2.", _sectorName, _side];

			[_message,"TTC_CORE_fnc_hint"] call BIS_fnc_MP;
		};

		// Update the sector.
		[_sector, _dominance, _recalculate] call _TTC_CTI_update;
	};
} else {	// The current side is defending the sector:
	// Check if dominance is not at maximum already.
	if (_dominance < TTC_CTI_dominanceMax) then {
		_dominance	= ((_dominance + _diff) min TTC_CTI_dominanceMax);
		_respawnPos	= _sector select TTC_CTI_sector_respawnPos;

		// (Re)create respawn position for defenders, if dominance is high enough.
		if ((count _respawnPos == 0) && (_dominance >= TTC_CTI_dominanceSpawn)) then {
			_marker		= _sector select TTC_CTI_sector_marker;
			_respawnPos = [_sectorSide, _marker] call BIS_fnc_addRespawnPosition;
			_sector set [TTC_CTI_sector_respawnPos, _respawnPos];
		};

		// Update the sector.
		[_sector, _dominance, false] call _TTC_CTI_update;
	};
};