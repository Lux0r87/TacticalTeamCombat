/*
	Creates the teleport dialog.
	
    Created by BauerMitFackel
*/

disableSerialization;

// Create the dialog
_dialog = createDialog "TTC_TP_TeleportDialog";
TTC_CTI_sectors call TTC_TP_UI_fnc_updateSectorList;
