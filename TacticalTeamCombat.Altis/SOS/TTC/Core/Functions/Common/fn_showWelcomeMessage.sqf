/*
	Created by Lux0r
*/


private["_separator","_flag","_box","_message"];


waitUntil {!(IsNull player) && (time > 0.0)};

_separator	= parseText "<br/>------------------------------------------------------------<br/>"; 
_flag		= [side player] call TTC_CORE_fnc_getFlagForSide;
_box		= "\A3\ui_f\data\map\Markers\Military\box_ca.paa";

_message = composeText [
	parseText "<t size='0.9'>Tactical Team Combat focus on </t><t size='0.9' font='PuristaSemiBold'>Player vs Player</t><t size='0.9'>. There are only a few defensive AI soldiers.</t>",
	_separator,
	parseText "<t color='#27AE60'>Objective:</t><t size='0.9'> Capture all sectors to win the mission. Be careful that you can only capture sectors, which have a connection to your base.</t>",
	lineBreak,
	parseText "<t color='#27AE60'>Roles:</t><t size='0.9'> Each player represents a particular role in a platoon. Every of the available roles has specific skills and equipment. Team play is essential to win.</t>",
	lineBreak,
	parseText "<t color='#27AE60'>Bitcoins:</t><t size='0.9'> You can earn money by capturing sectors and by defending them against the enemy.</t>",
	lineBreak,
	parseText "<t color='#27AE60'>Shop:</t><t size='0.9'> The shop provides you with the gear and vehicle you will need to achieve the mission.</t>",
	lineBreak,
	parseText "<t color='#27AE60'>Teleporting:</t><t size='0.9'> In the base are some research buildings, where you can teleport to sectors dominated by your team. It costs some money (depending on the distance), but will allow you to return faster to the AO (area of operation).</t>",
	lineBreak,
	lineBreak,
	parseText "<t color='#E74C3C'>Basic Rules:</t>",
	lineBreak,
	image _box,
	parseText "<t size='0.9'>Cooperate with your team mates </t>",
	image _flag,
	lineBreak,
	image _box,
	parseText "<t size='0.9'>Team killing and base raping is strictly prohibited.</t>",
	lineBreak,
	image _box,
	parseText "<t size='0.9'>Speak english, please.</t>",
	lineBreak,
	image _box,
	parseText "<t size='0.9'>Have fun!</t>"
];

"Welcome to TTC" hintC _message;


TTC_CORE_hintC_EH = findDisplay 72 displayAddEventHandler ["unload", {
	0 = _this spawn {
		_this select 0 displayRemoveEventHandler ["unload", TTC_CORE_hintC_EH];
		hintSilent "";
	};
}];
