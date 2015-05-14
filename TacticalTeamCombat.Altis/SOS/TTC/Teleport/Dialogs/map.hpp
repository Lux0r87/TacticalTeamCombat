/*
	Created by Lux0r
*/


class TTC_TP_MapControl: TTC_UI_MapControl {
	colorCountlines[]			= {0.572, 0.354, 0.188, 0.125};
	colorCountlinesWater[]		= {0.491, 0.577, 0.702, 0.15};
	colorGrid[]					= {0.10, 0.10, 0.10, 0.30};
	colorGridMap[]				= {0.10, 0.10, 0.10, 0.30};
	colorMainCountlines[]		= {0.572, 0.354, 0.188, 0.25};
	colorMainCountlinesWater[]	= {0.491, 0.577, 0.702, 0.30};

	fontNames	= PuristaSemiBold;

	//text = "\ca\ui\data\map_background2_co.paa";
	alphaFadeStartScale		= 0.00;
	alphaFadeEndScale		= 0.00;
	scaleDefault			= 0.10;

	class Bunker {
		icon		= "\A3\ui_f\data\map\mapcontrol\bunker_ca.paa";
		color[]		= TTC_UI_COLOR_BLACK_A50;
		size		= 14;
		importance	= "1.5 * 14 * 0.05";
		coefMin		= 0.25;
		coefMax		= 4.00;
	};

	class BusStop {
		icon		= "\A3\ui_f\data\map\mapcontrol\busstop_CA.paa";
		color[]		= TTC_UI_COLOR_WHITE_A50;
		size		= 24;
		importance	= 1;
		coefMin		= 0.85;
		coefMax		= 1;
	};

	class Chapel {
		icon		= "\A3\ui_f\data\map\mapcontrol\Chapel_CA.paa";
		color[]		= TTC_UI_COLOR_BLACK_A50;
		size		= 24;
		importance	= 1;
		coefMin		= 0.85;
		coefMax		= 1;
	};

	class Church {
		icon		= "\A3\ui_f\data\map\mapcontrol\church_CA.paa";
		color[]		= TTC_UI_COLOR_WHITE_A50;
		size		= 24;
		importance	= 1;
		coefMin		= 0.85;
		coefMax		= 1;
	};

	class Command {
		icon		= "\A3\ui_f\data\map\mapcontrol\waypoint_ca.paa";
		color[]		= TTC_UI_COLOR_WHITE_A50;
		size		= 18;
		importance	= 1;
		coefMin		= 1;
		coefMax		= 1;
	};

	class Cross {
		icon		= "\A3\ui_f\data\map\mapcontrol\Cross_CA.paa";
		color[]		= TTC_UI_COLOR_BLACK_A50;
		size		= 24;
		importance	= 1;
		coefMin		= 0.85;
		coefMax		= 1;
	};

	class Fortress {
		icon		= "\A3\ui_f\data\map\mapcontrol\bunker_ca.paa";
		color[]		= TTC_UI_COLOR_BLACK_A50;
		size		= 16;
		importance	= "2 * 16 * 0.05";
		coefMin		= 0.25;
		coefMax		= 4.00;
	};

	class Fuelstation {
		icon		= "\A3\ui_f\data\map\mapcontrol\fuelstation_CA.paa";
		color[]		= TTC_UI_COLOR_WHITE_A50;
		size		= 24;
		importance	= 1;
		coefMin		= 0.85;
		coefMax 	= 1.00;
	};

	class Fountain {
		icon		= "\A3\ui_f\data\map\mapcontrol\fountain_ca.paa";
		color[]		= TTC_UI_COLOR_BLACK_A50;
		size		= 11;
		importance	= "1 * 12 * 0.05";
		coefMin		= 0.25;
		coefMax		= 4;
	};

	class Hospital {
		icon		= "\A3\ui_f\data\map\mapcontrol\hospital_CA.paa";
		color[]		= TTC_UI_COLOR_WHITE_A50;
		size		= 24;
		importance	= 1;
		coefMin		= 0.85;
		coefMax		= 1;
	};

	class Lighthouse {
		icon		= "\A3\ui_f\data\map\mapcontrol\lighthouse_CA.paa";
		color[]		= TTC_UI_COLOR_WHITE_A50;
		size		= 24;
		importance	= 1;
		coefMin		= 0.85;
		coefMax		= 4;
	};

	class Powersolar {
		icon		= "\A3\ui_f\data\map\mapcontrol\powersolar_CA.paa";
		color[]		= TTC_UI_COLOR_WHITE_A50;
		size		= 24;
		importance	= 1;
		coefMin		= 0.85;
		coefMax		= 1;
	};

	class Powerwave {
		icon		= "\A3\ui_f\data\map\mapcontrol\powerwave_CA.paa";
		color[]		= TTC_UI_COLOR_WHITE_A50;
		size		= 24;
		importance	= 1;
		coefMin		= 0.85;
		coefMax		= 1;
	};

	class Powerwind {
		icon		= "\A3\ui_f\data\map\mapcontrol\powerwind_CA.paa";
		color[]		= TTC_UI_COLOR_WHITE_A50;
		size		= 24;
		importance	= 1;
		coefMin		= 0.85;
		coefMax		= 1;
	};

	class Quay {
		icon		= "\A3\ui_f\data\map\mapcontrol\quay_CA.paa";
		color[]		= TTC_UI_COLOR_WHITE_A50;
		size		= 24;
		importance	= 1;
		coefMin		= 0.85;
		coefMax		= 1;
	};

	class Rock {
		icon		= "\A3\ui_f\data\map\mapcontrol\rock_ca.paa";
		color[]		= {0.30, 0.30, 0.30, 1.00};
		size		= 12;
		importance	= "0.5 * 12 * 0.05";
		coefMin		= 0.25;
		coefMax		= 4.00;
	};

	class Ruin {
		icon		= "\A3\ui_f\data\map\mapcontrol\ruin_ca.paa";
		color[]		= TTC_UI_COLOR_BLACK_A50;
		size		= 16;
		importance	= "1.2 * 16 * 0.05";
		coefMin		= 1;
		coefMax		= 4;
	};

	class Shipwreck
	{
		icon		= "\A3\ui_f\data\map\mapcontrol\shipwreck_CA.paa";
		color[]		= TTC_UI_COLOR_WHITE_A50;
		size		= 24;
		importance	= 1;
		coefMin		= 0.85;
		coefMax		= 1;
	};

	class Stack {
		icon		= "\A3\ui_f\data\map\mapcontrol\stack_ca.paa";
		color[]		= TTC_UI_COLOR_BLACK_A50;
		size		= 20;
		importance	= "2 * 16 * 0.05";
		coefMin		= 0.90;
		coefMax		 = 4;
	};

	class Tourism {
		icon		= "\A3\ui_f\data\map\mapcontrol\tourism_ca.paa";
		color[]		= TTC_UI_COLOR_BLACK_A50;
		size		= 16;
		importance	= "1 * 16 * 0.05";
		coefMin		= 0.70;
		coefMax		= 4;
	};

	class Transmitter {
		icon		= "\A3\ui_f\data\map\mapcontrol\transmitter_CA.paa";
		color[]		= TTC_UI_COLOR_WHITE_A50;
		size		= 24;
		importance	= 1;
		coefMin		= 0.85;
		coefMax		= 1;
	};

	class ViewTower {
		icon		= "\A3\ui_f\data\map\mapcontrol\viewtower_ca.paa";
		color[]		= TTC_UI_COLOR_BLACK_A50;
		size		= 16;
		importance	= "2.5 * 16 * 0.05";
		coefMin		= 0.50;
		coefMax		= 4;
	};

	class Watertower {
		icon		= "\A3\ui_f\data\map\mapcontrol\watertower_CA.paa";
		color[]		= TTC_UI_COLOR_WHITE_A50;
		size		= 24;
		importance	= 1;
		coefMin		= 0.85;
		coefMax		= 1;
	};
};
