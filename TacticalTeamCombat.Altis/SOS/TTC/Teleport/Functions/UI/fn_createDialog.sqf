/*
	Creates the teleport dialog.
	
    Created by BauerMitFackel
*/

disableSerialization;

// Create the dialog
_dialog = createDialog "TTC_TP_TeleportDialog";

// TODO: Setup sector list
[] call TTC_TP_UI_fnc_updateSectorList;
