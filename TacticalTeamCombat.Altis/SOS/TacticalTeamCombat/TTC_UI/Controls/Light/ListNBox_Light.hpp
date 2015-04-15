class TTC_UI_ListNBox_Light: TTC_UI_ListNBox_Dark {

	colorText[]					= COLOR_BLACK_A100;			// Text and frame color
	colorDisabled[]				= COLOR_BLACK_A25;			// Disabled text color
	colorSelect[]				= COLOR_BLACK_A100;			// Text selection color
	colorSelect2[]				= COLOR_BLACK_A75;			// Text selection color (oscillates between this and colorSelect)
	colorSelectBackground[]		= COLOR_WHITE_A100;			// Selected item fill color
	colorSelectBackground2[]	= COLOR_WHITE_A75;			// Selected item fill color (oscillates between this and colorSelectBackground)
	colorShadow[] 				= COLOR_BLACK_A50;			// Text shadow color (used only when shadow is 1)
	
	colorPicture[]				= COLOR_WHITE_A100;
	colorPictureSelected[]		= COLOR_WHITE_A100;
	colorPictureDisabled[]		= COLOR_WHITE_A25;
	
	tooltip 			= "";					// Tooltip text
	tooltipColorText[]	= COLOR_BLACK_A100;		// Tooltip text color
	tooltipColorBox[]	= COLOR_WHITE_A75;		// Tooltip frame color
	tooltipColorShade[]	= COLOR_WHITE_A75;		// Tooltip background color
		
	class ListScrollBar {
				
		color[] = COLOR_WHITE_A100;
		autoScrollEnabled = 1;
	};
};