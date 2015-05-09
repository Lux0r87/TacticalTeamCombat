/*
    Created by BauerMitFackel
*/

class TTC_Shop {
	tag = "TTC_SHOP";

	class Database {	
		file = "SOS\TTC\Shop\Database";

		class init {};
	};

	class Functions {	
		file = "SOS\TTC\Shop\Functions";

		class addArticleToShoppingCart {};
		class canBuy {};
		class getArticleById {};
		class getArticles {};
		class getCategories {};
		class getCategoryByArticleId {};
		class getCategoryById {};
		class getShoppingCart {};
		class getShoppingCartCosts {};
		class removeArticleFromShoppingCart {};
	};

	class Actions {
		file = "SOS\TTC\Shop\Functions\Actions";

		class addAction{};
	};
};

class TTC_Shop_UI {
	tag = "TTC_SHOP_UI";

	class TFunctions {	
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
