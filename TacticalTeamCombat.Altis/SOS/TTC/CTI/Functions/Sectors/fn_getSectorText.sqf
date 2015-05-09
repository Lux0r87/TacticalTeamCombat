/*
	Created by Lux0r
*/


#include "dominanceVariables.inc"
#include "sectorVariables.inc"

private ["_sector","_name","_dominance","_text"];

_sector		= [_this, 0] call BIS_fnc_param;
_name		= [_this, 1, TTC_CTI_sectorVariable_name(_sector), [""]] call BIS_fnc_param;
_dominance	= [_this, 2, TTC_CTI_sectorVariable_dominance(_sector), [0]] call BIS_fnc_param;

//[_sector, "TTC_CTI_fnc_getSectorText"] call TTC_CTI_fnc_logSector;


// Create the text for the sector.
_text = format["%1 (%2%3)", _name, (_dominance/TTC_CTI_dominanceMax)*100, "%"];

_text