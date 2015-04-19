/*
	Created by BauerMitFackel
*/
class TTC_UI_ListNBox_Light: TTC_UI_ListNBox {

	arrowEmpty					= "#(argb,8,8,3)color(0,0,0,0.5)";
	arrowFull					= "#(argb,8,8,3)color(0,0,0,0)";
	
	colorBackground[]			= TTC_UI_COLOR_WHITE_A75;	
	colorSelect[]				= TTC_UI_COLOR_WHITE_A100;
	colorSelect2[]				= TTC_UI_COLOR_WHITE_A75;
	colorSelectBackground[]		= TTC_UI_COLOR_BLACK_A100;
	colorSelectBackground2[]	= TTC_UI_COLOR_BLACK_A75;
	colorText[]					= TTC_UI_COLOR_BLACK_A100;
			
	// Arma 3 only
	class ListScrollBar: TTC_UI_ScrollBar_Light {	

		shadow				= 0;
		autoScrollEnabled	= 1;
	};
	
	class ScrollBar: TTC_UI_ScrollBar_Light {};
	
	// Undocumented properties
	colorDisabled[]	= TTC_UI_COLOR_BLACK_A25;	// Disabled text color
	blinkingPeriod	= 0;
};
