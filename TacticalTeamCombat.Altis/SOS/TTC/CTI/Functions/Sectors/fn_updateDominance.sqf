/*
	Created by Lux0r
*/

#include "dominanceVariables.hpp"
#include "sectorVariables.hpp"

#define TTC_CTI_multiplier 10
#define TTC_CTI_captureBonus 1000
#define TTC_CTI_captureBonusTeam (TTC_CTI_captureBonus / 2)
#define TTC_CTI_defendBonus 500
#define TTC_CTI_defendBonusTeam (TTC_CTI_defendBonus / 2)
#define TTC_CTI_dominanceDiff (TTC_CTI_dominanceMax - _dominance)
#define TTC_CTI_amountAttack ((_diff min _dominance) * TTC_CTI_multiplier)
#define TTC_CTI_amountDefend ((_diff min TTC_CTI_dominanceDiff) * TTC_CTI_multiplier)

private ["_sector","_side","_diff","_list","_sectorSide","_dominance","_recalculate","_dominanceNew","_respawnPos","_removed","_sectorName","_marker","_patrol","_veh","_message"];

_sector		= [_this, 0] call BIS_fnc_param;
_side		= [_this, 1, sideUnknown, [sideUnknown]] call BIS_fnc_param;
_diff		= [_this, 2, 0, [0]] call BIS_fnc_param;
_list		= [_this, 3, [], [[]]] call BIS_fnc_param;
_sectorSide	= [_this, 4, TTC_CTI_sectorVariable_side, [sideUnknown]] call BIS_fnc_param;
_dominance	= [_this, 5, TTC_CTI_sectorVariable_dominance, [0]] call BIS_fnc_param;

/*[_sector, "TTC_CTI_fnc_updateDominance", 
	[["_side = %1", _side], ["_diff = %1", _diff], ["_list = %1", _list], ["_sectorSide = %1", _sectorSide], ["_dominance = %1", _dominance]]
] call TTC_CTI_fnc_logSector;*/


_TTC_CTI_update = {
	private ["_sector","_dominanceNew","_recalculate","_neighbours"];
	_sector			= _this select 0;
	_dominanceNew	= _this select 1;
	_recalculate	= _this select 2;

	/*[_sector, "TTC_CTI_fnc_updateDominance - _TTC_CTI_update", 
		[["_dominanceNew = %1", _dominanceNew], ["_recalculate = %1", _recalculate]]
	] call TTC_CTI_fnc_logSector;*/

	// Update the dominance variable.
	_sector setVariable ["TTC_CTI_sector_dominance", _dominanceNew, true];

	if (_recalculate) then {
		_neighbours	= TTC_CTI_sectorVariable_neighbours;

		// Update all sectors.
		{
			if ((_x in _neighbours) || (_x == _sector)) then {
				[_x, false, true, true] call TTC_CTI_fnc_updateSector;
			} else {
				[_x, false, true, false] call TTC_CTI_fnc_updateSector;
			};
		} forEach TTC_CTI_sectors;
	} else {
		// Update only the sector.
		[_sector, false, false, false] call TTC_CTI_fnc_updateSector;
	};
};

_TTC_CTI_addBalanceChange = {
	private ["_message","_amount","_units"];
	_message	= _this select 0;
	_amount		= _this select 1;
	_units		= [_list, {side _x == _side && isPlayer _x}] call BIS_fnc_conditionalSelect;

	/*[
		["Function: %1", "TTC_CTI_fnc_updateDominance - _TTC_CTI_addBalanceChange"],
		["_message = %1", _message], ["_amount = %1", _amount], ["_units = %1", _units]
	] call TTC_CORE_fnc_log;*/

	// Change the balance for all human players of this side in the sector.
	{
		[[_message, _amount], "TTC_BTC_fnc_addBalanceChange", _x, false] call BIS_fnc_MP;
	} forEach _units;
};

// The attacking side is capturing the sector:
if (_sectorSide != _side) then {
	// Check if the attacking side can capture this sector.
	if ([_sector, _side] call TTC_CTI_fnc_canCaptureSector) then {
		_recalculate	= false;
		_dominanceNew	= ((_dominance - _diff) max TTC_CTI_dominanceMin);
		//_respawnPos		= _sector getVariable "TTC_CTI_sector_respawnPos";

		// Attackers get money.
		["Attacked Sector", TTC_CTI_amountAttack] call _TTC_CTI_addBalanceChange;

		/* DEPRECATED: https://github.com/Lux0r87/TacticalTeamCombat/issues/87
		// Remove respawn position, if dominance is too low.
		if ((count _respawnPos > 0) && (_dominanceNew < TTC_CTI_dominanceSpawn)) then {
			_removed = _respawnPos call BIS_fnc_removeRespawnPosition;
			_sector setVariable ["TTC_CTI_sector_respawnPos", []];
		};*/

		// Sector captured by attacking side:
		if (_dominanceNew == TTC_CTI_dominanceMin) then {
			_recalculate	= true;
			_sectorName		= TTC_CTI_sectorVariable_name;
			_marker			= TTC_CTI_sectorVariable_marker;

			// Set dominance to maximum + change side of sector.
			_dominanceNew = TTC_CTI_dominanceMax;
			_sector setVariable ["TTC_CTI_sector_side", _side, true];

			// Attackers get money (capture bonus).
			["Captured Sector", TTC_CTI_captureBonus] call _TTC_CTI_addBalanceChange;

			// The attacker's team gets money (capture bonus).
			[["Team Captured Sector", TTC_CTI_captureBonusTeam], "TTC_BTC_fnc_addBalanceChange", _side, false] call BIS_fnc_MP;

			/* DEPRECATED: https://github.com/Lux0r87/TacticalTeamCombat/issues/87
			// Create respawn position, for the team that captured the sector.
			_respawnPos = [_side, _marker] call BIS_fnc_addRespawnPosition;
			_sector setVariable ["TTC_CTI_sector_respawnPos", _respawnPos];*/

			// Create sector patrol.
			_patrol = [_sector, nil, nil, _side] call TTC_CTI_fnc_createSectorPatrol;

			// Unlock the vehicle for mobile sector.
			_veh = TTC_CTI_sectorVariable_vehicle;

			if (!isNil "_veh" && {!isNull _veh}) then {
				_veh lock false;
			};

			// Show message for everyone.
			_message = parseText format ["<t align='center' size='2'>Sector Control</t><br/>
			<t align='center' size='1.5'>%1</t><br/><br/>
			The sector was captured by %2.", _sectorName, _side];

			[_message,"TTC_CORE_fnc_hint"] call BIS_fnc_MP;
		};

		// Update the sector.
		[_sector, _dominanceNew, _recalculate] call _TTC_CTI_update;
	};
} else {	// The current side is defending the sector:
	// Check if dominance is not at maximum already.
	if (_dominance < TTC_CTI_dominanceMax) then {
		_dominanceNew	= ((_dominance + _diff) min TTC_CTI_dominanceMax);
		_respawnPos		= _sector getVariable "TTC_CTI_sector_respawnPos";

		// Defenders get money.
		["Defended Sector", TTC_CTI_amountDefend] call _TTC_CTI_addBalanceChange;

		/* DEPRECATED: https://github.com/Lux0r87/TacticalTeamCombat/issues/87
		// (Re)create respawn position for defenders, if dominance is high enough.
			if ((count _respawnPos == 0) && (_dominanceNew >= TTC_CTI_dominanceSpawn)) then {
			_marker		= TTC_CTI_sectorVariable_marker;
			_respawnPos = [_sectorSide, _marker] call BIS_fnc_addRespawnPosition;
			_sector setVariable ["TTC_CTI_sector_respawnPos", _respawnPos];
		};*/

		// Sector protected by defending side:
		if (_dominanceNew == TTC_CTI_dominanceMax) then {
			// Defenders get money (defend bonus).
			["Protected Sector", TTC_CTI_defendBonus] call _TTC_CTI_addBalanceChange;

			// The defender's team gets money (defend bonus).
			[["Team Protected Sector", TTC_CTI_defendBonusTeam], "TTC_BTC_fnc_addBalanceChange", _side, false] call BIS_fnc_MP;
		};

		// Update the sector.
		[_sector, _dominanceNew, false] call _TTC_CTI_update;
	};
};