/*
	The script updates the article description.
	Params: [_name, _description]
	
    Created by BauerMitFackel
*/

disableSerialization;
_CONTROL_IDC = 52003;

_dialog = uiNamespace getVariable ["TTC_SHOP_shopDialog", nil];
_control = _dialog displayCtrl _CONTROL_IDC;

_name			= [_this, 0, nil] call BIS_fnc_param;
_description	= [_this, 1, nil] call BIS_fnc_param;

if (isNil {_name}) then {
	_control ctrlSetStructuredText parseText "";
} else {
	
	_text = "";
	if (!isNil {_description}) then {
		_text = format ["<t font='PuristaSemiBold'>%1</t><br/><t size='0.8'>%2</t>", _name, _description];
	} else {
		_text = format ["<t font='PuristaSemiBold'>%1</t>", _name];
	};
	
	_control ctrlSetStructuredText parseText _text;
};
