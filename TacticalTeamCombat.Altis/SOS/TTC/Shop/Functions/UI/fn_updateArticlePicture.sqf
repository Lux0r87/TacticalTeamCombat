/*
	Displays the picture of the given article in the article picture control.
	
	Parameter(s):
		0: ARRAY - article
		
    Created by BauerMitFackel
*/

disableSerialization;

private["_control", "_article", "_picture"];

_control = uiNamespace getVariable ["TTC_SHOP_UI_articlePicture", nil];
if (!isNil {_control}) then {
	
	_article = _this;
	if (isNil {_article}) then {
		_control ctrlSetText "";
	} else {
	
		_picture = _article select TTC_SHOP_ARTICLE_picture; 
		if (isNil {_picture}) then {
			_control ctrlSetText "";
		} else {
			_control ctrlSetText _picture;
		};
		
	};
	
} else {
	["Variable TTC_SHOP_UI_articlePicture not defined"] call BIS_fnc_error;
};
