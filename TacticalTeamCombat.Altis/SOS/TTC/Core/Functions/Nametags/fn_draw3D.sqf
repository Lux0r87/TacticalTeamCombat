/*
	Created by Lux0r
*/


#define TTC_CORE_fontClose "PuristaSemiBold"
#define TTC_CORE_fontFar "PuristaMedium"
#define TTC_CORE_fontSizeClose 0.035
#define TTC_CORE_fontSizeFar 0.030
#define TTC_CORE_distanceClose 500
#define TTC_CORE_distanceFar 1000
#define TTC_CORE_cursorTargetName (name cursorTarget)
#define TTC_CORE_cursorTargetClassname getText(configFile >> "CfgVehicles" >> (typeOf cursorTarget) >> "DisplayName")
#define TTC_CORE_cursorTargetDistance (player distance cursorTarget)
#define TTC_CORE_visiblePosition (visiblePosition cursorTarget)
#define TTC_CORE_nametagPosUnit [TTC_CORE_visiblePosition select 0, TTC_CORE_visiblePosition select 1, ((getPosATLVisual cursorTarget) select 2) + 1.5]
#define TTC_CORE_nametagPosVehicle [TTC_CORE_visiblePosition select 0, TTC_CORE_visiblePosition select 1, ((getPosATLVisual cursorTarget) select 2) + 2.0]
#define TTC_CORE_isUnit (cursorTarget isKindOf "MAN")
#define TTC_CORE_isVehicle ({cursorTarget isKindOf _x;} count ["AIR","CAR","SHIP","TANK"] > 0)
#define TTC_CORE_isFriendly (side cursorTarget == playerSide)
#define TTC_CORE_conditionIsUnit (TTC_CORE_isUnit && {TTC_CORE_isFriendly})
#define TTC_CORE_conditionIsVehicle (TTC_CORE_isVehicle && {!(player in crew cursorTarget)})

private ["_color","_name","_crew","_unit","_unitNames"];

_color	= [side player, false] call BIS_fnc_sideColor;

_getRoleOrClassName = {
	private ["_roleName","_name"];
	_roleName = cursorTarget getVariable "TTC_roleName";

	_name = if (!isNil "_roleName") then {
		_roleName;
	} else {
		TTC_CORE_cursorTargetClassname;
	};

	_name
};

if (alive cursorTarget) then {
	if (TTC_CORE_cursorTargetDistance <= TTC_CORE_distanceClose) then {
		if (TTC_CORE_conditionIsUnit) then {
			_name = [] call _getRoleOrClassName;
			drawIcon3D ["", _color, TTC_CORE_nametagPosUnit, 0, 0, 0, format["%1 (%2)", _name, TTC_CORE_cursorTargetName], 2, TTC_CORE_fontSizeClose, TTC_CORE_fontClose];
		};

		if (TTC_CORE_conditionIsVehicle) then {
			_crew	= crew cursorTarget;
			_unit	= _crew select 0;

			if (side _unit == playerSide) then {
				_unitNames	= "";

				{
					if (alive _x) then {
						if (_unitNames != "") then {
							_unitNames = _unitNames + ", ";
						};

						_unitNames = _unitNames + (name _x);
					};
				} forEach _crew;

				drawIcon3D ["", _color, TTC_CORE_nametagPosVehicle, 0, 0, 0, format["%1 (%2)", TTC_CORE_cursorTargetClassname, _unitNames], 2, TTC_CORE_fontSizeClose, TTC_CORE_fontClose];
			};
		};
	} else {
		if (TTC_CORE_cursorTargetDistance <= TTC_CORE_distanceFar) then {
			if (TTC_CORE_conditionIsUnit) then {
				_name = [] call _getRoleOrClassName;
				drawIcon3D ["", _color, TTC_CORE_nametagPosUnit, 0, 0, 0, _name, 2, TTC_CORE_fontSizeFar, TTC_CORE_fontFar];
			};

			if (TTC_CORE_conditionIsVehicle) then {
				_crew	= crew cursorTarget;
				_unit	= _crew select 0;

				if (side _unit == playerSide) then {
					drawIcon3D ["", _color, TTC_CORE_nametagPosVehicle, 0, 0, 0, TTC_CORE_cursorTargetClassname, 2, TTC_CORE_fontSizeFar, TTC_CORE_fontFar];
				};
			};
		};
	};
};