/*
	http://upload.wikimedia.org/math/e/2/6/e268a4e0a9c7e70da578149ae0d49c6b.png

	Created by Lux0r
*/


private ["_a","_b","_magnitude","_variable","_dotProduct","_orthogonal"];

_a	= [_this, 0] call BIS_fnc_param;
_b	= [_this, 1] call BIS_fnc_param;


_magnitude	= vectorMagnitude _a;					// |a|
_variable	= _a vectorMultiply (1/_magnitude);		// a / |a|
_dotProduct	= _b vectorDotProduct _variable;		// (b . (a / [a])
_orthogonal	= _variable vectorMultiply _dotProduct;	// ((b . (a / [a])) * (a / |a|)

[
	["Function: %1", "TTC_CORE_fnc_getOrthogonalVector"],
	["_a = %1", _a], ["_b = %1", _b], ["_magnitude = %1", _magnitude], ["_variable = %1", _variable],
	["_dotProduct = %1", _dotProduct], ["_orthogonal = %1", _orthogonal]
] call TTC_CORE_fnc_log;

_orthogonal
