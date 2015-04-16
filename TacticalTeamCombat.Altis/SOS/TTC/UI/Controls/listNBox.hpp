/*
	Created by BauerMitFackel
*/

#include "Dark\listNBox.hpp"
#include "Light\listNBox.hpp"

#ifdef TTC_UI_THEME_LIGHT

	class TTC_UI_ListNBox: TTC_UI_ListNBox_Light {};

#else

	class TTC_UI_ListNBox: TTC_UI_ListNBox_Dark {};
	
#endif
