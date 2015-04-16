/*
    Created by BauerMitFackel
*/


systemChat "Initializing TTC Shop";

[] call compile preprocessFileLineNumbers "SOS\TTC\Shop\Configurations\articles.sqf";
[] call compile preprocessFileLineNumbers "SOS\TTC\Shop\Configurations\West\platoonLeader.sqf";
[] call compile preprocessFileLineNumbers "SOS\TTC\Shop\Configurations\categories.sqf";

systemChat "TTC Shop initialized";