/*
	Created by BauerMitFackel
*/

class TTC_UI_Background_Dark {

	idc					= -1;
	access				= ACCESS_READ_WRITE;
	type 				= CT_STATIC;
    style 				= ST_CENTER;
    shadow 				= 0;
	colorBackground[]	= COLOR_BLACK_A75; 
	sizeEx 				= 0;
	font 				= "PuristaMedium";
	text				= ""; 
	colorText[]			= COLOR_TRANSPARENT;
};


class TTC_UI_BackgroundDanger_Dark: TTC_UI_Background_Dark {

	colorBackground[]	= COLOR_POMEGRANATE_A75; 
};


class TTC_UI_BackgroundInfo_Dark: TTC_UI_Background_Dark {

	colorBackground[]	= COLOR_ASBESTOS_A75; 
};


class TTC_UI_BackgroundPrimary_Dark: TTC_UI_Background_Dark {

	colorBackground[]	= COLOR_BELIZE_HOLE_A75; 
};


class TTC_UI_BackgroundSuccess_Dark: TTC_UI_Background_Dark {

	colorBackground[]	= COLOR_NEPHRITIS_A75; 
};


class TTC_UI_BackgroundWarning_Dark: TTC_UI_Background_Dark {

	colorBackground[]	= COLOR_PUMPKIN_A75; 
};
