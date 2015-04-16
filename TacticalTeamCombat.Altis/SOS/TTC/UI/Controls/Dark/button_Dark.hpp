/*
	Created by BauerMitFackel
*/

class TTC_UI_Button_Dark {

	idc			= -1;
	access		= ACCESS_READ_WRITE;	// Limits what deriving classes are allowed to (re-)specify
	type		= CT_BUTTON;			// The control type
	style		= ST_CENTER;			// The control style
	text		= "";					// The text to display initially
	
	colorText[]					= COLOR_WHITE_A100;			// The text color
	colorDisabled[]				= COLOR_WHITE_A25;			// The text color, if the button has been disabled via ctrlEnable
	colorBackground[]			= COLOR_BLACK_A75;			// The background color
	colorBackgroundDisabled[]	= COLOR_BLACK_A75;			// The background color, if the button has been disabled via ctrlEnable
	colorBackgroundActive[]		= COLOR_BLACK_A100;			// The background color when the button has received focus via mouse-over
	colorFocused[] 				= COLOR_BLACK_A100;			// The border color when the button has received focus
	colorBorder[] 				= COLOR_BLACK_A100;			// The border color
	colorShadow[]				= COLOR_BLACK_A50;			// The shadow color
   
	// Sounds
	soundEnter[]	= {"\A3\ui_f\data\sound\RscButton\soundEnter",	0.09,	1};		// The sound to play, when the cursor enters the button's bounds
	soundPush[]		= {"\A3\ui_f\data\sound\RscButton\soundPush",	0.09,	1};		// The sound to play, when the button has been pushed
	soundClick[]	= {"\A3\ui_f\data\sound\RscButton\soundClick",	0.09,	1};		// The sound to play, when the button is being released
	soundEscape[]	= {"\A3\ui_f\data\sound\RscButton\soundEscape",	0.09,	1};		// The sound to play, when the button has been pushed and the mouse button is released when not over the control
   
   font = "PuristaMedium";
   sizeEx = "0.022 / (getResolution select 5)";
   shadow = 0;
   offsetX = 0;					// The relative X offset between the button and its shadow
   offsetY = 0;					// The relative Y offset between the button and its shadow
   offsetPressedX = 0;			// The relative X offset between the button and its shadow, when it's pressed
   offsetPressedY = 0;			// The relative Y offset between the button and its shadow, when it's pressed
   borderSize = 0;		// The width of the border
};


class TTC_UI_ButtonDanger_Dark: TTC_UI_Button_Dark {
	
	colorBackground[]			= COLOR_POMEGRANATE_A75;
	colorBackgroundDisabled[]	= COLOR_POMEGRANATE_A75;
	colorBackgroundActive[]		= COLOR_POMEGRANATE_A100;
	colorFocused[]				= COLOR_POMEGRANATE_A100;
	colorBorder[]				= COLOR_POMEGRANATE_A100;
};


class TTC_UI_ButtonInfo_Dark: TTC_UI_Button_Dark {
	
	colorBackground[]			= COLOR_ASBESTOS_A75;
	colorBackgroundDisabled[]	= COLOR_ASBESTOS_A75;
	colorBackgroundActive[]		= COLOR_ASBESTOS_A100;
	colorFocused[]				= COLOR_ASBESTOS_A100;
	colorBorder[]				= COLOR_ASBESTOS_A100;
};


class TTC_UI_ButtonPrimary_Dark: TTC_UI_Button_Dark {
	
	colorBackground[]			= COLOR_BELIZE_HOLE_A75;
	colorBackgroundDisabled[]	= COLOR_BELIZE_HOLE_A75;
	colorBackgroundActive[]		= COLOR_BELIZE_HOLE_A100;
	colorFocused[]				= COLOR_BELIZE_HOLE_A100;
	colorBorder[]				= COLOR_BELIZE_HOLE_A100;
};


class TTC_UI_ButtonSuccess_Dark: TTC_UI_Button_Dark {

	colorBackground[]			= COLOR_NEPHRITIS_A75;
	colorBackgroundDisabled[]	= COLOR_NEPHRITIS_A75;
	colorBackgroundActive[]		= COLOR_NEPHRITIS_A100;
	colorFocused[]				= COLOR_NEPHRITIS_A100;
	colorBorder[]				= COLOR_NEPHRITIS_A100;
};


class TTC_UI_ButtonWarning_Dark: TTC_UI_Button_Dark {
	
	colorBackground[]			= COLOR_PUMPKIN_A75;
	colorBackgroundDisabled[]	= COLOR_PUMPKIN_A75;
	colorBackgroundActive[]		= COLOR_PUMPKIN_A100;
	colorFocused[]				= COLOR_PUMPKIN_A100;
	colorBorder[]				= COLOR_PUMPKIN_A100;
};

