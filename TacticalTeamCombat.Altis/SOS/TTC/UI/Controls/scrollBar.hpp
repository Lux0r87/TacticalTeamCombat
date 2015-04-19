/*
	Created by BauerMitFackel
	See: https://community.bistudio.com/wiki/DialogControls-Sliders
*/
class TTC_UI_ScrollBar {

	color[]			= TTC_UI_COLOR_WHITE_A75;
	colorActive[]	= TTC_UI_COLOR_WHITE_A100;
	colorDisabled[]	= TTC_UI_COLOR_WHITE_A25;
	arrowEmpty		= "#(argb,8,8,3)color(1,1,1,0.5)";
	arrowFull		= "#(argb,8,8,3)color(1,1,1,1)";
	border			= "#(argb,8,8,3)color(1,1,1,0.5)";
	thumb			= "#(argb,8,8,3)color(1,1,1,1)";
};

// Include light version if TTC_UI_THEME_LIGHT flag is defined
#ifdef TTC_UI_THEME_LIGHT
	#include "Light\scrollBar.hpp"
#endif