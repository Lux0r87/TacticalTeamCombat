/*
    Created by BauerMitFackel
*/


systemChat "Initializing TTC Shop";

[] call compile preprocessFileLineNumbers "SOS\TacticalTeamCombat\TTC_Shop\Configurations\articles.sqf";
[] call compile preprocessFileLineNumbers "SOS\TacticalTeamCombat\TTC_Shop\Configurations\West\platoonLeader.sqf";
[] call compile preprocessFileLineNumbers "SOS\TacticalTeamCombat\TTC_Shop\Configurations\categories.sqf";

systemChat "TTC Shop initialized";