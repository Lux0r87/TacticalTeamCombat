/*
	Buys all articles from the shopping cart.
	
    Created by BauerMitFackel
*/


_CATEGORY_ID_AMMUNITION		= 7;
_CATEGORY_ID_ATTACHMENTS	= 5;
_CATEGORY_ID_BACKPACKS		= 14;
_CATEGORY_ID_BOATS			= 19;
_CATEGORY_ID_EXPLOSIVES		= 8;
_CATEGORY_ID_FACEWEAR		= 11;
_CATEGORY_ID_HANDGUNS		= 2;
_CATEGORY_ID_HEADWEAR		= 10;
_CATEGORY_ID_HELICOPTERS	= 16;
_CATEGORY_ID_ITEMS			= 9;
_CATEGORY_ID_JETS			= 20;
_CATEGORY_ID_LAUNCHERS		= 3;
_CATEGORY_ID_RIFLES			= 1;
_CATEGORY_ID_SCOPES			= 4;
_CATEGORY_ID_UAVS			= 18;
_CATEGORY_ID_UGVS			= 17;
_CATEGORY_ID_UNIFORMS		= 12;
_CATEGORY_ID_VEHICLES		= 15;
_CATEGORY_ID_VESTS			= 13;

_type_weapon	= 0;
_type_magazine	= 1;
_type_backpack	= 2;
_type_item		= 3;

_assignableItemTypes	= ["Map", "GPS", "UAVTerminal", "Radio", "Compass", "Watch", "NVGoggles", "LaserDesignator"];
_ammunitionGL			= ["Flare", "Shell", "SmokeShell"];


/*
	Returns the index of the category with the given id.
	Parameter(s):
		0: ARRAY	- shopping cart
		1: NUMBER	- category id
	Returns:
		NUMBER - the category index
*/
_getCategoryIndex = {	
	private["_shoppingCart", "_categoryId", "_categoryIndex"];
	
	_shoppingCart	= [_this, 0] call BIS_fnc_param;
	_categoryId		= [_this, 1] call BIS_fnc_param;
	
	_categoryIndex = -1;
	
	{
		if ((_x select 0) == _categoryId) exitWith {
			_categoryIndex = _forEachIndex;
		};
	} forEach _shoppingCart;
	
	_categoryIndex;
};

_getArticleNames = {	
	private["_shoppingCart", "_categoryId", "_categoryIndex", "_backpackEntry"];

	_shoppingCart	= [_this, 0] call BIS_fnc_param;
	_categoryId		= [_this, 1] call BIS_fnc_param;
	_articleNames	= [];
	_categoryIndex	= [_shoppingCart, _categoryId] call _getCategoryIndex;

	if (_categoryIndex != -1) then {
		// format [Article[], amount]
		_entries = (_shoppingCart select _categoryIndex) select 1;
		{
			_article = _x select 0;
			_amount = _x select 1;
			_name = _article select TTC_SHOP_ARTICLE_name;

			for "_x" from 1 to _amount do {
				_articleNames pushBack _name;
			};
		} forEach _entries;
	};

	_articleNames;
};

_hasItemType = {
	private["_type","_items","_hasItem","_return","_itemType"];

	_type		= _this select 0;
	_items		= assignedItems player;
	_hasItem	= false;

	{
		_return		= [_x] call BIS_fnc_itemType;
		_itemType	= _return select 1;

		if (_type == _itemType) exitWith {
			_hasItem = true;
		};
	} forEach _items;

	_hasItem;
};

_add = {
	private["_article","_type"];

	_article	= _this select 0;
	_type		= _this select 1;

	switch (true) do {
		case (player canAddItemToUniform _article): {
			player addItemToUniform  _article;
		};
		case (player canAddItemToVest _article): {
			player addItemToVest _article;
		};
		case (player canAddItemToBackpack _article): {
			player addItemToBackpack _article;
		};
		default {
			switch (_type) do {
				case _type_weapon: {
					_weaponHolder addWeaponCargoGlobal [_article, 1];
				};
				case _type_magazine: {
					_weaponHolder addMagazineCargoGlobal [_article, 1];
				};
				case _type_backpack: {
					_weaponHolder addBackpackCargoGlobal [_article, 1];
				};
				case _type_item: {
					_weaponHolder addItemCargoGlobal [_article, 1];
				};
			};
		};
	};
};

_buyBackpacks = {
	private["_articleNames"];

	_articleNames = [_shoppingCart, _CATEGORY_ID_BACKPACKS] call _getArticleNames;

	{
		if (backpack player == "") then {
			player addBackpackGlobal _x;
		} else {
			_weaponHolder addBackpackCargoGlobal [_x, 1];
		};
	} forEach _articleNames;
};

_buyVests = {
	private["_articleNames"];

	_articleNames = [_shoppingCart, _CATEGORY_ID_VESTS] call _getArticleNames;

	{
		if (vest player == "") then {
			player addVest _x;
		} else {
			[_x, _type_item] call _add;
		};
	} forEach _articleNames;
};

_buyUniforms = {
	private["_articleNames"];

	_articleNames = [_shoppingCart, _CATEGORY_ID_UNIFORMS] call _getArticleNames;

	{
		if (uniform player == "") then {
			player forceAddUniform _x;
		} else {
			[_x, _type_item] call _add;
		};
	} forEach _articleNames;
};

_buyHeadwear = {
	private["_articleNames"];

	_articleNames = [_shoppingCart, _CATEGORY_ID_HEADWEAR] call _getArticleNames;

	{
		if (headgear player == "") then {
			player addHeadgear _x;
		} else {
			[_x, _type_item] call _add;
		};
	} forEach _articleNames;
};

_buyFacewear = {
	private["_articleNames"];

	_articleNames = [_shoppingCart, _CATEGORY_ID_FACEWEAR] call _getArticleNames;

	{
		if (goggles player == "") then {
			player addGoggles _x;
		} else {
			[_x, _type_item] call _add;
		};
	} forEach _articleNames;
};

_buyRifles = {
	private["_articleNames"];

	_articleNames = [_shoppingCart, _CATEGORY_ID_RIFLES] call _getArticleNames;

	{
		if (primaryWeapon player == "") then {
			player addWeaponGlobal _x;
		} else {
			[_x, _type_weapon] call _add;
		};
	} forEach _articleNames;
};

_addHandgunAttachment = {
	private["_attachment","_index","_handgunItems"];

	_attachment	= _this select 0;
	_index		= _this select 1;

	_handgunItems = handgunItems player;

	if ((_handgunItems select _index) == "") then {
		player addHandgunItem _attachment;
		_handgunItems = handgunItems player;

		// If the attachment was not added successfully to the handgun, try to add it to the inventory.
		if ((_handgunItems select _index) == "") then {
			[_attachment, _type_weapon] call _add;
		};
	} else {
		[_attachment, _type_weapon] call _add;
	};
};

_buyHandguns = {
	private["_articleNames"];

	_articleNames = [_shoppingCart, _CATEGORY_ID_HANDGUNS] call _getArticleNames;

	{
		if (handgunWeapon player == "") then {
			player addWeaponGlobal _x;
		} else {
			[_x, _type_weapon] call _add;
		};
	} forEach _articleNames;
};

_buyLaunchers = {
	private["_articleNames"];

	_articleNames = [_shoppingCart, _CATEGORY_ID_LAUNCHERS] call _getArticleNames;

	{
		if (secondaryWeapon player == "") then {
			player addWeaponGlobal _x;
		} else {
			_weaponHolder addWeaponCargoGlobal [_x, 1];
		};
	} forEach _articleNames;
};

_addWeaponAttachment = {
	private["_attachment","_index","_primaryWeaponItems"];

	_attachment	= _this select 0;
	_index		= _this select 1;

	_primaryWeaponItems = primaryWeaponItems player;

	if ((_primaryWeaponItems select _index) == "") then {
		player addPrimaryWeaponItem _attachment;
		_primaryWeaponItems = primaryWeaponItems player;

		// If the attachment was not added successfully to the primary weapon, try to add it to the handgun.
		if ((_primaryWeaponItems select _index) == "") then {
			[_attachment, _index] call _addHandgunAttachment;
		};
	} else {
		[_attachment, _index] call _addHandgunAttachment;
	};
};

_buyAttachments = {
	private["_attachments","_scopes","_articleNames","_return","_type","_primaryWeaponItems"];

	_attachments	= [_shoppingCart, _CATEGORY_ID_ATTACHMENTS] call _getArticleNames;
	_scopes			= [_shoppingCart, _CATEGORY_ID_SCOPES] call _getArticleNames;
	_articleNames	= _attachments + _scopes;

	{
		_return		= [_x] call BIS_fnc_itemType;
		_type		= _return select 1;
		_primaryWeaponItems	= primaryWeaponItems player;

		switch (_type) do {
			case "AccessoryMuzzle": {
				[_x, 0] call _addWeaponAttachment;
			};
			case "AccessoryPointer": {
				[_x, 1] call _addWeaponAttachment;
			};
			case "AccessorySights": {
				[_x, 2] call _addWeaponAttachment;
			};
			case "AccessoryBipod": {
				[_x, 3] call _addWeaponAttachment;
			};
			default {
				["Attachment type unknown!"] call BIS_fnc_error;
				[_x, _type_weapon] call _add;
			};
		};
	} forEach _articleNames;
};

_hasMagazine = {
	private["_magazines","_hasMag","_return","_itemType"];

	_magazines	= primaryWeaponMagazine player;
	_hasMag		= false;

	{
		_return		= [_x] call BIS_fnc_itemType;
		_itemType	= _return select 1;

		if (_itemType == "Bullet") exitWith {
			_hasMag = true;
		};
	} forEach _magazines;

	_hasMag;
};

_hasMagazineGL = {
	private["_magazines","_hasGL","_return","_itemType"];

	_magazines	= primaryWeaponMagazine player;
	_hasGL		= false;

	{
		_return		= [_x] call BIS_fnc_itemType;
		_itemType	= _return select 1;

		if (_itemType in _ammunitionGL) exitWith {
			_hasGL = true;
		};
	} forEach _magazines;

	_hasGL;
};

_buyAmmunition = {
	private["_articleNames","_weaponMags","_handgunMags","_launcherMags","_return","_type"];
	_articleNames = [_shoppingCart, _CATEGORY_ID_AMMUNITION] call _getArticleNames;
	_weaponMags		= getArray (configFile >> "CfgWeapons" >> (primaryWeapon player) >> "magazines");
	_handgunMags	= getArray (configFile >> "CfgWeapons" >> (handgunWeapon player) >> "magazines");
	_launcherMags	= getArray (configFile >> "CfgWeapons" >> (secondaryWeapon player) >> "magazines");

	{
		_return		= [_x] call BIS_fnc_itemType;
		_type		= _return select 1;

		switch (_type) do {
			case "Bullet": {
				// Check if the magazine can be added to the primary weapon.
				if (_x in _weaponMags && {!([] call _hasMagazine)}) then {
					player addMagazine _x;
				} else { // Otherwise: Try to add the magazine to the handgun.
					if (_x in _handgunMags && {count handgunMagazine player <= 0}) then {
						player addMagazine _x;
					} else {
						[_x, _type_magazine] call _add;
					};
				};
			};
			case "Flare";
			case "Shell";
			case "SmokeShell": {
				if (_x in _weaponMags && {!([] call _hasMagazineGL)}) then {
					player addMagazine _x;					
				} else {
					[_x, _type_magazine] call _add;
				};
			};
			case "Missile";
			case "Rocket": {
				if (_x in _launcherMags && {count secondaryWeaponMagazine player <= 0}) then {
					player addMagazine _x;
				} else {
					[_x, _type_magazine] call _add;
				};
			};
			default {
				[_x, _type_magazine] call _add;
			};
		};

		if (needReload player == 1) then {
			reload player
		};
	} forEach _articleNames;
};

_buyItems = {
	private["_articleNames","_return","_type"];
	_articleNames	= [_shoppingCart, _CATEGORY_ID_ITEMS] call _getArticleNames;

	{
		_return		= [_x] call BIS_fnc_itemType;
		_type		= _return select 1;

		if (_type == "Binocular") then {
			if !([_type] call _hasItemType) then {
				player addWeaponGlobal _x;
			} else {
				[_x, _type_weapon] call _add;
			};
		} else {
			if (_type in _assignableItemTypes && {!([_type] call _hasItemType)}) then {
				player linkItem _x;
			} else {
				[_x, _type_item] call _add;
			};
		};
	} forEach _articleNames;
};


//////////


private["_shoppingCart","_position","_weaponHolder","_weaponCargo","_magazineCargo","_backpackCargo","_itemCargo","_count","_articles","_classNames","_amounts"];

_shoppingCart	= [] call TTC_SHOP_fnc_getShoppingCart;
_position		= getPosATL player;
_weaponHolder	= createVehicle ["GroundWeaponHolder", _position, [], 0, "CAN_COLLIDE"];


[] call _buyBackpacks;
[] call _buyVests;
[] call _buyUniforms;
[] call _buyHeadwear;
[] call _buyFacewear;
[] call _buyRifles;
[] call _buyAttachments;
[] call _buyHandguns;
[] call _buyLaunchers;
[] call _buyAmmunition;
[] call _buyItems;


// Print articles added to the weapon holder.
_weaponCargo	= getWeaponCargo  _weaponHolder;
_magazineCargo	= getMagazineCargo  _weaponHolder;
_backpackCargo	= getBackpackCargo _weaponHolder;
_itemCargo		= getItemCargo _weaponHolder;
_count			= count (_weaponCargo select 0) + count (_magazineCargo select 0) + count (_backpackCargo select 0) + count (_itemCargo select 0);

if (_count > 0) then {
	_articles = "";

	{
		_classNames	= _x select 0;
		_amounts	= _x select 1;

		for [{_i = 0}, {_i < count _classNames}, {_i = _i + 1}] do {
			_articles = _articles + format["%1 x %2, ", (_amounts select _i), (_classNames select _i)];
		};
	} forEach [_weaponCargo, _magazineCargo, _backpackCargo, _itemCargo];

	systemChat "The following articles couldn't be stored in the inventory:";
	systemChat _articles;
};
