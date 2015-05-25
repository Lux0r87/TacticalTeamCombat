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
_CATEGORY_ID_GRENADES		= 75;
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

_type_weapon		= 0;
_type_magazine		= 1;
_type_backpack		= 2;
_type_item			= 3;

_target_backpack	= 0;
_target_vest		= 1;
_target_uniform		= 2;

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

_addToWeaponHolder = {
	private["_article","_type"];

	_article	= _this select 0;
	_type		= _this select 1;

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

_addToUniform = {
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
			[_article, _type] call _addToWeaponHolder;
		};
	};
};

_addToVest = {
	private["_article","_type"];

	_article	= _this select 0;
	_type		= _this select 1;

	switch (true) do {
		case (player canAddItemToVest _article): {
			player addItemToVest _article;
		};
		case (player canAddItemToUniform _article): {
			player addItemToUniform  _article;
		};
		case (player canAddItemToBackpack _article): {
			player addItemToBackpack _article;
		};
		default {
			[_article, _type] call _addToWeaponHolder;
		};
	};
};

_addToBackpack = {
	private["_article","_type"];

	_article	= _this select 0;
	_type		= _this select 1;

	switch (true) do {
		case (player canAddItemToBackpack _article): {
			player addItemToBackpack _article;
		};
		case (player canAddItemToVest _article): {
			player addItemToVest _article;
		};
		case (player canAddItemToUniform _article): {
			player addItemToUniform  _article;
		};
		default {
			[_article, _type] call _addToWeaponHolder;
		};
	};
};

_addTo = {
	private["_target","_article","_type"];

	_target		= _this select 0;
	_article	= _this select 1;
	_type		= _this select 2;

	switch (_target) do {
		case _target_uniform: {
			[_article, _type] call _addToUniform;
		};
		case _target_vest: {
			[_article, _type] call _addToVest;
		};
		case _target_backpack: {
			[_article, _type] call _addToBackpack;
		};
	};
};

_addStoredItems = {
	private["_storedItems","_target","_return","_category","_type"];

	_storedItems = _this select 0;
	_target		 = _this select 1;

	{
		_return		= [_x] call BIS_fnc_itemType;
		_category	= _return select 0;
		_type		= _return select 1;

		switch (_category) do {
			case "Weapon": {
				switch (_type) do {
					case "AssaultRifle";
					case "GrenadeLauncher";
					case "MachineGun";
					case "Rifle";
					case "SubmachineGun";
					case "SniperRifle";
					case "Handgun";
					case "Launcher";
					case "MissileLauncher";
					case "RocketLauncher": {
						[_target, _x, _type_weapon] call _addTo;
					};
					case "Magazine";
					case "Throw": {
						[_target, _x, _type_magazine] call _addTo;
					};
					default {
						["Unknown weapon"] call BIS_fnc_log;
					};
				};
			};
			case "Item": {				
				switch (_type) do {
					case "AccessoryMuzzle";
					case "AccessoryPointer";
					case "AccessorySights";
					case "Binocular": {
						[_target, _x, _type_weapon] call _addTo;
					};
					case "Compass";
					case "FirstAidKit";
					case "GPS";
					case "LaserDesignator";
					case "Map";
					case "Medikit";
					case "MineDetector";
					case "NVGoggles";
					case "Radio";
					case "Toolkit";
					case "UAVTerminal";
					case "Watch": {
						[_target, _x, _type_item] call _addTo;
					};
					default {
						["Unknown item"] call BIS_fnc_log;
					};
				};
			};
			case "Equipment": {
				switch (_type) do {
					case "Glasses";
					case "Headgear";
					case "Vest";
					case "Uniform": {
						[_target, _x, _type_item] call _addTo;
					};
					case "Backpack": {
						[_target, _x, _type_backpack] call _addTo;
					};
					default {
						["Unknown equipment"] call BIS_fnc_log;
					};
				};
			};
			case "Magazine": {
				[_target, _x, _type_magazine] call _addTo;
			};
			case "Mine": {
				[_target, _x, _type_magazine] call _addTo;
			};
			default {
				["Unknown category"] call BIS_fnc_log;
			};
		};
	} forEach _storedItems;
};

_buyBackpacks = {
	private["_articleNames","_storeItems","_backpackItems"];

	_articleNames	= [_this, 0, ([_shoppingCart, _CATEGORY_ID_BACKPACKS] call _getArticleNames), [[]]] call BIS_fnc_param;
	_storeItems		= [_this, 1, true, [true]] call BIS_fnc_param;

	if !(_articleNames isEqualTo []) then {
		// Store items of the unit's current backpack.
		if (_storeItems) then {
			_backpackItems = backpackItems player;
			TTC_SHOP_storedItems_backpack = TTC_SHOP_storedItems_backpack + _backpackItems;

			// Clear the backpack.
			clearAllItemsFromBackpack player;
		};

		// Add new backpack(s).
		{
			player addBackpackGlobal _x;
		} forEach _articleNames;
	};
};

_buyVests = {
	private["_articleNames","_storeItems","_vestItems","_vest"];

	_articleNames	= [_this, 0, ([_shoppingCart, _CATEGORY_ID_VESTS] call _getArticleNames), [[]]] call BIS_fnc_param;
	_storeItems		= [_this, 1, true, [true]] call BIS_fnc_param;

	if !(_articleNames isEqualTo []) then {
		// Store items of the unit's current vest.
		if (_storeItems) then {
			_vestItems = vestItems player;
			TTC_SHOP_storedItems_vest = TTC_SHOP_storedItems_vest + _vestItems;

			// Clear the vest.
			/*{
				player removeItemFromVest _x;
			} forEach _vestItems;*/
		};

		// Add new vest(s).
		{
			_vest = vest player;

			// Add the vest to the ground holder, if it's not a 'Rangemaster Belt'.
			if (_vest != "V_Rangemaster_belt") then {
				_weaponHolder addItemCargoGlobal [_vest, 1];
			};

			player addVest _x;
		} forEach _articleNames;
	};
};

_buyUniforms = {
	private["_articleNames","_storeItems","_uniformItems","_uniform"];

	_articleNames	= [_this, 0, ([_shoppingCart, _CATEGORY_ID_UNIFORMS] call _getArticleNames), [[]]] call BIS_fnc_param;
	_storeItems		= [_this, 1, true, [true]] call BIS_fnc_param;

	if !(_articleNames isEqualTo []) then {
		// Store items of the unit's current uniform.
		if (_storeItems) then {
			_uniformItems = uniformItems player;
			TTC_SHOP_storedItems_uniform = TTC_SHOP_storedItems_uniform + _uniformItems;

			// Clear the uniform.
			/*{
				player removeItemFromUniform _x;
			} forEach _uniformItems;*/
		};

		// Add new uniform(s).
		{
			_uniform = uniform player;

			if (_uniform != "") then {
				// Add the old uniform to the ground holder.
				_weaponHolder addItemCargoGlobal [_uniform, 1];
			};

			player forceAddUniform _x;
		} forEach _articleNames;
	};
};

_buyHeadwear = {
	private["_articleNames"];

	_articleNames = [_this, 0, ([_shoppingCart, _CATEGORY_ID_HEADWEAR] call _getArticleNames), [[]]] call BIS_fnc_param;

	{
		if (headgear player == "") then {
			player addHeadgear _x;
		} else {
			[_x, _type_item] call _addToUniform;
		};
	} forEach _articleNames;
};

_buyFacewear = {
	private["_articleNames"];

	_articleNames = [_this, 0, ([_shoppingCart, _CATEGORY_ID_FACEWEAR] call _getArticleNames), [[]]] call BIS_fnc_param;

	{
		if (goggles player == "") then {
			player addGoggles _x;
		} else {
			[_x, _type_item] call _addToUniform;
		};
	} forEach _articleNames;
};

_hasMagazine = {
	private["_magazines","_hasMag","_return","_type"];

	_magazines	= primaryWeaponMagazine player;
	_hasMag		= false;

	{
		_return	= [_x] call BIS_fnc_itemType;
		_type	= _return select 1;

		if (_type == "Bullet") exitWith {
			_hasMag = true;
		};
	} forEach _magazines;

	_hasMag;
};

_hasMagazineGL = {
	private["_magazines","_hasGL","_return","_type"];

	_magazines	= primaryWeaponMagazine player;
	_hasGL		= false;

	{
		_return	= [_x] call BIS_fnc_itemType;
		_type	= _return select 1;

		if (_type in _ammunitionGL) exitWith {
			_hasGL = true;
		};
	} forEach _magazines;

	_hasGL;
};

_buyAmmunition = {
	private["_articleNames","_weaponMags","_handgunMags","_launcherMags","_return","_type"];

	_articleNames = [_this, 0, ([_shoppingCart, _CATEGORY_ID_AMMUNITION] call _getArticleNames), [[]]] call BIS_fnc_param;

	_weaponMags		= getArray (configFile >> "CfgWeapons" >> (primaryWeapon player) >> "magazines");
	_handgunMags	= getArray (configFile >> "CfgWeapons" >> (handgunWeapon player) >> "magazines");
	_launcherMags	= getArray (configFile >> "CfgWeapons" >> (secondaryWeapon player) >> "magazines");

	{
		_return	= [_x] call BIS_fnc_itemType;
		_type	= _return select 1;

		switch (_type) do {
			case "Bullet": {
				// Check if the magazine can be added to the primary weapon.
				if (!_reloadedWeapon && (_x in _weaponMags) && {!([] call _hasMagazine)}) then {
					_reloadedWeapon = true;
					player addMagazine _x;
				} else { // Otherwise: Try to add the magazine to the handgun.
					if (!_reloadedHandgun && (_x in _handgunMags) && {count handgunMagazine player <= 0}) then {
						_reloadedHandgun = true;
						player addMagazine _x;
					} else {
						[_x, _type_magazine] call _addToUniform;
					};
				};
			};
			case "Flare";
			case "Shell";
			case "SmokeShell": {
				if (!_reloadedGL && (_x in _weaponMags) && {!([] call _hasMagazineGL)}) then {
					_reloadedGL = true;
					player addMagazine _x;					
				} else {
					[_x, _type_magazine] call _addToUniform;
				};
			};
			case "Missile";
			case "Rocket": {
				if (!_reloadedLauncher && (_x in _launcherMags) && {count secondaryWeaponMagazine player <= 0}) then {
					_reloadedLauncher = true;
					player addMagazine _x;
				} else {
					[_x, _type_magazine] call _addToUniform;
				};
			};
			default {
				[_x, _type_magazine] call _addToUniform;
			};
		};

		if (needReload player == 1) then {
			reload player
		};
	} forEach _articleNames;
};

_buyRifles = {
	private["_articleNames"];

	_articleNames = [_this, 0, ([_shoppingCart, _CATEGORY_ID_RIFLES] call _getArticleNames), [[]]] call BIS_fnc_param;

	{
		if (primaryWeapon player == "") then {
			player addWeaponGlobal _x;
		} else {
			[_x, _type_weapon] call _addToUniform;
		};
	} forEach _articleNames;
};

_buyHandguns = {
	private["_articleNames"];

	_articleNames = [_this, 0, ([_shoppingCart, _CATEGORY_ID_HANDGUNS] call _getArticleNames), [[]]] call BIS_fnc_param;

	{
		if (handgunWeapon player == "") then {
			player addWeaponGlobal _x;
		} else {
			[_x, _type_weapon] call _addToUniform;
		};
	} forEach _articleNames;
};

_buyLaunchers = {
	private["_articleNames"];

	_articleNames = [_this, 0, ([_shoppingCart, _CATEGORY_ID_LAUNCHERS] call _getArticleNames), [[]]] call BIS_fnc_param;

	{
		if (secondaryWeapon player == "") then {
			player addWeaponGlobal _x;
		} else {
			_weaponHolder addWeaponCargoGlobal [_x, 1];
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
			[_attachment, _type_weapon] call _addToUniform;
		};
	} else {
		[_attachment, _type_weapon] call _addToUniform;
	};
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

_getAttachmentsFromShoppingCart = {
	private["_attachments","_scopes","_articleNames"];

	_attachments	= [_shoppingCart, _CATEGORY_ID_ATTACHMENTS] call _getArticleNames;
	_scopes			= [_shoppingCart, _CATEGORY_ID_SCOPES] call _getArticleNames;
	_articleNames	= _attachments + _scopes;

	_articleNames;
};

_buyAttachments = {
	private["_attachments","_scopes","_articleNames","_return","_type","_primaryWeaponItems"];

	_articleNames = [_this, 0, ([] call _getAttachmentsFromShoppingCart), [[]]] call BIS_fnc_param;

	{
		_return	= [_x] call BIS_fnc_itemType;
		_type	= _return select 1;
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
				[_x, _type_weapon] call _addToUniform;
			};
		};
	} forEach _articleNames;
};

_buyExplosives = {
	private["_articleNames"];

	_articleNames = [_this, 0, ([_shoppingCart, _CATEGORY_ID_EXPLOSIVES] call _getArticleNames), [[]]] call BIS_fnc_param;

	{
		[_x, _type_magazine] call _addToUniform;
	} forEach _articleNames;
};

_buyGrenades = {
	private["_articleNames"];

	_articleNames = [_this, 0, ([_shoppingCart, _CATEGORY_ID_GRENADES] call _getArticleNames), [[]]] call BIS_fnc_param;

	{
		[_x, _type_magazine] call _addToUniform;
	} forEach _articleNames;
};

_buyItems = {
	private["_articleNames","_return","_type"];

	_articleNames = [_this, 0, ([_shoppingCart, _CATEGORY_ID_ITEMS] call _getArticleNames), [[]]] call BIS_fnc_param;

	{
		_return	= [_x] call BIS_fnc_itemType;
		_type	= _return select 1;

		if (_type == "Binocular") then {
			if !([_type] call _hasItemType) then {
				player addWeaponGlobal _x;
			} else {
				[_x, _type_weapon] call _addToUniform;
			};
		} else {
			if (_type in _assignableItemTypes && {!([_type] call _hasItemType)}) then {
				player linkItem _x;
			} else {
				[_x, _type_item] call _addToUniform;
			};
		};
	} forEach _articleNames;
};

_buyVehicles = {
	private["_vehicles","_ugvs","_articleNames","_side","_vehSpawnPos","_vehSpawnDir","_texture"];

	_vehicles		= [_shoppingCart, _CATEGORY_ID_VEHICLES] call _getArticleNames;
	_ugvs			= [_shoppingCart, _CATEGORY_ID_UGVS] call _getArticleNames;
	_articleNames	= _vehicles + _ugvs;

	_side			= side player;
	_vehSpawnPos	= missionNamespace getVariable [format["TTC_BASE_%1_VehSpawnPos", _side], [0,0]];
	_vehSpawnDir	= missionNamespace getVariable [format["TTC_BASE_%1_VehSpawnDir", _side], 0];
	_texture		= if (_side == resistance) then {"Black"} else {""};

	{
		_veh = [_x, _vehSpawnPos, _vehSpawnDir, _texture] call TTC_CORE_fnc_spawnVehicle;
		TTC_CORE_vehicles pushBack _veh;
		sleep 0.2;
	} forEach _articleNames;
};

_buyHelicopters = {
	private["_articleNames","_side","_heliSpawnPos","_heliSpawnDir","_texture"];

	_articleNames	= [_shoppingCart, _CATEGORY_ID_HELICOPTERS] call _getArticleNames;

	_side			= side player;
	_heliSpawnPos	= missionNamespace getVariable [format["TTC_BASE_%1_HeliSpawnPos", _side], [0,0]];
	_heliSpawnDir	= missionNamespace getVariable [format["TTC_BASE_%1_HeliSpawnDir", _side], 0];
	_texture		= if (_side == resistance) then {"Black"} else {""};

	{
		_heli = [_x, _heliSpawnPos, _heliSpawnDir, _texture] call TTC_CORE_fnc_spawnHelicopter;
		TTC_CORE_vehicles pushBack _heli;
		sleep 0.2;
	} forEach _articleNames;
};


//////////


private[
	"_shoppingCart","_position","_weaponHolder","_reloadedHandgun","_reloadedWeapon","_reloadedGL","_reloadedLauncher","_shoppingCartCosts",
	"_weaponCargo","_magazineCargo","_backpackCargo","_itemCargo","_count","_articles","_classNames","_amounts"
];

_shoppingCart	= [] call TTC_SHOP_fnc_getShoppingCart;
_position		= getPosATL player;
_weaponHolder	= createVehicle ["Library_WeaponHolder", _position, [], 0, "CAN_COLLIDE"];

// Helper variables.
_reloadedHandgun	= false;
_reloadedWeapon		= false;
_reloadedGL			= false;
_reloadedLauncher	= false;

// Variable to store items from replaced uniform/vest/backpack.
TTC_SHOP_storedItems_backpack	= [];
TTC_SHOP_storedItems_vest		= [];
TTC_SHOP_storedItems_uniform	= [];

// Take the money.
_shoppingCartCosts = [_shoppingCart] call TTC_SHOP_fnc_getShoppingCartCosts;
["Purchase", -_shoppingCartCosts] spawn TTC_BTC_fnc_addBalanceChange;


[] call _buyBackpacks;
[] call _buyVests;
[] call _buyUniforms;
[TTC_SHOP_storedItems_backpack, _target_backpack] call _addStoredItems;
[TTC_SHOP_storedItems_vest, _target_vest] call _addStoredItems;
[TTC_SHOP_storedItems_uniform, _target_uniform] call _addStoredItems;
[] call _buyHeadwear;
[] call _buyFacewear;
[] call _buyAmmunition;
[] call _buyRifles;
[] call _buyHandguns;
[] call _buyLaunchers;
[] call _buyAttachments;
[] call _buyExplosives;
[] call _buyGrenades;
[] call _buyItems;
[] call _buyVehicles;
[] call _buyHelicopters;


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
