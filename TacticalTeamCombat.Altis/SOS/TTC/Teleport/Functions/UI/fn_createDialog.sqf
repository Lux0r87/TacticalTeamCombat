/*
	Creates the teleport dialog.
	
    Created by BauerMitFackel
*/

disableSerialization;

// Create the dialog
_dialog = createDialog "TTC_TP_TeleportDialog";

// Update the sector list.
if (!isNil "TTC_CTI_sectors") then {
	TTC_CTI_sectors spawn TTC_TP_UI_fnc_updateSectorList;
};
