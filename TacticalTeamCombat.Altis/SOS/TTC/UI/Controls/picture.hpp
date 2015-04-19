/*
	Created by BauerMitFackel
	See: https://community.bistudio.com/wiki/DialogControls-Text#Static_Pictures
*/
class TTC_UI_Picture: TTC_UI_Control {

	type				= TTC_UI_TYPE_STATIC;
	style				= TTC_UI_STYLE_PICTURE + 2048;
	
	deletable			= 0;
	fade				= 0;
	fixedWidth			= 0;
	tooltip 			= "";
	tooltipColorText[]	= TTC_UI_COLOR_WHITE_A100;
	tooltipColorBox[]	= TTC_UI_COLOR_BLACK_A75;
	tooltipColorShade[]	= TTC_UI_COLOR_BLACK_A75;
};

// Include light version if TTC_UI_THEME_LIGHT flag is defined
#ifdef TTC_UI_THEME_LIGHT
	#include "Light\picture.hpp"
#endif
