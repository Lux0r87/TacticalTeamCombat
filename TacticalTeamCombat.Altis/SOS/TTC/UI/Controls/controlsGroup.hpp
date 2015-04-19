/*
	Created by BauerMitFackel
	See: https://community.bistudio.com/wiki/DialogControls-ControlsGroup
*/
class TTC_UI_ControlsGroup: TTC_UI_Control {

	type	= TTC_UI_TYPE_CONTROLS_GROUP;
	style	= TTC_UI_STYLE_MULTI;
		
	class VScrollbar  {
	
		autoScrollSpeed		= -1;
		autoScrollDelay		= 5;
		autoScrollRewind	= 0;
		width 				= 0.02;
	};
	
	class HScrollbar  {
		
		height = 0.02;
	};
	
	class ScrollBar: TTC_UI_ScrollBar {};
}

// Include light version if TTC_UI_THEME_LIGHT flag is defined
#ifdef TTC_UI_THEME_LIGHT
	#include "Light\controlsGroup.hpp"
#endif
