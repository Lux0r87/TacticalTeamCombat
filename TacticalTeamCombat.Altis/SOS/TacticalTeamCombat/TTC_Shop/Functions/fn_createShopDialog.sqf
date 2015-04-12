/*
    Created by BauerMitFackel
*/

disableSerialization;


_initializeCategoriesList = {

	_index = lbAdd [5101, "Weapons"];
	_index = lbAdd [5101, "Attachments"];
	_index = lbAdd [5101, "Magazines"];
	_index = lbAdd [5101, "Explosives"];
	_index = lbAdd [5101, "Items"];
	_index = lbAdd [5101, "Clothes"];
	_index = lbAdd [5101, "Vehicles"];
	_index = lbAdd [5101, "Helicopters"];
};


_initializeArticlesList = {
	
	_items = ["Item 1", "Item 2", "Item 3", "Item 4", "Item 5", "Item 6", "Item 7", "Item 8", "Item 9", "Item 10"];
	
	{
		_item = _X;
		_index = lbAdd [5201, _item];
		
	} forEach _items;
};


_initializeShoppingCard= {

	_items = [
		"Item 1", "Item 2", "Item 3", "Item 4", "Item 5", "Item 6", "Item 7", "Item 8", "Item 9", "Item 10", 
		"Item 11", "Item 12", "Item 13", "Item 14", "Item 15", "Item 16", "Item 17", "Item 18", "Item 19", "Item 20",
		"Item 21", "Item 22", "Item 23", "Item 24", "Item 25", "Item 26", "Item 27", "Item 28", "Item 29", "Item 30"
	];
	
	{
		_item = _X;
		_index = lbAdd [5301, _item];
		
	} forEach _items;
};


//////////


_dialog = createDialog "TTC_SHOP_ShopDialog";
[] call _initializeCategoriesList;
[] call _initializeArticlesList;
[] call _initializeShoppingCard;