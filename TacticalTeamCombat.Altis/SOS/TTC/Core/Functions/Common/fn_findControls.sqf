/*
	Created by Lux0r
*/


disableSerialization;

_idd		= _this select 0;
_idc		= _this select 1;
_controls	= [];

{
	if ((ctrlIDD _x) isEqualTo _idd) then {
		if (!isNull (_x displayCtrl _idc)) then {
			_controls pushBack (_x displayCtrl _idc)
		};
	};
} forEach (allDisplays + (uiNamespace getVariable "IGUI_Displays"));

_controls
