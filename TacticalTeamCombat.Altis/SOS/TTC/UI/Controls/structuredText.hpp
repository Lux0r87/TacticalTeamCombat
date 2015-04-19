/*
	Created by BauerMitFackel
	See: https://community.bistudio.com/wiki/DialogControls-Text#CT_STRUCTURED_TEXT.3D13
*/
class TTC_UI_StructuredText: TTC_UI_Control {

	type 		= TTC_UI_TYPE_STRUCTURED_TEXT;
	style 		= TTC_UI_STYLE_LEFT;
	
	colorBackground[]	= TTC_UI_COLOR_TRANSPARENT;
	size				= TTC_UI_TEXT_SIZE_M;
	
	class Attributes {
	
		font	= TTC_UI_FONT_DEFAULT;
		align	= "left";
        valign	= "middle";
		color	= "#FFFFFF";
		shadow	= 0;
	};
};

// Include light version if TTC_UI_THEME_LIGHT flag is defined
#ifdef TTC_UI_THEME_LIGHT
	#include "Light\structuredText.hpp"
#endif
