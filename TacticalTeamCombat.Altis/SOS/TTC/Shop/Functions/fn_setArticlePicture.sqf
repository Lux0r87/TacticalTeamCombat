/*
	The script updates the article picture.
	Params: _picture
	
    Created by BauerMitFackel
*/

disableSerialization;
_CONTROL_IDC = 52002;

_dialog = uiNamespace getVariable ["TTC_SHOP_shopDialog", nil];
_control = _dialog displayCtrl _CONTROL_IDC;

if (isNil {_picture}) then {
	_control ctrlSetText "";
} else {
	_control ctrlSetText _picture;
};
