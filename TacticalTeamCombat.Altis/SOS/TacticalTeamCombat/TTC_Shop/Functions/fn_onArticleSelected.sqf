/*
	This script is called when the player selects a article from the article list.
	Params: [_control, _index]
	
    Created by BauerMitFackel
*/

disableSerialization;

_control		= [_this, 0] call BIS_fnc_param;
_index			= [_this, 1] call BIS_fnc_param;
_picture		= nil;
_name			= nil;
_description	= nil;

if (_index >= 0) then {

	_articleId		= _control lnbValue [_index, 0];
	_article 		= _articleId call TTC_SHOP_fnc_getArticleById;	
	_picture		= _article select 5;
	_name			= _article select 3;
	_description	= _article select 4;
};

[_name, _description] call TTC_SHOP_fnc_setArticleDescription;
