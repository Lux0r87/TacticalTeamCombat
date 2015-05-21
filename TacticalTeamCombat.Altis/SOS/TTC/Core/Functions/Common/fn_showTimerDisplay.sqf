/*
    Created by Lux0r
*/


disableSerialization;

private ["_timer","_display","_control","_text"];

_timer	= [_this, 0] call BIS_fnc_param;

//[["Function: %1", "TTC_CORE_fnc_showTimerDisplay"], ["_timer = %1", _timer]] call TTC_CORE_fnc_log;


// Safety measure: Create the timer display, if it doesn't exist.
if (isNull (uiNamespace getVariable ["TTC_CORE_timerDisplay", displayNull])) then {
	1006 cutRsc ["TTC_CORE_timerDisplay", "PLAIN"];
};

// Display the control.
_display = uiNamespace getVariable "TTC_CORE_timerDisplay";
_control = _display displayCtrl 1007;

// Set the text.
if (_timer > 0) then {
	_text = text format["The mission starts in %1s.", _timer];
} else {
	_text = text "Mission started!";
	1006 cutFadeOut 10;
};

_control ctrlSetStructuredText _text;
