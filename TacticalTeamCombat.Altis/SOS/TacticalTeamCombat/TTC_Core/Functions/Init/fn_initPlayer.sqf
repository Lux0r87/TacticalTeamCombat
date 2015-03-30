/*
    Player initialization function.
    Created by BauerMitFackel
*/

waitUntil {!isNull player && {alive player}};

_DEBUG              = true;
_START_UP_CAPITAL   = 3000;

TTC_MONEY_balance = _START_UP_CAPITAL;
[] spawn TTC_MONEY_fnc_createBalanceDisplay;


// Simulate balance changes
if (_DEBUG) then {

    _changes = [-100, -50, 25, 50, 75, 100, 150, 200];

    while {true} do {
    
        TTC_MONEY_balance = TTC_MONEY_balance + (_changes call BIS_fnc_selectRandom);         
        sleep 10;
    };
};