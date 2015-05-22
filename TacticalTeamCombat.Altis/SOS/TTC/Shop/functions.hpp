/*
    Created by BauerMitFackel
*/

class TTC_Shop {
	tag = "TTC_SHOP";
	
	class Initialization {
		
		class init {
			file = "SOS\TTC\Shop\init.sqf";
		};
		
		class preInit {
			preInit = 1;
			file = "SOS\TTC\Shop\preInit.sqf";
		};
	};
	
	class Functions {	
		file = "SOS\TTC\Shop\Functions";

		class addArticleToShoppingCart {};
		class buy {};
		class canBuy {};
		class createShoppingCart {};
		class getArticleById {};
		class getArticles {};
		class getCategories {};
		class getCategoryByArticleId {};
		class getCategoryById {};
		class getShoppingCart {};
		class getShoppingCartCosts {};
		class isArticleAvailable {};
		class removeArticleFromShoppingCart {};
	};

	class Actions {
		file = "SOS\TTC\Shop\Functions\Actions";

		class addAction{};
	};
};

class TTC_Shop_UI {
	tag = "TTC_SHOP_UI";

	class Functions {	
		file = "SOS\TTC\Shop\Functions\UI";

		class createDialog {};
		class onArticleDoubleClicked {};
		class onArticleSelected {};
		class onBuyClicked {};
		class onCategorySelected {};
		class onClearClicked {};
		class onDialogLoad {};
		class onDialogUnLoad {};
		class onLoadClicked {};
		class onMinusClicked {};
		class onPlusClicked {};
		class onSaveClicked {};
		class updateArticleDescription {};
		class updateArticleList {};
		class updateArticlePicture {};
		class updateBuy {};
		class updateCategoryList {};
		class updateShoppingCart {};
		class updateShoppingCartCosts {};
	};
};
