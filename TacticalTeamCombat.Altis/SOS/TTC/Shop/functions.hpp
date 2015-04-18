/*
    Created by BauerMitFackel
*/

class TTC_Shop {
	tag = "TTC_SHOP";

	class Init {
		file = "SOS\TTC\Shop";

		class init{};
	};

	class Configurations {
		file = "SOS\TTC\Shop\Configurations";

		class articles {
			preInit = 1;
		};
	};

	class Functions {		
		file = "SOS\TTC\Shop\Functions";

		class addArticles {};
		class createShopDialog {};
		class getArticleById {};
		class getArticlesByCategoryId {};
		class onArticleDoubleClick {};
		class onArticleSelected {};
		class onBuyClicked {};
		class onCategorySelected {};
		class onClearClicked {};
		class onLoadClicked {};
		class onSaveClicked {};
		class setArticleDescription {};
		class setArticlePicture {};
		class setArticles {};
		class setCategories {};
	};
};
