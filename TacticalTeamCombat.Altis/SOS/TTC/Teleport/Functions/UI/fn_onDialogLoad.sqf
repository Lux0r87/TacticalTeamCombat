/*
    Created by BauerMitFackel
*/

disableSerialization;

_dialog = [_this, 0] call BIS_fnc_param;

uiNamespace setVariable ["TTC_TP_UI_dialog", 				_dialog];
uiNamespace setVariable ["TTC_TP_UI_sectorList_header", 	_dialog displayCtrl 60001];
uiNamespace setVariable ["TTC_TP_UI_sectorList_background", _dialog displayCtrl 60002];
uiNamespace setVariable ["TTC_TP_UI_sectorList", 			_dialog displayCtrl 60003];
uiNamespace setVariable ["TTC_TP_UI_cancel", 				_dialog displayCtrl 60004];
uiNamespace setVariable ["TTC_TP_UI_teleport", 				_dialog displayCtrl 60005];
