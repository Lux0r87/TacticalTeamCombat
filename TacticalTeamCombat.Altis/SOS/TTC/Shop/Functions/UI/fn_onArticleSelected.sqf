/*
	This script is called when the player selects a article from the article list.
	
	Parameter(s):
		0: CONTROL	- the article list display control
		1: NUMBER	- the index of the selected article
	
    Created by BauerMitFackel
*/

disableSerialization;

private["_control","_index","_article","_id"];

_control	= [_this, 0] call BIS_fnc_param;
_index		= [_this, 1] call BIS_fnc_param;
_article	= nil;


if (_index >= 0) then {
	_id = _control lnbValue [_index, 0];
	_article = _id call TTC_SHOP_fnc_getArticleById;	
};

_article spawn TTC_SHOP_UI_fnc_updateArticlePicture;
_article spawn TTC_SHOP_UI_fnc_updateArticleDescription;
