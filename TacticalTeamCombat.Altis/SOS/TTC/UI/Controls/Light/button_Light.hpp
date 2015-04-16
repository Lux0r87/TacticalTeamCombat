/*
	Created by BauerMitFackel
*/

class TTC_UI_Button_Light: TTC_UI_Button_Dark {

	colorText[]					= COLOR_BLACK_A100;			// The text color
	colorDisabled[]				= COLOR_BLACK_A25;			// The text color, if the button has been disabled via ctrlEnable
	colorBackground[]			= COLOR_WHITE_A75;			// The background color
	colorBackgroundDisabled[]	= COLOR_WHITE_A75;			// The background color, if the button has been disabled via ctrlEnable
	colorBackgroundActive[]		= COLOR_WHITE_A100;			// The background color when the button has received focus via mouse-over
	colorFocused[] 				= COLOR_WHITE_A100;			// The border color when the button has received focus
	colorBorder[] 				= COLOR_WHITE_A100;			// The border color
	colorShadow[]				= COLOR_BLACK_A50;			// The shadow color
};


class TTC_UI_ButtonDanger_Light: TTC_UI_Button_Light {
	
	colorBackground[]			= COLOR_ALIZARIN_A75;
	colorBackgroundDisabled[]	= COLOR_ALIZARIN_A75;
	colorBackgroundActive[]		= COLOR_ALIZARIN_A100;
	colorFocused[]				= COLOR_ALIZARIN_A100;
	colorBorder[]				= COLOR_ALIZARIN_A100;
};


class TTC_UI_ButtonInfo_Light: TTC_UI_Button_Light {
	
	colorBackground[]			= COLOR_CONCRETE_A75;
	colorBackgroundDisabled[]	= COLOR_CONCRETE_A75;
	colorBackgroundActive[]		= COLOR_CONCRETE_A100;
	colorFocused[]				= COLOR_CONCRETE_A100;
	colorBorder[]				= COLOR_CONCRETE_A100;
};


class TTC_UI_ButtonPrimary_Light: TTC_UI_Button_Light {
	
	colorBackground[]			= COLOR_PETER_RIVER_A75;
	colorBackgroundDisabled[]	= COLOR_PETER_RIVER_A75;
	colorBackgroundActive[]		= COLOR_PETER_RIVER_A100;
	colorFocused[]				= COLOR_PETER_RIVER_A100;
	colorBorder[]				= COLOR_PETER_RIVER_A100;
};


class TTC_UI_ButtonSuccess_Light: TTC_UI_Button_Light {

	colorBackground[]			= COLOR_EMERALD_A75;
	colorBackgroundDisabled[]	= COLOR_EMERALD_A75;
	colorBackgroundActive[]		= COLOR_EMERALD_A100;
	colorFocused[]				= COLOR_EMERALD_A100;
	colorBorder[]				= COLOR_EMERALD_A100;
};


class TTC_UI_ButtonWarning_Light: TTC_UI_Button_Light {
	
	colorBackground[]			= COLOR_CARROT_A75;
	colorBackgroundDisabled[]	= COLOR_CARROT_A75;
	colorBackgroundActive[]		= COLOR_CARROT_A100;
	colorFocused[]				= COLOR_CARROT_A100;
	colorBorder[]				= COLOR_CARROT_A100;
};

