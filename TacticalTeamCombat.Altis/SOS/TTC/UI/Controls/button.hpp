/*
	Black button with white text.
	Created by BauerMitFackel
	See: https://community.bistudio.com/wiki/DialogControls-Buttons
*/
class TTC_UI_Button: TTC_UI_Control {

	type						= TTC_UI_TYPE_BUTTON;
	style						= TTC_UI_STYLE_CENTER;
		
	borderSize					= 0;
	colorBackground[]			= TTC_UI_COLOR_WHITE_A25;
	colorBackgroundActive[]		= TTC_UI_COLOR_WHITE_A50;
	colorBackgroundDisabled[]	= TTC_UI_COLOR_BLACK_A25;
	colorBorder[] 				= TTC_UI_COLOR_BLACK_A100;
	colorDisabled[]				= TTC_UI_COLOR_WHITE_A25;
	colorFocused[] 				= TTC_UI_COLOR_BLACK_A100;
	default						= false;
	offsetPressedX				= 0;
	offsetPressedY				= 0;
	offsetX 					= 0;
	offsetY 					= 0;
	soundEnter[]				= TTC_UI_SOUND_BUTTON_ENTER;
	soundPush[]					= TTC_UI_SOUND_BUTTON_PUSH;
	soundClick[]				= TTC_UI_SOUND_BUTTON_CLICK;
	soundEscape[]				= TTC_UI_SOUND_BUTTON_ESCAPE;
	tooltip 					= "";
	tooltipColorText[]			= TTC_UI_COLOR_WHITE_A100;
	tooltipColorBox[]			= TTC_UI_COLOR_BLACK_A75;
	tooltipColorShade[]			= TTC_UI_COLOR_BLACK_A75;
	
	class Attributes {
	
		font	= TTC_UI_FONT_DEFAULT;
		align	= "center";
		color	= "#FFFFFF";
		shadow	= 0;
	};
};

// Include light version if TTC_UI_THEME_LIGHT flag is defined
#ifdef TTC_UI_THEME_LIGHT
	#include "Light\button.hpp"
#endif
