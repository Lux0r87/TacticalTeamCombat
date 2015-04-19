/*
	Dark list with multiple columns.
	Created by BauerMitFackel
	See: https://community.bistudio.com/wiki/DialogControls-ListBoxes
*/
class TTC_UI_ListNBox: TTC_UI_Control {
	
	type						= TTC_UI_TYPE_LISTNBOX;
	style						= TTC_UI_STYLE_MULTI;
	
	// ListNBox specific properties
	
	autoScrollSpeed				= -1;
	autoScrollDelay				= 5;
	autoScrollRewind			= 0;
	canDrag						= false;
	colorSelect[]				= TTC_UI_COLOR_BLACK_A100;
	colorSelect2[]				= TTC_UI_COLOR_BLACK_A100;
	colorSelectBackground[]		= TTC_UI_COLOR_WHITE_A75;
	colorSelectBackground2[]	= TTC_UI_COLOR_WHITE_A100;
	columns[]					= {-0.01};
	drawSideArrows				= false;
	idcLeft						= -1;
	idcRight					= -1;
	maxHistoryDelay				= 1;
	period 						= 1;
	rowHeight					= 0.05;
	soundSelect[]				= TTC_UI_SOUND_LISTBOX_SELECT;
	
	
	// Arma 3 only
	class ListScrollBar: TTC_UI_ScrollBar {	

		autoScrollEnabled	= 1;
	};
	
	class ScrollBar: TTC_UI_ScrollBar {};
	
	
	// Undocumented properties
	colorDisabled[]	= TTC_UI_COLOR_WHITE_A25;	// Disabled text color
	blinkingPeriod	= 0;						// Time in which control will fade out and back in. Use 0 to disable the effect.
};

// Include light version if TTC_UI_THEME_LIGHT flag is defined
#ifdef TTC_UI_THEME_LIGHT
	#include "Light\listNBox.hpp"
#endif
