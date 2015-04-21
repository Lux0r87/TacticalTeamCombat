/*
	Updates the article description.
	
	Parameter(s):
		0: ARRAY - article array
		
    Created by BauerMitFackel
*/

disableSerialization;

_control = uiNamespace getVariable ["TTC_SHOP_UI_articleDescription", nil];
if (!isNil {_control}) then {
	
	_article = _this;
	if (isNil {_article}) then {
		_control ctrlSetStructuredText parseText "";
	} else {
	
		_displayName = _article select TTC_SHOP_ARTICLE_displayName;
		_description = _article select TTC_SHOP_ARTICLE_description;

		_text = format ["<t font='PuristaSemiBold'>%1</t>", _displayName];
		if (!isNil {_description}) then {
			_text = format ["%1<br/><t size='0.8'>%2</t>", _text, _description];
		};
		
		_control ctrlSetStructuredText parseText _text;
		
		/*
		_letterCount = count (toArray _text);
		if (_letterCount > 75) then {
			
			_position = ctrlPosition _control;
			_height = _position select 3;
			_height = _height * 2;
			
			_position set [3, _height];
			_control ctrlSetPosition _position;
			_control ctrlCommit 0;
		};
		*/
	};
} else {
	["Variable TTC_SHOP_UI_articleDescription not defined"] call BIS_fnc_error;
};
