/*
	Returns true if the given array contains the specified article.
	
	Parameter(s):
		0: ARRAY	- array
		1: NUMBER	- article id
	
	Returns:
		ARRAY - shopping cart
		
    Created by BauerMitFackel
*/

_array	= [_this, 0] call BIS_fnc_param;
_id		= [_this, 1] call BIS_fnc_param;

_path = [_array, _id] call BIS_fnc_findNestedElement;
if (_path isEqualTo []) then {
	_path pushBack -1;
};