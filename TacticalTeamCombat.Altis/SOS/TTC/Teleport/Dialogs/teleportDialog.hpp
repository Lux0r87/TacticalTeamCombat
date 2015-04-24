/*
    Created by BauerMitFackel
*/

#define __TTC_TP_UI_ROUND(number)		((round ((number) * 1000)) / 1000)

#define TTC_TP_UI_SZ_W						__TTC_TP_UI_ROUND(safezoneW)
#define TTC_TP_UI_SZ_H						__TTC_TP_UI_ROUND(safezoneH)
#define TTC_TP_UI_SZ_X						__TTC_TP_UI_ROUND(safezoneX)
#define TTC_TP_UI_SZ_Y						__TTC_TP_UI_ROUND(safezoneY)

#define TTC_TP_UI_DIALOG_W					__TTC_TP_UI_ROUND(0.250 * TTC_TP_UI_SZ_W)
#define TTC_TP_UI_DIALOG_H					__TTC_TP_UI_ROUND(0.500 * TTC_TP_UI_SZ_H)
#define TTC_TP_UI_SPACING					__TTC_TP_UI_ROUND(0.002 * ((TTC_TP_UI_SZ_H + TTC_TP_UI_SZ_W) / 2))

#define TTC_TP_UI_SECTOR_LIST_HEADER_W 		TTC_TP_UI_DIALOG_W
#define TTC_TP_UI_SECTOR_LIST_HEADER_H		__TTC_TP_UI_ROUND(0.040 * TTC_TP_UI_SZ_H)
#define TTC_TP_UI_CLOSE_W					__TTC_TP_UI_ROUND(TTC_TP_UI_DIALOG_W * 0.3)
#define TTC_TP_UI_CLOSE_H					__TTC_TP_UI_ROUND(0.05 * TTC_TP_UI_SZ_H)
#define TTC_TP_UI_TELEPORT_W				__TTC_TP_UI_ROUND((TTC_TP_UI_DIALOG_W * 0.7) - TTC_TP_UI_SPACING)
#define TTC_TP_UI_TELEPORT_H				TTC_TP_UI_CLOSE_H
#define TTC_TP_UI_SECTOR_LIST_BACKGROUND_W	TTC_TP_UI_DIALOG_W
#define TTC_TP_UI_SECTOR_LIST_BACKGROUND_H	TTC_TP_UI_DIALOG_H - (TTC_TP_UI_SECTOR_LIST_HEADER_H + TTC_TP_UI_CLOSE_H + TTC_TP_UI_SPACING)
#define TTC_TP_UI_SECTOR_LIST_W				TTC_TP_UI_SECTOR_LIST_BACKGROUND_W
#define TTC_TP_UI_SECTOR_LIST_H				TTC_TP_UI_SECTOR_LIST_BACKGROUND_H

#define TTC_TP_UI_SECTOR_LIST_HEADER_X		__TTC_TP_UI_ROUND((TTC_TP_UI_SZ_X + (TTC_TP_UI_SZ_W / 2)) - (TTC_TP_UI_DIALOG_W / 2))
#define TTC_TP_UI_SECTOR_LIST_HEADER_Y		__TTC_TP_UI_ROUND((TTC_TP_UI_SZ_Y + (TTC_TP_UI_SZ_H / 2)) - (TTC_TP_UI_DIALOG_H / 2))
#define TTC_TP_UI_SECTOR_LIST_BACKGROUND_X	TTC_TP_UI_SECTOR_LIST_HEADER_X
#define TTC_TP_UI_SECTOR_LIST_BACKGROUND_Y	TTC_TP_UI_SECTOR_LIST_HEADER_Y + TTC_TP_UI_SECTOR_LIST_HEADER_H
#define TTC_TP_UI_SECTOR_LIST_X				TTC_TP_UI_SECTOR_LIST_BACKGROUND_X
#define TTC_TP_UI_SECTOR_LIST_Y				TTC_TP_UI_SECTOR_LIST_BACKGROUND_Y
#define TTC_TP_UI_CLOSE_X					TTC_TP_UI_SECTOR_LIST_X
#define TTC_TP_UI_CLOSE_Y					TTC_TP_UI_SECTOR_LIST_Y + TTC_TP_UI_SECTOR_LIST_H + TTC_TP_UI_SPACING
#define TTC_TP_UI_TELEPORT_X				TTC_TP_UI_CLOSE_X + TTC_TP_UI_CLOSE_W + TTC_TP_UI_SPACING
#define TTC_TP_UI_TELEPORT_Y				TTC_TP_UI_CLOSE_Y


class TTC_TP_TeleportDialog {

	idd				= 60000;
	onLoad			= "_this call TTC_TP_UI_fnc_onDialogLoad";
	onUnLoad		= "_this call TTC_TP_UI_fnc_onDialogUnLoad";
	
	class Controls {
		
		class TTC_TP_TeleportDialog_SectorList_Header: TTC_UI_Text {
			
			idc					= 60001;
			moving				= true;
			style				= TTC_UI_STYLE_CENTER;
			colorBackground[]	= TTC_UI_COLOR_BLACK_A25;
			text				= "SECTORS";
			x 					= TTC_TP_UI_SECTOR_LIST_HEADER_X;
			y 					= TTC_TP_UI_SECTOR_LIST_HEADER_Y;
			w 					= TTC_TP_UI_SECTOR_LIST_HEADER_W;
			h 					= TTC_TP_UI_SECTOR_LIST_HEADER_H;
		};
				
		class TTC_TP_TeleportDialog_SectorList_Background: TTC_UI_Background {
			
			idc	= 60002;
			x	= TTC_TP_UI_SECTOR_LIST_BACKGROUND_X;
			y	= TTC_TP_UI_SECTOR_LIST_BACKGROUND_Y;
			w	= TTC_TP_UI_SECTOR_LIST_BACKGROUND_W;
			h	= TTC_TP_UI_SECTOR_LIST_BACKGROUND_H;
		};

		class TTC_TP_TeleportDialog_SectorList: TTC_UI_ListNBox {

			idc				= 60003;
			rowHeight		= 0.07;
			columns[]		= {-0.001, 0.75};
			x 				= TTC_TP_UI_SECTOR_LIST_X;
			y 				= TTC_TP_UI_SECTOR_LIST_Y;
			w 				= TTC_TP_UI_SECTOR_LIST_W;
			h 				= TTC_TP_UI_SECTOR_LIST_H;
			
			onLBSelChanged 	= "_this spawn TTC_TP_UI_fnc_onSectorSelected;";
		};
		
		class TTC_TP_TeleportDialog_Close: TTC_UI_ButtonDanger {
		
			idc		= 60004;
			text	= "Close";
			sizeEx	= TTC_UI_TEXT_SIZE_XL;
			x 		= TTC_TP_UI_CLOSE_X;
			y 		= TTC_TP_UI_CLOSE_Y;
			w 		= TTC_TP_UI_CLOSE_W;
			h 		= TTC_TP_UI_CLOSE_H;
			
			action	= "closeDialog 0;";
		};

		class TTC_TP_TeleportDialog_Teleport: TTC_UI_ButtonSuccess {

			idc		= 60005;
			text	= "Teleport";
			sizeEx	= TTC_UI_TEXT_SIZE_XL;
			x 		= TTC_TP_UI_TELEPORT_X;
			y 		= TTC_TP_UI_TELEPORT_Y;
			w 		= TTC_TP_UI_TELEPORT_W;
			h 		= TTC_TP_UI_TELEPORT_H;
			
			action	= "[] spawn TTC_TP_UI_fnc_onTeleportClicked;";
		};
	};
};

