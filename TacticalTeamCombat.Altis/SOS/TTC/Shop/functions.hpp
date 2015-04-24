/*
    Created by BauerMitFackel
*/

class TTC_Shop {
	tag = "TTC_SHOP";

	class Init {
		file = "SOS\TTC\Shop";

		class init{};
	};

	class TTC_ShopConfigurations {	
		file = "SOS\TTC\Shop\Configurations";

		class articles {
			preInit = 1;
		};
	};

	class TTC_ShopFunctions {	
		file = "SOS\TTC\Shop\Functions";

		class addArticlesForRole {};
		class addArticleToShoppingCart {};
		class getArticleById {};
		class getArticles {};
		class getCategories {};
		class getCategoryByArticleId {};
		class getCategoryById {};
		class getShoppingCart {};
	};
};

class TTC_Shop_UI {
	tag = "TTC_SHOP_UI";

	class TTC_Shop_Dialog_Functions {	
		file = "SOS\TTC\Shop\Functions\UI";

		class createShopDialog {};
		class onArticleDoubleClicked {};
		class onArticleSelected {};
		class onBuyClicked {};
		class onCategorySelected {};
		class onClearClicked {};
		class onLoadClicked {};
		class onMinusClicked {};
		class onPlusClicked {};
		class onSaveClicked {};
		class onShopDialogLoad {};
		class onShopDialogUnLoad {};
		class updateArticleDescription {};
		class updateArticleList {};
		class updateArticlePicture {};
		class updateCategoryList {};
		class updateShoppingCart {};
	};
};
