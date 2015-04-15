/*
	Created by BauerMitFackel
*/

class TTC_UI_Picture_Dark {

	idc = -1;
	deletable = 0;
	fade = 0;
	access = ACCESS_READ_WRITE;
	type = CT_STATIC;
	style = ST_PICTURE + 2048;
	font = "PuristaMedium";
	sizeEx = 0;
	lineSpacing = 0;
	text = "";
	fixedWidth = 0;
	shadow = 0;
	
	colorBackground[]	= COLOR_BLACK_A75;
	colorShadow[]		= COLOR_TRANSPARENT;
	colorText[]			= COLOR_WHITE_A100;
   
	tooltip 			= "";					// Tooltip text
	tooltipColorText[]	= COLOR_WHITE_A100;		// Tooltip text color
	tooltipColorBox[]	= COLOR_BLACK_A75;		// Tooltip frame color
	tooltipColorShade[]	= COLOR_BLACK_A75;		// Tooltip background color
};
