/*
    Created by BauerMitFackel
*/

#define TTC_SHOP_DIALOG_W											0.650 * safezoneW
#define TTC_SHOP_DIALOG_H											0.650 * safezoneH
#define TTC_SHOP_DIALOG_LIST_HEADER_H								0.040 * safezoneH
#define TTC_SHOP_DIALOG_SPACING										0.004 * ((safezoneH + safezoneW) / 2)
#define TTC_SHOP_DIALOG_COLUMN_1_W									TTC_SHOP_DIALOG_W * 0.2
#define TTC_SHOP_DIALOG_COLUMN_2_W									TTC_SHOP_DIALOG_W * 0.5 - (TTC_SHOP_DIALOG_SPACING * 2)
#define TTC_SHOP_DIALOG_COLUMN_3_W									TTC_SHOP_DIALOG_W * 0.3
#define TTC_SHOP_DIALOG_COLUMN_1_X									(safezoneX + (safezoneW / 2)) - (TTC_SHOP_DIALOG_W / 2)
#define TTC_SHOP_DIALOG_COLUMN_1_Y									(safezoneY + (safezoneH / 2)) - (TTC_SHOP_DIALOG_H / 2)
#define TTC_SHOP_DIALOG_COLUMN_2_X									TTC_SHOP_DIALOG_COLUMN_1_X + TTC_SHOP_DIALOG_COLUMN_1_W + TTC_SHOP_DIALOG_SPACING
#define TTC_SHOP_DIALOG_COLUMN_2_Y									TTC_SHOP_DIALOG_COLUMN_1_Y
#define TTC_SHOP_DIALOG_COLUMN_3_X									TTC_SHOP_DIALOG_COLUMN_2_X + TTC_SHOP_DIALOG_COLUMN_2_W + TTC_SHOP_DIALOG_SPACING
#define TTC_SHOP_DIALOG_COLUMN_3_Y									TTC_SHOP_DIALOG_COLUMN_1_Y


// WIDTH and HEIGHT definitions for all controls //////////////////////////////////////////////////////////////////////////////


// Column 1
#define TTC_SHOP_DIALOG_CATEGORY_LIST_HEADER_W						TTC_SHOP_DIALOG_COLUMN_1_W
#define TTC_SHOP_DIALOG_CATEGORY_LIST_HEADER_H						TTC_SHOP_DIALOG_LIST_HEADER_H
#define TTC_SHOP_DIALOG_CATEGORY_LIST_W								TTC_SHOP_DIALOG_COLUMN_1_W
#define TTC_SHOP_DIALOG_CATEGORY_LIST_H								TTC_SHOP_DIALOG_H - TTC_SHOP_DIALOG_LIST_HEADER_H
#define TTC_SHOP_DIALOG_CATEGORY_LIST_BACKGROUND_W					TTC_SHOP_DIALOG_CATEGORY_LIST_W
#define TTC_SHOP_DIALOG_CATEGORY_LIST_BACKGROUND_H					TTC_SHOP_DIALOG_CATEGORY_LIST_H

// Column 2
// #define TTC_SHOP_DIALOG_ARTICLE_PICTURE_W						TTC_SHOP_DIALOG_COLUMN_2_W * 0.4
// #define TTC_SHOP_DIALOG_ARTICLE_PICTURE_H						0.15 * safezoneH
#define TTC_SHOP_DIALOG_ARTICLE_DESCRIPTION_W						TTC_SHOP_DIALOG_COLUMN_2_W // (TTC_SHOP_DIALOG_COLUMN_2_W * 0.6) - TTC_SHOP_DIALOG_SPACING
#define TTC_SHOP_DIALOG_ARTICLE_DESCRIPTION_H						0.15 * safezoneH // TTC_SHOP_DIALOG_ARTICLE_PICTURE_H
#define TTC_SHOP_DIALOG_ARTICLE_LIST_HEADER_W						TTC_SHOP_DIALOG_COLUMN_2_W
#define TTC_SHOP_DIALOG_ARTICLE_LIST_HEADER_H						TTC_SHOP_DIALOG_LIST_HEADER_H
#define TTC_SHOP_DIALOG_ARTICLE_LIST_W								TTC_SHOP_DIALOG_COLUMN_2_W
#define TTC_SHOP_DIALOG_ARTICLE_LIST_H								TTC_SHOP_DIALOG_H - TTC_SHOP_DIALOG_ARTICLE_LIST_HEADER_H - TTC_SHOP_DIALOG_ARTICLE_DESCRIPTION_H - TTC_SHOP_DIALOG_SPACING
#define TTC_SHOP_DIALOG_ARTICLE_LIST_BACKGROUND_W					TTC_SHOP_DIALOG_ARTICLE_LIST_W
#define TTC_SHOP_DIALOG_ARTICLE_LIST_BACKGROUND_H					TTC_SHOP_DIALOG_ARTICLE_LIST_H

// Column 3
#define TTC_SHOP_DIALOG_SHOPPING_CARD_HEADER_W						TTC_SHOP_DIALOG_COLUMN_3_W
#define TTC_SHOP_DIALOG_SHOPPING_CARD_HEADER_H						TTC_SHOP_DIALOG_LIST_HEADER_H
#define TTC_SHOP_DIALOG_SHOPPING_CARD_SAVE_W						TTC_SHOP_DIALOG_COLUMN_3_W / 3
#define TTC_SHOP_DIALOG_SHOPPING_CARD_SAVE_H						0.035 * safezoneH
#define TTC_SHOP_DIALOG_SHOPPING_CARD_LOAD_W						TTC_SHOP_DIALOG_SHOPPING_CARD_SAVE_W
#define TTC_SHOP_DIALOG_SHOPPING_CARD_LOAD_H						TTC_SHOP_DIALOG_SHOPPING_CARD_SAVE_H
#define TTC_SHOP_DIALOG_SHOPPING_CARD_CLEAR_W						TTC_SHOP_DIALOG_SHOPPING_CARD_SAVE_W
#define TTC_SHOP_DIALOG_SHOPPING_CARD_CLEAR_H						TTC_SHOP_DIALOG_SHOPPING_CARD_SAVE_H
#define TTC_SHOP_DIALOG_SHOPPING_CARD_COSTS_W						TTC_SHOP_DIALOG_COLUMN_3_W
#define TTC_SHOP_DIALOG_SHOPPING_CARD_COSTS_H						0.05 * safezoneH
#define TTC_SHOP_DIALOG_CANCEL_W									TTC_SHOP_DIALOG_COLUMN_3_W * 0.3
#define TTC_SHOP_DIALOG_CANCEL_H									0.05 * safezoneH
#define TTC_SHOP_DIALOG_BUY_W										(TTC_SHOP_DIALOG_COLUMN_3_W * 0.7) - TTC_SHOP_DIALOG_SPACING
#define TTC_SHOP_DIALOG_BUY_H										TTC_SHOP_DIALOG_CANCEL_H
#define TTC_SHOP_DIALOG_SHOPPING_CARD_ARTICLE_LIST_W				TTC_SHOP_DIALOG_COLUMN_3_W
#define TTC_SHOP_DIALOG_SHOPPING_CARD_ARTICLE_LIST_H				TTC_SHOP_DIALOG_H - TTC_SHOP_DIALOG_SHOPPING_CARD_HEADER_H - TTC_SHOP_DIALOG_SHOPPING_CARD_SAVE_H - TTC_SHOP_DIALOG_SHOPPING_CARD_COSTS_H - TTC_SHOP_DIALOG_CANCEL_H - TTC_SHOP_DIALOG_SPACING
#define TTC_SHOP_DIALOG_SHOPPING_CARD_ARTICLE_LIST_BACKGROUND_W		TTC_SHOP_DIALOG_SHOPPING_CARD_ARTICLE_LIST_W
#define TTC_SHOP_DIALOG_SHOPPING_CARD_ARTICLE_LIST_BACKGROUND_H		TTC_SHOP_DIALOG_SHOPPING_CARD_ARTICLE_LIST_H


// X and Y definitions for all controls ///////////////////////////////////////////////////////////////////////////////////////


// Column 1
#define TTC_SHOP_DIALOG_CATEGORY_LIST_HEADER_X						TTC_SHOP_DIALOG_COLUMN_1_X
#define TTC_SHOP_DIALOG_CATEGORY_LIST_HEADER_Y						TTC_SHOP_DIALOG_COLUMN_1_Y
#define TTC_SHOP_DIALOG_CATEGORY_LIST_X								TTC_SHOP_DIALOG_COLUMN_1_X
#define TTC_SHOP_DIALOG_CATEGORY_LIST_Y								TTC_SHOP_DIALOG_COLUMN_1_Y + TTC_SHOP_DIALOG_CATEGORY_LIST_HEADER_H
#define TTC_SHOP_DIALOG_CATEGORY_LIST_BACKGROUND_X					TTC_SHOP_DIALOG_CATEGORY_LIST_X
#define TTC_SHOP_DIALOG_CATEGORY_LIST_BACKGROUND_Y					TTC_SHOP_DIALOG_CATEGORY_LIST_Y

// Column 2
#define TTC_SHOP_DIALOG_ARTICLE_LIST_HEADER_X						TTC_SHOP_DIALOG_COLUMN_2_X
#define TTC_SHOP_DIALOG_ARTICLE_LIST_HEADER_Y						TTC_SHOP_DIALOG_COLUMN_2_Y
#define TTC_SHOP_DIALOG_ARTICLE_LIST_X								TTC_SHOP_DIALOG_COLUMN_2_X
#define TTC_SHOP_DIALOG_ARTICLE_LIST_Y								TTC_SHOP_DIALOG_COLUMN_2_Y + TTC_SHOP_DIALOG_ARTICLE_LIST_HEADER_H
#define TTC_SHOP_DIALOG_ARTICLE_LIST_BACKGROUND_X					TTC_SHOP_DIALOG_ARTICLE_LIST_X
#define TTC_SHOP_DIALOG_ARTICLE_LIST_BACKGROUND_Y					TTC_SHOP_DIALOG_ARTICLE_LIST_Y
#define TTC_SHOP_DIALOG_ARTICLE_DESCRIPTION_X						TTC_SHOP_DIALOG_COLUMN_2_X
#define TTC_SHOP_DIALOG_ARTICLE_DESCRIPTION_Y						TTC_SHOP_DIALOG_ARTICLE_LIST_Y + TTC_SHOP_DIALOG_ARTICLE_LIST_H + TTC_SHOP_DIALOG_SPACING

// Column 3
#define TTC_SHOP_DIALOG_SHOPPING_CARD_HEADER_X						TTC_SHOP_DIALOG_COLUMN_3_X
#define TTC_SHOP_DIALOG_SHOPPING_CARD_HEADER_Y						TTC_SHOP_DIALOG_COLUMN_3_Y
#define TTC_SHOP_DIALOG_SHOPPING_CARD_SAVE_X						TTC_SHOP_DIALOG_COLUMN_3_X
#define TTC_SHOP_DIALOG_SHOPPING_CARD_SAVE_Y						TTC_SHOP_DIALOG_SHOPPING_CARD_HEADER_Y + TTC_SHOP_DIALOG_SHOPPING_CARD_HEADER_H
#define TTC_SHOP_DIALOG_SHOPPING_CARD_LOAD_X						TTC_SHOP_DIALOG_SHOPPING_CARD_SAVE_X + TTC_SHOP_DIALOG_SHOPPING_CARD_SAVE_W
#define TTC_SHOP_DIALOG_SHOPPING_CARD_LOAD_Y						TTC_SHOP_DIALOG_SHOPPING_CARD_SAVE_Y
#define TTC_SHOP_DIALOG_SHOPPING_CARD_CLEAR_X						TTC_SHOP_DIALOG_SHOPPING_CARD_LOAD_X + TTC_SHOP_DIALOG_SHOPPING_CARD_LOAD_W
#define TTC_SHOP_DIALOG_SHOPPING_CARD_CLEAR_Y						TTC_SHOP_DIALOG_SHOPPING_CARD_SAVE_Y
#define TTC_SHOP_DIALOG_SHOPPING_CARD_ARTICLE_LIST_X				TTC_SHOP_DIALOG_COLUMN_3_X
#define TTC_SHOP_DIALOG_SHOPPING_CARD_ARTICLE_LIST_Y				TTC_SHOP_DIALOG_SHOPPING_CARD_SAVE_Y + TTC_SHOP_DIALOG_SHOPPING_CARD_SAVE_H
#define TTC_SHOP_DIALOG_SHOPPING_CARD_ARTICLE_LIST_BACKGROUND_X		TTC_SHOP_DIALOG_SHOPPING_CARD_ARTICLE_LIST_X
#define TTC_SHOP_DIALOG_SHOPPING_CARD_ARTICLE_LIST_BACKGROUND_Y		TTC_SHOP_DIALOG_SHOPPING_CARD_ARTICLE_LIST_Y
#define TTC_SHOP_DIALOG_SHOPPING_CARD_COSTS_X						TTC_SHOP_DIALOG_COLUMN_3_X
#define TTC_SHOP_DIALOG_SHOPPING_CARD_COSTS_Y						TTC_SHOP_DIALOG_SHOPPING_CARD_ARTICLE_LIST_Y + TTC_SHOP_DIALOG_SHOPPING_CARD_ARTICLE_LIST_H
#define TTC_SHOP_DIALOG_CANCEL_X									TTC_SHOP_DIALOG_COLUMN_3_X
#define TTC_SHOP_DIALOG_CANCEL_Y									TTC_SHOP_DIALOG_SHOPPING_CARD_COSTS_Y + TTC_SHOP_DIALOG_SHOPPING_CARD_COSTS_H + TTC_SHOP_DIALOG_SPACING
#define TTC_SHOP_DIALOG_BUY_X										TTC_SHOP_DIALOG_CANCEL_X + TTC_SHOP_DIALOG_CANCEL_W + TTC_SHOP_DIALOG_SPACING
#define TTC_SHOP_DIALOG_BUY_Y										TTC_SHOP_DIALOG_CANCEL_Y
