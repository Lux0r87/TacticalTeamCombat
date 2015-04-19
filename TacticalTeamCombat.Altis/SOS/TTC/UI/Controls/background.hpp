/*
	Black colored surface.
	Created by BauerMitFackel
*/
class TTC_UI_Background: TTC_UI_Control {
	
	text				= ""; 
	sizeEx 				= 0;
	colorText[]			= TTC_UI_COLOR_TRANSPARENT;
};

// Include light version if TTC_UI_THEME_LIGHT flag is defined
#ifdef TTC_UI_THEME_LIGHT
	#include "Light\background.hpp"
#endif
