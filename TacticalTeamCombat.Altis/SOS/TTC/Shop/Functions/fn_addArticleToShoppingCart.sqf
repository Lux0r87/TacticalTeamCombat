/*
	Adds the given article to the shopping cart.
	If the article is already in the shopping cart the amount will be increased.
	
	Parameter(s):
		0: ARRAY - article
	
	Returns:
		ARRAY - shopping cart
		
    Created by BauerMitFackel
*/


/*
	Returns the index of the category with the given id.
	Parameter(s):
		0: ARRAY	- shopping cart
		1: NUMBER	- category id
	Returns:
		NUMBER - the category index
*/
_getCategoryIndex = {
	private["_shoppingCart", "_categoryId", "_categoryIndex", "_index"];
	
	_shoppingCart = [_this, 0] call BIS_fnc_param;
	_categoryId = [_this, 1] call BIS_fnc_param;
	
	_categoryIndex = -1;
	_index = 0;
	
	{
		if ((_x select 0) == _categoryId) exitWith {
			_categoryIndex = _index;
		};
		_index = _index + 1;
	} forEach _shoppingCart;
	
	_categoryIndex;
};

private["_shoppingCart","_articleId","_amount","_path","_categoryId","_categoryIndex","_article","_entry","_entryIndex","_entryAmount"];

_shoppingCart	= [_this, 0] call BIS_fnc_param;
_articleId		= [_this, 1] call BIS_fnc_param;
_amount			= [_this, 2, 1, [0]] call BIS_fnc_param;

_path = [_shoppingCart, _articleId] call BIS_fnc_findNestedElement;
if (_path isEqualTo []) then {	
	_categoryId		= (_articleId call TTC_SHOP_fnc_getCategoryByArticleId) select TTC_SHOP_CATEGORY_id;
	_categoryIndex	= [_shoppingCart, _categoryId] call _getCategoryIndex;	
	_article		= _articleId call TTC_SHOP_fnc_getArticleById;
	_entry			= [_article, _amount];
	((_shoppingCart select _categoryIndex) select 1) pushBack _entry;
} else {
	_categoryIndex	= _path select 0;
	_entryIndex		= _path select 2;
	_entry			= ((_shoppingCart select _categoryIndex) select 1) select _entryIndex;
	_entryAmount	= (_entry select 1) + _amount;
	_entry set [1, _entryAmount];
};

_shoppingCart;
