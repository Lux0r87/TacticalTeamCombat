/*
	Created by BauerMitFackel
	See: https://community.bistudio.com/wiki/DialogControls-Text#CT_STATIC.3D0
*/
class TTC_UI_Text: TTC_UI_Control {

	type 				= TTC_UI_TYPE_STATIC;
	style 				= TTC_UI_STYLE_LEFT;
	
	colorBackground[]	= TTC_UI_COLOR_TRANSPARENT;
	fixedWidth			= 0;
};

// Include light version if TTC_UI_THEME_LIGHT flag is defined
#ifdef TTC_UI_THEME_LIGHT
	#include "Light\text.hpp"
#endif
