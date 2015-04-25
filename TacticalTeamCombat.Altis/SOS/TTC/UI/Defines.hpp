/*
	Created by BauerMitFackel
*/

#define TTC_UI_ACCESS_READ_WRITE		0
#define TTC_UI_ACCESS_READ_CREATE		1
#define TTC_UI_ACCESS_READ				2
#define TTC_UI_ACCESS_READ_VERIFIED		3
#define TTC_UI_FONT_DEFAULT				"PuristaMedium"
#define TTC_UI_FONT_SEMIBOLD			"PuristaSemiBold"
#define TTC_UI_FONT_BOLD				"PuristaBold"
#define TTC_UI_TEXT_SIZE_XXS			(0.010 / (getResolution select 5))
#define TTC_UI_TEXT_SIZE_XS				(0.014 / (getResolution select 5))
#define TTC_UI_TEXT_SIZE_S				(0.018 / (getResolution select 5))
#define TTC_UI_TEXT_SIZE_M				(0.022 / (getResolution select 5))
#define TTC_UI_TEXT_SIZE_L				(0.026 / (getResolution select 5))
#define TTC_UI_TEXT_SIZE_XL				(0.030 / (getResolution select 5))
#define TTC_UI_TEXT_SIZE_XXL			(0.034 / (getResolution select 5))

#include "Constants\colors.hpp"
#include "Constants\sounds.hpp"
#include "Constants\styles.hpp"
#include "Constants\types.hpp"

//// Classes

#include "Controls\control.hpp"			// Base class for all other classes. Must be defined first
#include "Controls\scrollBar.hpp"		// Used by other classes. Must be defined first

#include "Controls\background.hpp"
#include "Controls\button.hpp"
#include "Controls\buttonDanger.hpp"
#include "Controls\buttonPrimary.hpp"
#include "Controls\buttonSuccess.hpp"
#include "Controls\buttonWarning.hpp"
#include "Controls\controlsGroup.hpp"
#include "Controls\listNBox.hpp"
#include "Controls\picture.hpp"
#include "Controls\structuredText.hpp"
#include "Controls\text.hpp"
