/*
	Created by BauerMitFackel
*/

class TTC_UI_ListNBox_Dark {

	idc				= -1;									// Control identification (without it, the control won't be displayed)
	access			= ACCESS_READ_WRITE;					// Control access
	type			= CT_LISTNBOX; 							// Type 102
	style			= ST_MULTI; 							// Style
	default			= 0; 									// Control selected by default (only one within a display can be used)
	blinkingPeriod	= 0; 									// Time in which control will fade out and back in. Use 0 to disable the effect.
	sizeEx 			= "0.022 / (getResolution select 5)";
	font 			= "PuristaMedium";
	shadow 			= 0; 									// Shadow (0 - none, 1 - directional, color affected by colorShadow, 2 - black outline)
	period 			= 1; 									// Oscillation time between colorSelect/colorSelectBackground2 and colorSelect2/colorSelectBackground when selected
	rowHeight 		= 0;									// Row height
	maxHistoryDelay = 1;									// Time since last keyboard type search to reset it
	
	x = 0;
	y = 0;
	w = 1;
	h = 1;

	colorText[]					= COLOR_WHITE_A100;			// Text and frame color
	colorDisabled[]				= COLOR_WHITE_A25;			// Disabled text color
	colorSelect[]				= COLOR_BLACK_A100;			// Text selection color
	colorSelect2[]				= COLOR_BLACK_A100;			// Text selection color (oscillates between this and colorSelect)
	colorSelectBackground[]		= COLOR_WHITE_A75;			// Selected item fill color
	colorSelectBackground2[]	= COLOR_WHITE_A75;			// Selected item fill color (oscillates between this and colorSelectBackground)
	colorShadow[] 				= COLOR_BLACK_A50;			// Text shadow color (used only when shadow is 1)
	colorPicture[]				= COLOR_WHITE_A100;
	colorPictureSelected[]		= COLOR_WHITE_A100;
	colorPictureDisabled[]		= COLOR_WHITE_A25;
	
	tooltip 			= "";					// Tooltip text
	tooltipColorText[]	= COLOR_WHITE_A100;		// Tooltip text color
	tooltipColorBox[]	= COLOR_BLACK_A75;		// Tooltip frame color
	tooltipColorShade[]	= COLOR_BLACK_A75;		// Tooltip background color

			
	columns[] = {0.0}; // Horizontal coordinates of columns (relative to list width, in range from 0 to 1)

	drawSideArrows = 0; // 1 to draw buttons linked by idcLeft and idcRight on both sides of selected line. They are resized to line height
	idcLeft = -1;
	idcRight = -1;

	soundSelect[] = {"\A3\ui_f\data\sound\RscListbox\soundSelect",0.09,1}; // Sound played when an item is selected
	
	autoScrollSpeed		= -1;
	autoScrollDelay		= 5;
	autoScrollRewind	= 0;
	
	class ListScrollBar {	
	
		color[] = COLOR_WHITE_A25;
		autoScrollEnabled = 1;
	};
};
