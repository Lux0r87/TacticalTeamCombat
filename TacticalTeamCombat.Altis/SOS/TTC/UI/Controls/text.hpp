/*
	Created by BauerMitFackel
*/

#include "Dark\text.hpp"
#include "Light\text.hpp"

#ifdef TTC_UI_THEME_LIGHT

	class TTC_UI_Text: TTC_UI_Text_Light {};

#else

	class TTC_UI_Text: TTC_UI_Text_Dark {};
	
#endif
