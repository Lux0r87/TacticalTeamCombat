/*
	Created by Lux0r
*/


private ["_grp","_iconCfg"];

_grp = [_this, 0] call BIS_fnc_param;


_iconCfg = switch (groupID _grp) do {
	case "Platoon Lead":	{["B_HQ", [1, 0.533, 0, 1], "PL"];};		// Use the same marker type, color and text for both side's Platoon Lead
	case "Knight 1":		{["B_INF", [0.133, 0.33, 1, 1], "K1"];};
	case "Knight 2":		{["B_INF", [0.133, 0.33, 1, 1], "K2"];};
	case "Archer 1":		{["B_INF", [0, 1, 0, 1], "A1"];};
	case "Archer 2":		{["B_INF", [0, 1, 0, 1], "A2"];};
	case "Reaper 1":		{["B_AIR", [0, 0, 0, 1], "R1"];};			// Use the same marker type, color and text for both side's Reaper 1
	case "Reaper 2":		{["B_AIR", [0, 0, 0, 1], "R2"];};			// Use the same marker type, color and text for both side's Reaper 2
	default					{["B_INF", [0, 0, 0, 0], ""];};
};

_iconCfg