/*
	Defines the position, direction and size of all sectors (triggers) at this location.
	
	The sectors are defined with the following pattern:
	[<name>, [<posX>,<poY>], <axisA>, <axisB>, <direction>, <rectangle>, <side>, <dominance>, <trigger>, <markerArea>, <marker>]
	
	Created by Lux0r
*/

TTC_SC_sectors = [
	["Sector1", [3510,10113], 30, 30, 45, true, resistance, 100, objNull, "", ""],
	["Sector2", [3532,10274], 20, 20, 0, true, east, 100, objNull, "", ""],
	["Sector3", [3574,10188], 20, 20, 0, true, east, 100, objNull, "", ""],
	["Sector4", [3583,10307], 20, 20, 0, true, east, 100, objNull, "", ""],
	["Sector5", [3607,10239], 30, 30, 0, false, east, 100, objNull, "", ""],
	["Sector6", [3635,10150], 20, 20, 0, true, east, 100, objNull, "", ""],
	["Sector7", [3615,10336], 20, 20, 0, true, east, 100, objNull, "", ""],
	["Sector8", [3694,10264], 20, 20, 0, true, east, 100, objNull, "", ""],
	["Sector9", [3826,10264], 30, 30, 0, true, west, 100, objNull, "", ""]
];