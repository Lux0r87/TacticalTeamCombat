/*
	Created by BauerMitFackel
*/

#include "Dark\background.hpp"
#include "Light\background.hpp"

#ifdef TTC_UI_THEME_LIGHT

	class TTC_UI_Background:			TTC_UI_Background_Light {};
	class TTC_UI_BackgroundDanger:		TTC_UI_BackgroundDanger_Light {};
	class TTC_UI_BackgroundInfo:		TTC_UI_BackgroundInfo_Light {};
	class TTC_UI_BackgroundPrimary:		TTC_UI_BackgroundPrimary_Light {};
	class TTC_UI_BackgroundSuccess:		TTC_UI_BackgroundSuccess_Light {};
	class TTC_UI_BackgroundWarning:		TTC_UI_BackgroundWarning_Light {};

#else

	class TTC_UI_Background:			TTC_UI_Background_Dark {};
	class TTC_UI_BackgroundDanger:		TTC_UI_BackgroundDanger_Dark {};
	class TTC_UI_BackgroundInfo:		TTC_UI_BackgroundInfo_Dark {};
	class TTC_UI_BackgroundPrimary:		TTC_UI_BackgroundPrimary_Dark {};
	class TTC_UI_BackgroundSuccess:		TTC_UI_BackgroundSuccess_Dark {};
	class TTC_UI_BackgroundWarning:		TTC_UI_BackgroundWarning_Dark {};
	
#endif
