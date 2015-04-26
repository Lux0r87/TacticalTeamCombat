/*
    Created by BauerMitFackel
    Edited by Lux0r
*/

class TTC_Teleport {
	tag = "TTC_TP";

	class Functions {
		file = "SOS\TTC\Teleport\Functions";

		class getSectorState {};
		class teleport {};
	};

	class Actions {
		file = "SOS\TTC\Teleport\Functions\Actions";

		class addAction{};
	};
};

class TTC_Teleport_UI {
	tag = "TTC_TP_UI";

	class Functions {	
		file = "SOS\TTC\Teleport\Functions\UI";

		class createDialog {};
		class onDialogLoad {};
		class onDialogUnLoad {};
		class onSectorSelected {};
		class onTeleportClicked {};
		class updateSectorList {};
	};
};
