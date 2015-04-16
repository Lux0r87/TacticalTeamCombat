/*
    Created by BauerMitFackel
*/

#include "ShopDialog_Layout.hpp"

#define TTC_SHOP_DIALOG_IDD 							50000

#define TTC_SHOP_DIALOG_CATEGORY_LIST_IDC				51001
#define TTC_SHOP_DIALOG_ARTICLE_LIST_IDC				52001
#define TTC_SHOP_DIALOG_ARTICLE_DESCRIPTION_IDC			52003
#define TTC_SHOP_DIALOG_SHOPPING_CARD_SAVE_IDC			53001
#define TTC_SHOP_DIALOG_SHOPPING_CARD_LOAD_IDC			53002
#define TTC_SHOP_DIALOG_SHOPPING_CARD_CLEAR_IDC			53003
#define TTC_SHOP_DIALOG_SHOPPING_CARD_ARTICLE_LIST_IDC	53004
#define TTC_SHOP_DIALOG_SHOPPING_CARD_COSTS_IDC			53005
#define TTC_SHOP_DIALOG_CANCEL_IDC						53006
#define TTC_SHOP_DIALOG_BUY_IDC							53007					


class TTC_SHOP_ShopDialog {

	idd				= TTC_SHOP_DIALOG_IDD;
	movingenabled	= 0;
	onLoad			= uiNamespace setVariable ["TTC_SHOP_shopDialog", _this select 0];
	onUnLoad		= uiNamespace setVariable ["TTC_SHOP_shopDialog", nil];
	
	class ControlsBackground {
		
		class TTC_SHOP_CategoryList_Header: TTC_UI_Text {
		
			style		= ST_CENTER;
			text		= "CATEGORIES";

			x = TTC_SHOP_DIALOG_CATEGORY_LIST_HEADER_X;
			y = TTC_SHOP_DIALOG_CATEGORY_LIST_HEADER_Y;
			w = TTC_SHOP_DIALOG_CATEGORY_LIST_HEADER_W;
			h = TTC_SHOP_DIALOG_CATEGORY_LIST_HEADER_H;
		};
		
		class TTC_SHOP_CategoryList_Background: TTC_UI_Background {
		
			x = TTC_SHOP_DIALOG_CATEGORY_LIST_BACKGROUND_X;
			y = TTC_SHOP_DIALOG_CATEGORY_LIST_BACKGROUND_Y;
			w = TTC_SHOP_DIALOG_CATEGORY_LIST_BACKGROUND_W;
			h = TTC_SHOP_DIALOG_CATEGORY_LIST_BACKGROUND_H;
		};
	
		class TTC_SHOP_ArticleList_Header : TTC_UI_Text {
		
			style 		= ST_CENTER;
			text		= "ARTICLES";

			x = TTC_SHOP_DIALOG_ARTICLE_LIST_HEADER_X;
			y = TTC_SHOP_DIALOG_ARTICLE_LIST_HEADER_Y;
			w = TTC_SHOP_DIALOG_ARTICLE_LIST_HEADER_W;
			h = TTC_SHOP_DIALOG_ARTICLE_LIST_HEADER_H;
		};
	
		class TTC_SHOP_ArticleList_Background: TTC_UI_Background {
		
			x = TTC_SHOP_DIALOG_ARTICLE_LIST_BACKGROUND_X;
			y = TTC_SHOP_DIALOG_ARTICLE_LIST_BACKGROUND_Y;
			w = TTC_SHOP_DIALOG_ARTICLE_LIST_BACKGROUND_W;
			h = TTC_SHOP_DIALOG_ARTICLE_LIST_BACKGROUND_H;
		};
		
		class TTC_SHOP_ShoppingCard_Header : TTC_UI_Text {
					
			style		= ST_CENTER;
			text		= "SHOPPING CARD";

			x = TTC_SHOP_DIALOG_SHOPPING_CARD_HEADER_X;
			y = TTC_SHOP_DIALOG_SHOPPING_CARD_HEADER_Y;
			w = TTC_SHOP_DIALOG_SHOPPING_CARD_HEADER_W;
			h = TTC_SHOP_DIALOG_SHOPPING_CARD_HEADER_H;
		};
		
		class TTC_SHOP_ShoppingCard_ArticleList_Background: TTC_UI_Background {
		
			x = TTC_SHOP_DIALOG_SHOPPING_CARD_ARTICLE_LIST_BACKGROUND_X;
			y = TTC_SHOP_DIALOG_SHOPPING_CARD_ARTICLE_LIST_BACKGROUND_Y;
			w = TTC_SHOP_DIALOG_SHOPPING_CARD_ARTICLE_LIST_BACKGROUND_W;
			h = TTC_SHOP_DIALOG_SHOPPING_CARD_ARTICLE_LIST_BACKGROUND_H;
		};
	};
	
	
	class Controls {
		
		class TTC_SHOP_CategoryList: TTC_UI_ListNBox {
		
			idc			= TTC_SHOP_DIALOG_CATEGORY_LIST_IDC;
			rowHeight	= 0.06;
			columns[]	= {-0.001};

			x = TTC_SHOP_DIALOG_CATEGORY_LIST_X;
			y = TTC_SHOP_DIALOG_CATEGORY_LIST_Y;
			w = TTC_SHOP_DIALOG_CATEGORY_LIST_W;
			h = TTC_SHOP_DIALOG_CATEGORY_LIST_H;
			
			onLBSelChanged = "_this spawn TTC_SHOP_fnc_onCategorySelected;";
		};
		
		
		class TTC_SHOP_ArticleList: TTC_UI_ListNBox {
		
			idc			= TTC_SHOP_DIALOG_ARTICLE_LIST_IDC;
			rowHeight	= 0.06;
			columns[]	= {-0.001, 0.75};
			
			x = TTC_SHOP_DIALOG_ARTICLE_LIST_X;
			y = TTC_SHOP_DIALOG_ARTICLE_LIST_Y;
			w = TTC_SHOP_DIALOG_ARTICLE_LIST_W;
			h = TTC_SHOP_DIALOG_ARTICLE_LIST_H;
			
			onLBSelChanged = "_this spawn TTC_SHOP_fnc_onArticleSelected;";
		};
				
		class TTC_SHOP_ArticleDescription: TTC_UI_StructuredText {
		
			idc = TTC_SHOP_DIALOG_ARTICLE_DESCRIPTION_IDC;
			
			x = TTC_SHOP_DIALOG_ARTICLE_DESCRIPTION_X;
			y = TTC_SHOP_DIALOG_ARTICLE_DESCRIPTION_Y;
			w = TTC_SHOP_DIALOG_ARTICLE_DESCRIPTION_W;
			h = TTC_SHOP_DIALOG_ARTICLE_DESCRIPTION_H;
		};
		
		
		class TTC_SHOP_ShoppingCard_Save: TTC_UI_Button {
		
			idc		= TTC_SHOP_DIALOG_SHOPPING_CARD_SAVE_IDC;
			text	= "Save"; //--- ToDo: Localize;
			action	= "[] spawn TTC_SHOP_fnc_onSaveClicked";
			
			x = TTC_SHOP_DIALOG_SHOPPING_CARD_SAVE_X;
			y = TTC_SHOP_DIALOG_SHOPPING_CARD_SAVE_Y;
			w = TTC_SHOP_DIALOG_SHOPPING_CARD_SAVE_W;
			h = TTC_SHOP_DIALOG_SHOPPING_CARD_SAVE_H;
		};
		
		class TTC_SHOP_ShoppingCard_Load: TTC_UI_Button {
		
			idc		= TTC_SHOP_DIALOG_SHOPPING_CARD_LOAD_IDC;
			text	= "Load"; //--- ToDo: Localize;
			action	= "[] spawn TTC_SHOP_fnc_onLoadClicked";
			
			x = TTC_SHOP_DIALOG_SHOPPING_CARD_LOAD_X;
			y = TTC_SHOP_DIALOG_SHOPPING_CARD_LOAD_Y;
			w = TTC_SHOP_DIALOG_SHOPPING_CARD_LOAD_W;
			h = TTC_SHOP_DIALOG_SHOPPING_CARD_LOAD_H;
		};
		
		class TTC_SHOP_ShoppingCard_Clear: TTC_UI_Button {
		
			idc		= TTC_SHOP_DIALOG_SHOPPING_CARD_CLEAR_IDC;
			text	= "Clear"; //--- ToDo: Localize;
			action	= "[] spawn TTC_SHOP_fnc_onClearClicked";
			
			x = TTC_SHOP_DIALOG_SHOPPING_CARD_CLEAR_X;
			y = TTC_SHOP_DIALOG_SHOPPING_CARD_CLEAR_Y;
			w = TTC_SHOP_DIALOG_SHOPPING_CARD_CLEAR_W;
			h = TTC_SHOP_DIALOG_SHOPPING_CARD_CLEAR_H;
		};
		
		class TTC_SHOP_ShoppingCard_ArticleList: TTC_UI_ListNBox {
		
			idc			= TTC_SHOP_DIALOG_SHOPPING_CARD_ARTICLE_LIST_IDC;
			rowHeight	= 0.06;
			columns[]	= {-0.001, 0.15, 0.7};
			
			x = TTC_SHOP_DIALOG_SHOPPING_CARD_ARTICLE_LIST_X;
			y = TTC_SHOP_DIALOG_SHOPPING_CARD_ARTICLE_LIST_Y;
			w = TTC_SHOP_DIALOG_SHOPPING_CARD_ARTICLE_LIST_W;
			h = TTC_SHOP_DIALOG_SHOPPING_CARD_ARTICLE_LIST_H;
		};
		
		class TTC_SHOP_ShoppingCard_Costs : TTC_UI_Text {
		
			idc			= TTC_SHOP_DIALOG_SHOPPING_CARD_COSTS_IDC;
			text		= "3500 BTC";
			sizeEx 		= "0.038 / (getResolution select 5)";
			style 		= ST_RIGHT;

			x = TTC_SHOP_DIALOG_SHOPPING_CARD_COSTS_X;
			y = TTC_SHOP_DIALOG_SHOPPING_CARD_COSTS_Y;
			w = TTC_SHOP_DIALOG_SHOPPING_CARD_COSTS_W;
			h = TTC_SHOP_DIALOG_SHOPPING_CARD_COSTS_H;
		};
		
		class TTC_SHOP_Cancel: TTC_UI_ButtonDanger {
		
			idc		= TTC_SHOP_DIALOG_CANCEL_IDC;
			text	= "Cancel"; //--- ToDo: Localize;
			action	= "closeDialog 0";
			
			x = TTC_SHOP_DIALOG_CANCEL_X;
			y = TTC_SHOP_DIALOG_CANCEL_Y;
			w = TTC_SHOP_DIALOG_CANCEL_W;
			h = TTC_SHOP_DIALOG_CANCEL_H;
		};
		
		class TTC_SHOP_Buy: TTC_UI_ButtonSuccess {
		
			idc		= TTC_SHOP_DIALOG_BUY_IDC;
			text	= "Buy"; //--- ToDo: Localize;
			sizeEx	= "0.038 / (getResolution select 5)";
			action	= "[] spawn TTC_SHOP_fnc_onBuyClicked";
			
			x = TTC_SHOP_DIALOG_BUY_X;
			y = TTC_SHOP_DIALOG_BUY_Y;
			w = TTC_SHOP_DIALOG_BUY_W;
			h = TTC_SHOP_DIALOG_BUY_H;
		};
	};
};
