class TTC_CORE_saveTime {
	title		= "Tactical Team Combat: Save time before the mission starts.";
	values[]	= {0, 60, 120, 180, 240, 300, 360, 420, 480, 540, 600};
	texts[]		= {"None", "1 min", "2 min", "3 min (Default)", "4 min", "5 min", "6 min", "7 min", "8 min", "9 min", "10 min"};
	default		= 0;
};

class TTC_CORE_locations {
	title		= "Tactical Team Combat: Location for the mission.";
	values[]	= {-1, 0};
	texts[]		= {"Random (Default)", "Paros - Kalochori"};
	default		= 0;
};

class TTC_CORE_sectorPatterns {
	title		= "Tactical Team Combat: Pattern for the sectors (number, connections).";
	values[]	= {-1, 0, 1};
	texts[]		= {"Random (Default)", "7 Sectors", "9 Sectors"};
	default		= -1;
};