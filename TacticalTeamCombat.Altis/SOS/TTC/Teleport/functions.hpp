/*
    Created by BauerMitFackel
    Edited by Lux0r
*/

class TTC_Teleport {
	tag = "TTC_TP";

	class TTC_Teleport_Functions {
		file = "SOS\TTC\Teleport\Functions";

		class getSectorState {};
		class teleport {};
	};
};

class TTC_Teleport_UI {
	tag = "TTC_TP_UI";

	class TTC_Teleport_UI_Functions {	
		file = "SOS\TTC\Teleport\Functions\UI";

		class createDialog {};
		class onDialogLoad {};
		class onDialogUnLoad {};
		class onSectorSelected {};
		class onTeleportClicked {};
		class updateSectorList {};
	};
};
