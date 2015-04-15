/*
	Created by BauerMitFackel
*/

class TTC_UI_Text_Dark {

	idc 		= -1;											// Control identification
	access 		= ACCESS_READ_WRITE;							// Control access
	type 		= CT_STATIC;									// Control type
	style 		= ST_LEFT;										// Control style
	fixedWidth 	= 0;
	shadow 		= 0;											// Shadow (0 - none, 1 - directional, color affected by colorShadow, 2 - black outline)
	text 		= "";											// Default text
	font 		= "PuristaMedium";								// Font
	sizeEx 		= "0.022 / (getResolution select 5)";			// Text size
	linespacing = 1;
	
	colorBackground[]	= COLOR_BLACK_A75;
	colorShadow[]		= COLOR_TRANSPARENT;
	colorText[]			= COLOR_WHITE_A100;
};