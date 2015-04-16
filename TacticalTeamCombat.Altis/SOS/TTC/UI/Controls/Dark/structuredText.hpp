/*
	Created by BauerMitFackel
*/

class TTC_UI_StructuredText_Dark {

	idc 		= -1;											// Control identification
	access 		= ACCESS_READ_WRITE;							// Control access
	type 		= CT_STRUCTURED_TEXT;							// Control type
	style 		= ST_LEFT;										// Control style
	shadow 		= 0;											// Shadow (0 - none, 1 - directional, color affected by colorShadow, 2 - black outline)
	text 		= "";											// Default text
	size 		= "0.022 / (getResolution select 5)";			// Text size
	
	colorBackground[]	= COLOR_BLACK_A75;
	colorShadow[]		= COLOR_TRANSPARENT;
	colorText[]			= COLOR_WHITE_A100;
	
	class Attributes {
	
		font	= "PuristaMedium";
		align	= "left";
        valign	= "middle";
		color	= "#FFFFFF";
	};
};
