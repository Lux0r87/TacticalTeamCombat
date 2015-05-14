/*
	Created by Lux0r
*/


class TTC_UI_MapControl: TTC_UI_Control {
	access	= 0;
	idc		= -1;
	type	= TTC_UI_TYPE_MAP_MAIN;
	style	= TTC_UI_STYLE_PICTURE;

	colorBackground[]			= TTC_UI_COLOR_WHITE_A100;
	colorCountlines[]			= {0.572, 0.354, 0.188, 0.25};
	colorCountlinesWater[]		= {0.491, 0.577, 0.702, 0.30};
	colorForest[]				= {0.624, 0.78, 0.388, 0.50};
	colorForestBorder[]			= TTC_UI_COLOR_TRANSPARENT;
	colorGrid[]					= {0.10, 0.10, 0.10, 0.60};
	colorGridMap[]				= {0.10, 0.10, 0.10, 0.60};
	colorInactive[]				= TTC_UI_COLOR_WHITE_A50;
	colorLevels[]				= {0.286, 0.177, 0.094, 0.50};
	colorMainCountlines[]		= {0.572, 0.354, 0.188, 0.50};
	colorMainCountlinesWater[]	= {0.491, 0.577, 0.702, 0.60};
	colorMainRoads[]			= {0.90, 0.50, 0.30, 1.00};
	colorMainRoadsFill[]		= {1.00, 0.60, 0.40 ,1.00};
	colorNames[]				= {0.10, 0.10, 0.10, 0.90};
	colorOutside[]				= TTC_UI_COLOR_BLACK_A100;
	colorPowerLines[]			= {0.10, 0.10, 0.10, 1.00};
	colorRoads[]				= {0.70, 0.70, 0.70, 1.00};
	colorRoadsFill[]			= TTC_UI_COLOR_WHITE_A100;
	colorRocks[]				= {0.00, 0.00, 0.00, 0.30};
	colorRocksBorder[]			= TTC_UI_COLOR_TRANSPARENT;
	colorRailWay[]				= {0.80, 0.20, 0,10, 1.00};
	colorSea[]					= {0.467, 0.631, 0.851, 0.50};
	colorText[]					= TTC_UI_COLOR_BLACK_A100;
	colorTracks[]				= {0.84, 0.76, 0.65, 0.15};
	colorTracksFill[]			= {0.84, 0.76, 0.65, 1.00};

	font	= TTC_UI_FONT_DEFAULT;
	sizeEx	= "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 0.8)";

	fontLabel	= TTC_UI_FONT_DEFAULT;
	sizeExLabel	= "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 0.8)";
	fontGrid	= "TahomaB";
	sizeExGrid	= 0.02;
	fontUnits	= "TahomaB";
	sizeExUnits	= "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 0.8)";
	fontNames	= TTC_UI_FONT_DEFAULT;
	sizeExNames	= "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 0.8) * 2";
	fontInfo	= TTC_UI_FONT_DEFAULT;
	sizeExInfo	= "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 0.8)";
	fontLevel	= "TahomaB";
	sizeExLevel	= 0.02;

	//stickX				= {0.20, {"Gamma", 1.00, 1.50} };
	//stickY				= {0.20, {"Gamma", 1.00, 1.50} };
	ptsPerSquareSea		= 5;
	ptsPerSquareTxt		= 3;
	ptsPerSquareCLn		= 10;
	ptsPerSquareExp		= 10;
	ptsPerSquareCost	= 10;
	ptsPerSquareFor		= 9;
	ptsPerSquareForEdge	= 9;
	ptsPerSquareRoad	= 6;
	ptsPerSquareObj		= 9;

	//text = "\ca\ui\data\map_background2_co.paa";
	alphaFadeStartScale		= 0.00;
	alphaFadeEndScale		= 0.00;
	maxSatelliteAlpha		= 0.85;
	onMouseButtonClick		= "";
	onMouseButtonDblClick	= "";
	scaleDefault			= 0.25;
	scaleMin				= 0.001;
	scaleMax				= 1;
	showCountourInterval	= 0;
	text					= "#(argb,8,8,3)color(1,1,1,1)";

	class ActiveMarker {
		color[]		= {0.30, 0.10, 0.90, 1.00};
		size		= 50;
	};

	class Bunker {
		icon		= "\A3\ui_f\data\map\mapcontrol\bunker_ca.paa";
		color[]		= TTC_UI_COLOR_BLACK_A100;
		size		= 14;
		importance	= "1.5 * 14 * 0.05";
		coefMin		= 0.25;
		coefMax		= 4.00;
	};

	class Bush {
		icon		= "\A3\ui_f\data\map\mapcontrol\bush_ca.paa";
		color[]		= {0.45, 0.64, 0.33, 0.40};
		size		= 14/2;
		importance	= "0.2 * 14 * 0.05 * 0.05";
		coefMin		= 0.25;
		coefMax		= 4.00;
	};

	class BusStop {
		icon		= "\A3\ui_f\data\map\mapcontrol\busstop_CA.paa";
		color[]		= TTC_UI_COLOR_WHITE_A100;
		size		= 24;
		importance	= 1;
		coefMin		= 0.85;
		coefMax		= 1;
	};

	class Chapel {
		icon		= "\A3\ui_f\data\map\mapcontrol\Chapel_CA.paa";
		color[]		= TTC_UI_COLOR_BLACK_A100;
		size		= 24;
		importance	= 1;
		coefMin		= 0.85;
		coefMax		= 1;
	};

	class Church {
		icon		= "\A3\ui_f\data\map\mapcontrol\church_CA.paa";
		color[]		= TTC_UI_COLOR_WHITE_A100;
		size		= 24;
		importance	= 1;
		coefMin		= 0.85;
		coefMax		= 1;
	};

	class CustomMark {
		icon		= "\A3\ui_f\data\map\mapcontrol\custommark_ca.paa";
		color[]		= TTC_UI_COLOR_BLACK_A100;
		size		= 24;
		importance	= 1;
		coefMin		= 1;
		coefMax		= 1;
	};

	class Command {
		icon		= "\A3\ui_f\data\map\mapcontrol\waypoint_ca.paa";
		color[]		= TTC_UI_COLOR_WHITE_A100;
		size		= 18;
		importance	= 1;
		coefMin		= 1;
		coefMax		= 1;
	};

	class Cross {
		icon		= "\A3\ui_f\data\map\mapcontrol\Cross_CA.paa";
		color[]		= TTC_UI_COLOR_BLACK_A100;
		size		= 24;
		importance	= 1;
		coefMin		= 0.85;
		coefMax		= 1;
	};

	class Fortress {
		icon		= "\A3\ui_f\data\map\mapcontrol\bunker_ca.paa";
		color[]		= TTC_UI_COLOR_BLACK_A100;
		size		= 16;
		importance	= "2 * 16 * 0.05";
		coefMin		= 0.25;
		coefMax		= 4.00;
	};

	class Fuelstation {
		icon		= "\A3\ui_f\data\map\mapcontrol\fuelstation_CA.paa";
		color[]		= TTC_UI_COLOR_WHITE_A100;
		size		= 24;
		importance	= 1;
		coefMin		= 0.85;
		coefMax 	= 1.00;
	};

	class Fountain {
		icon		= "\A3\ui_f\data\map\mapcontrol\fountain_ca.paa";
		color[]		= TTC_UI_COLOR_BLACK_A100;
		size		= 11;
		importance	= "1 * 12 * 0.05";
		coefMin		= 0.25;
		coefMax		= 4;
	};

	class Hospital {
		icon		= "\A3\ui_f\data\map\mapcontrol\hospital_CA.paa";
		color[]		= TTC_UI_COLOR_WHITE_A100;
		size		= 24;
		importance	= 1;
		coefMin		= 0.85;
		coefMax		= 1;
	};

	class Lighthouse {
		icon		= "\A3\ui_f\data\map\mapcontrol\lighthouse_CA.paa";
		color[]		= TTC_UI_COLOR_WHITE_A100;
		size		= 24;
		importance	= 1;
		coefMin		= 0.85;
		coefMax		= 4;
	};

	class Powersolar {
		icon		= "\A3\ui_f\data\map\mapcontrol\powersolar_CA.paa";
		color[]		= TTC_UI_COLOR_WHITE_A100;
		size		= 24;
		importance	= 1;
		coefMin		= 0.85;
		coefMax		= 1;
	};

	class Powerwave {
		icon		= "\A3\ui_f\data\map\mapcontrol\powerwave_CA.paa";
		color[]		= TTC_UI_COLOR_WHITE_A100;
		size		= 24;
		importance	= 1;
		coefMin		= 0.85;
		coefMax		= 1;
	};

	class Powerwind {
		icon		= "\A3\ui_f\data\map\mapcontrol\powerwind_CA.paa";
		color[]		= TTC_UI_COLOR_WHITE_A100;
		size		= 24;
		importance	= 1;
		coefMin		= 0.85;
		coefMax		= 1;
	};

	class Quay {
		icon		= "\A3\ui_f\data\map\mapcontrol\quay_CA.paa";
		color[]		= TTC_UI_COLOR_WHITE_A100;
		size		= 24;
		importance	= 1;
		coefMin		= 0.85;
		coefMax		= 1;
	};

	class Rock {
		icon		= "\A3\ui_f\data\map\mapcontrol\rock_ca.paa";
		color[]		= {0.10, 0.10, 0.10, 0.80};
		size		= 12;
		importance	= "0.5 * 12 * 0.05";
		coefMin		= 0.25;
		coefMax		= 4.00;
	};

	class Ruin {
		icon		= "\A3\ui_f\data\map\mapcontrol\ruin_ca.paa";
		color[]		= TTC_UI_COLOR_BLACK_A100;
		size		= 16;
		importance	= "1.2 * 16 * 0.05";
		coefMin		= 1;
		coefMax		= 4;
	};

	class Shipwreck
	{
		icon		= "\A3\ui_f\data\map\mapcontrol\shipwreck_CA.paa";
		color[]		= TTC_UI_COLOR_WHITE_A100;
		size		= 24;
		importance	= 1;
		coefMin		= 0.85;
		coefMax		= 1;
	};

	class Stack {
		icon		= "\A3\ui_f\data\map\mapcontrol\stack_ca.paa";
		color[]		= TTC_UI_COLOR_BLACK_A100;
		size		= 20;
		importance	= "2 * 16 * 0.05";
		coefMin		= 0.90;
		coefMax		 = 4;
	};

	class Task {
		colorCreated[]	= TTC_UI_COLOR_WHITE_A100;
		colorCanceled[]	= {0.70, 0.70, 0.70, 1.00};
		colorDone[]		= {0.70, 1.00, 0.30, 1.00};
		colorFailed[]	= {1.00, 0.30, 0.20, 1.00};
		color[]			= {"(profilenamespace getvariable ['IGUI_TEXT_RGB_R',0])","(profilenamespace getvariable ['IGUI_TEXT_RGB_G',1])","(profilenamespace getvariable ['IGUI_TEXT_RGB_B',1])","(profilenamespace getvariable ['IGUI_TEXT_RGB_A',0.8])"};
		icon			= "\A3\ui_f\data\map\mapcontrol\taskIcon_CA.paa";
		iconCreated		= "\A3\ui_f\data\map\mapcontrol\taskIconCreated_CA.paa";
		iconCanceled	= "\A3\ui_f\data\map\mapcontrol\taskIconCanceled_CA.paa";
		iconDone		= "\A3\ui_f\data\map\mapcontrol\taskIconDone_CA.paa";
		iconFailed		= "\A3\ui_f\data\map\mapcontrol\taskIconFailed_CA.paa";
		size			= 27;
		importance		= 1;
		coefMin			= 1;
		coefMax			= 1;
	};

	class Tree {
		icon		= "\A3\ui_f\data\map\mapcontrol\bush_ca.paa";
		color[]		= {0.45, 0.64, 0.33, 0.40};
		size		= 12;
		importance	= "0.9 * 16 * 0.05";
		coefMin		= 0.25;
		coefMax		= 4;
	};

	class SmallTree {
		icon		= "\A3\ui_f\data\map\mapcontrol\bush_ca.paa";
		color[]		= {0.45, 0.64, 0.33, 0.40};
		size		= 12;
		importance	= "0.6 * 12 * 0.05";
		coefMin		= 0.25;
		coefMax		= 4;
	};

	class Tourism {
		icon		= "\A3\ui_f\data\map\mapcontrol\tourism_ca.paa";
		color[]		= TTC_UI_COLOR_BLACK_A100;
		size		= 16;
		importance	= "1 * 16 * 0.05";
		coefMin		= 0.70;
		coefMax		= 4;
	};

	class Transmitter {
		icon		= "\A3\ui_f\data\map\mapcontrol\transmitter_CA.paa";
		color[]		= TTC_UI_COLOR_WHITE_A100;
		size		= 24;
		importance	= 1;
		coefMin		= 0.85;
		coefMax		= 1;
	};

	class ViewTower {
		icon		= "\A3\ui_f\data\map\mapcontrol\viewtower_ca.paa";
		color[]		= TTC_UI_COLOR_BLACK_A100;
		size		= 16;
		importance	= "2.5 * 16 * 0.05";
		coefMin		= 0.50;
		coefMax		= 4;
	};

	class Watertower {
		icon		= "\A3\ui_f\data\map\mapcontrol\watertower_CA.paa";
		color[]		= TTC_UI_COLOR_WHITE_A100;
		size		= 24;
		importance	= 1;
		coefMin		= 0.85;
		coefMax		= 1;
	};

	class Waypoint {
		icon		= "\A3\ui_f\data\map\mapcontrol\waypoint_ca.paa";
		color[]		= TTC_UI_COLOR_BLACK_A100;
		size		= 24;
		importance	= 1;
		coefMin		= 1;
		coefMax		= 1;
	};

	class WaypointCompleted {
		icon		= "\A3\ui_f\data\map\mapcontrol\waypointCompleted_ca.paa";
		color[]		= TTC_UI_COLOR_BLACK_A100;
		size		= 24;
		importance	= 1;
		coefMin		= 1;
		coefMax		= 1;
	};
};
