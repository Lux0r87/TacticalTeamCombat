/*
	Orange button with white text.
	Created by BauerMitFackel
	See: https://community.bistudio.com/wiki/DialogControls-Buttons
*/
class TTC_UI_ButtonWarning: TTC_UI_Button {
	
	colorBackground[]			= TTC_UI_COLOR_PUMPKIN_A75;
	colorBackgroundDisabled[]	= TTC_UI_COLOR_PUMPKIN_A25;
	colorBackgroundActive[]		= TTC_UI_COLOR_CARROT_A75;
	colorFocused[]				= TTC_UI_COLOR_CARROT_A100;
	colorBorder[]				= TTC_UI_COLOR_PUMPKIN_A100;
};

// Include light version if TTC_UI_THEME_LIGHT flag is defined
#ifdef TTC_UI_THEME_LIGHT
	#include "Light\buttonWarning.hpp"
#endif
