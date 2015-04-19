/*
	Control base class.
	Created by BauerMitFackel
	See: https://community.bistudio.com/wiki/Dialog_Control
*/
class TTC_UI_Control {

	idc							= -1;
	moving						= true;
	access						= TTC_UI_ACCESS_READ_WRITE;
	type						= TTC_UI_TYPE_STATIC;
	style						= TTC_UI_STYLE_LEFT;
	x							= 0;
	y							= 0;
	w							= 0;
	h							= 0;
	sizeEx						= TTC_UI_TEXT_SIZE_M;
	font						= TTC_UI_FONT_DEFAULT;
	text						= "";
	shadow 						= 0; 
	colorBackground[]			= TTC_UI_COLOR_BLACK_A75; 
	colorShadow[]				= TTC_UI_COLOR_BLACK_A50;
	colorText[]					= TTC_UI_COLOR_WHITE_A100;
};
