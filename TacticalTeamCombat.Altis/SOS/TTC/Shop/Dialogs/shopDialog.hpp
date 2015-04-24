/*
    Created by BauerMitFackel
*/

#define __ROUND(number)					((round ((number) * 1000)) / 1000)

#define TTC_SHOP_UI_SZ_W				__ROUND(safezoneW)
#define TTC_SHOP_UI_SZ_H				__ROUND(safezoneH)
#define TTC_SHOP_UI_SZ_X				__ROUND(safezoneX)
#define TTC_SHOP_UI_SZ_Y				__ROUND(safezoneY)

#define TTC_SHOP_UI_DIALOG_W			__ROUND(0.750 * TTC_SHOP_UI_SZ_W)
#define TTC_SHOP_UI_DIALOG_H			__ROUND(0.700 * TTC_SHOP_UI_SZ_H)
#define TTC_SHOP_UI_COLUMN_HEADER_H		__ROUND(0.040 * TTC_SHOP_UI_SZ_H)
#define TTC_SHOP_UI_SPACING				__ROUND(0.002 * ((TTC_SHOP_UI_SZ_H + TTC_SHOP_UI_SZ_W) / 2))
#define TTC_SHOP_UI_COLUMN_LEFT_W		__ROUND(TTC_SHOP_UI_DIALOG_W * 0.2)
#define TTC_SHOP_UI_COLUMN_LEFT_H		TTC_SHOP_UI_DIALOG_H
#define TTC_SHOP_UI_COLUMN_MIDDLE_W		__ROUND(TTC_SHOP_UI_DIALOG_W * 0.45 - (TTC_SHOP_UI_SPACING * 2))
#define TTC_SHOP_UI_COLUMN_MIDDLE_H		TTC_SHOP_UI_DIALOG_H
#define TTC_SHOP_UI_COLUMN_RIGHT_W		__ROUND(TTC_SHOP_UI_DIALOG_W * 0.35)
#define TTC_SHOP_UI_COLUMN_RIGHT_H		TTC_SHOP_UI_DIALOG_H
#define TTC_SHOP_UI_COLUMN_LEFT_X		__ROUND((TTC_SHOP_UI_SZ_X + (TTC_SHOP_UI_SZ_W / 2)) - (TTC_SHOP_UI_DIALOG_W / 2))
#define TTC_SHOP_UI_COLUMN_LEFT_Y		__ROUND((TTC_SHOP_UI_SZ_Y + (TTC_SHOP_UI_SZ_H / 2)) - (TTC_SHOP_UI_DIALOG_H / 2))
#define TTC_SHOP_UI_COLUMN_MIDDLE_X		TTC_SHOP_UI_COLUMN_LEFT_X + TTC_SHOP_UI_COLUMN_LEFT_W + TTC_SHOP_UI_SPACING
#define TTC_SHOP_UI_COLUMN_MIDDLE_Y		TTC_SHOP_UI_COLUMN_LEFT_Y
#define TTC_SHOP_UI_COLUMN_RIGHT_X		TTC_SHOP_UI_COLUMN_MIDDLE_X + TTC_SHOP_UI_COLUMN_MIDDLE_W + TTC_SHOP_UI_SPACING
#define TTC_SHOP_UI_COLUMN_RIGHT_Y		TTC_SHOP_UI_COLUMN_LEFT_Y


class TTC_SHOP_ShopDialog {

	idd				= 5000;
	onLoad			= "_this call TTC_SHOP_UI_fnc_onDialogLoad";
	onUnLoad		= "_this call TTC_SHOP_UI_fnc_onDialogUnLoad";
	
	class Controls {
		
		#include "shopDialog_columnLeft.hpp"
		#include "shopDialog_columnMiddle.hpp"
		#include "shopDialog_columnRight.hpp"
	};
};

