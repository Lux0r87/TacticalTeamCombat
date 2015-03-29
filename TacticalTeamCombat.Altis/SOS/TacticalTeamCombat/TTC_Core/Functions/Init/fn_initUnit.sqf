/*
	Unit initialization function.
	Created by BauerMitFackel
*/

waitUntil {time > 0.0};

_DEBUG = true;

/*
_rolesFile = "TTC_ROLES" call TTC_CORE_fnc_getConstantsFile;
if (isNil {_rolesFile}) exitWith {
	diag_log "ERROR (TTC_CORE_fnc_initUnit): TTC_ROLES file not found"
};

[] call compile preprocessFileLineNumbers _rolesFile;
*/

_initUniformTexture = {

	if (_uniformTexture != "") then {
		_unit setObjectTextureGlobal [0, _uniformTexture]; 
	} else {
		diag_log format["INFO (TTC_CORE_fnc_initUnit): No uniform texture for unit %1", _unit];
	};
	
	// Debug 
	if (_DEBUG) then {
		diag_log format[
			"DEBUG (TTC_CORE_fnc_initUnit # _initUniformTexture): Unit %1 {texture = %2}", _unit, _uniformTexture
		];
	};
};


/*
	Initializes the variables TTC_roleId, TTC_roleName and TTC_markerType
*/
_initVariables = {

	private["_markerTypePrefix", "_markerTypeSuffix", "_markerType"];

	_unit setVariable ["TTC_roleId", _roleId];
	_unit setVariable ["TTC_roleName", _roleName];
	
	_markerTypePrefix = _side call TTC_CORE_fnc_getMrkTypePrefix;
	_markerTypeSuffix = switch (_roleId) do {
		case MEDIC_ID;
		case PARAMEDIC_ID: {
			"med";
		};
		case MARKSMAN_ID;
		case SCOUT_ID: {
			"recon";
		};
		default {
			"inf";
		};
	};
	
	_markerType = format["%1_%2", _markerTypePrefix, _markerTypeSuffix];
	_unit setVariable ["TTC_markerType", _markerType];
	
	// Debug 
	if (_DEBUG) then {
		diag_log format[
			"DEBUG (TTC_CORE_fnc_initUnit # _initVariables): Unit %1 {TTC_roleId = %2, TTC_roleName = %3, TTC_markerType = %4}", 
			_unit, _roleId, _roleName, _markerType
		];
	};
};


//////////


_unit			= [_this, 0] call BIS_fnc_param;
_roleId			= [_this, 1] call BIS_fnc_param;
_uniformTexture	= [_this, 2, "", [""]] call BIS_fnc_param;

_roleName 		= _roleId call TTC_CORE_fnc_getRoleNameById;
_side 			= side _unit;

[] call _initVariables;
[] call _initUniformTexture;