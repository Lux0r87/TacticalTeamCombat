/*
	http://upload.wikimedia.org/math/9/c/7/9c740a6d2bf1b04dc2da90cd05b1f316.png

	Created by Lux0r
*/


private ["_a","_b","_dotProduct","_orthogonal"];

_a	= [_this, 0] call BIS_fnc_param;
_b	= [_this, 1] call BIS_fnc_param;


_dotProduct	= _b vectorDotProduct _a;			// (b . a)
_orthogonal	= _a vectorMultiply _dotProduct;	// (b . a) * a

/*[
	["Function: %1", "TTC_CORE_fnc_getOrthogonalVectorSimplified"],
	["_a = %1", _a], ["_b = %1", _b], ["_dotProduct = %1", _dotProduct], ["_orthogonal = %1", _orthogonal]
] call TTC_CORE_fnc_log;*/

_orthogonal
