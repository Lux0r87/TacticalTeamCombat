/*
	Created by BauerMitFackel
*/

#include "Dark\picture.hpp"
#include "Light\picture.hpp"

#ifdef TTC_UI_THEME_LIGHT

	class TTC_UI_Picture: TTC_UI_Picture_Light {};

#else

	class TTC_UI_Picture: TTC_UI_Picture_Dark {};
	
#endif
