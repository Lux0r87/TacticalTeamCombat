/*
    Created by BauerMitFackel
*/

class TTC_Shop {
	tag = "TTC_SHOP";

	class TTC_Shop_Database {	
		file = "SOS\TTC\Shop\Database";

		class init {
			preInit = 1;
		};
	};

	class TTC_Shop_Functions {	
		file = "SOS\TTC\Shop\Functions";

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

	class TTC_Shop_UI_Functions {	
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
		class updateCategoryList {};
		class updateShoppingCart {};
	};
};
