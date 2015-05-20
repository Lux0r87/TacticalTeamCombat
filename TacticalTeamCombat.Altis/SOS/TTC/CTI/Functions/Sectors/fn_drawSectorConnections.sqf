/*
	Created by Lux0r
*/


#include "sectorVariables.inc"

#define TTC_CTI_allSides [west, east, resistance]

_getSide = {
	private["_sector","_side","_visibility","_find","_canSee","_return"];
	_sector	= _this select 0;
	_side	= _this select 1;

	_visibility	= TTC_CTI_sectorVariable_visibility(_sector);
	_find		= ([TTC_CTI_sides, _side] call BIS_fnc_arrayFindDeep) select 0;
	_canSee		= _visibility select _find;

	_return = if (_canSee) then {
		TTC_CTI_sectorVariable_side(_sector);
	} else {
		sideUnknown;
	};

	_return;
};


private [
	"_map","_side","_ai","_enemy","_colorPlayer","_colorAi","_colorEnemy","_visitedSectors","_sectorPos","_sectorSide",
	"_neighbours","_neighbourPos","_neighbourSide","_color"
];

_map	= [_this, 0] call BIS_fnc_param;
_side	= side player;

/*[["Function: TTC_CTI_fnc_drawSectorConnections"],
	["_map = %1", _map], ["_side = %1", _side], ["TTC_CTI_sectors = %1", TTC_CTI_sectors]
] call TTC_CORE_fnc_log;*/


if (_side in TTC_CTI_allSides) then {
	_ai		= (TTC_CTI_allSides - TTC_CTI_sides) select 0;
	_enemy	= (TTC_CTI_sides - [_side]) select 0;

	// Get colors.
	_colorPlayer	= [_side] call BIS_fnc_sideColor;
	_colorAi		= [_ai] call BIS_fnc_sideColor;
	_colorEnemy		= [_enemy] call BIS_fnc_sideColor;

	_visitedSectors = [];

	// Iterate over all sectors.
	{
		_sectorPos	= getPos _x;
		_sectorSide	= [_x, _side] call _getSide;
		_neighbours	= TTC_CTI_sectorVariable_neighbours(_x);

		// Iterate over all neighbours.
		{
			// Skip already visited sectors.
			if !(_x in _visitedSectors) then {
				switch (typeName _x) do {
					// Trigger object, representing the sector.
					case "OBJECT": {
						_neighbourPos	= getPos _x;
						_neighbourSide	= [_x, _side] call _getSide;

						_color = switch (true) do {
							case (_sectorSide == _neighbourSide): {
								[_sectorSide] call BIS_fnc_sideColor;
							};
							case (_side in [_sectorSide, _neighbourSide]): {
								_colorPlayer;
							};
							case (_enemy in [_sectorSide, _neighbourSide]): {
								_colorEnemy;
							};
							case (_ai in [_sectorSide, _neighbourSide]): {
								_colorAi;
							};
							default {
								[0.5, 0.5, 0.5, 1];
							};
						};

						// Draw a line between the sectors on the map.
						_map drawLine [_sectorPos, _neighbourPos, _color];
					};
					// Side for the according base.
					case "SIDE": {
						// Draw a line between the sector and the base on the map.
						_color		= [_x] call BIS_fnc_sideColor;
						_basePos	= getMarkerPos format ["mrk_Base_%1", _x];
						_map drawLine [_sectorPos, _basePos, _color];
					};
					default {
						["Unsupported type for neighbour: value = %1, type = %2", _x, typeName _x] call BIS_fnc_error;
					};
				};
			};
		} forEach _neighbours;

		// Add the current sector to the array with already visited sectors.
		_visitedSectors pushBack _x;
	} forEach TTC_CTI_sectors;
};
