/*
	Created by BauerMitFackel
*/

#include "Dark\button.hpp"
#include "Light\button.hpp"

#ifdef TTC_UI_THEME_LIGHT

	class TTC_UI_Button: 			TTC_UI_Button_Light {};
	class TTC_UI_ButtonDanger:		TTC_UI_ButtonDanger_Light {};
	class TTC_UI_ButtonInfo:		TTC_UI_ButtonInfo_Light {};
	class TTC_UI_ButtonPrimary:		TTC_UI_ButtonPrimary_Light {};
	class TTC_UI_ButtonSuccess:		TTC_UI_ButtonSuccess_Light {};
	class TTC_UI_ButtonWarning:		TTC_UI_ButtonWarning_Light {};

#else

	class TTC_UI_Button: 			TTC_UI_Button_Dark {};
	class TTC_UI_ButtonDanger:		TTC_UI_ButtonDanger_Dark {};
	class TTC_UI_ButtonInfo:		TTC_UI_ButtonInfo_Dark {};
	class TTC_UI_ButtonPrimary:		TTC_UI_ButtonPrimary_Dark {};
	class TTC_UI_ButtonSuccess:		TTC_UI_ButtonSuccess_Dark {};
	class TTC_UI_ButtonWarning:		TTC_UI_ButtonWarning_Dark {};
	
#endif
