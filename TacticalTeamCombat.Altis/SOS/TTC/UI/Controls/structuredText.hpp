/*
	Created by BauerMitFackel
*/

#include "Dark\structuredText.hpp"
#include "Light\structuredText.hpp"

#ifdef TTC_UI_THEME_LIGHT

	class TTC_UI_StructuredText: TTC_UI_StructuredText_Light {};

#else

	class TTC_UI_StructuredText: TTC_UI_StructuredText_Dark {};
	
#endif
