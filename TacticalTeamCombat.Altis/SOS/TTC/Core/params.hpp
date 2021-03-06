class TTC_CORE_safetyTime {
	title		= "Tactical Team Combat: Safety time before the mission starts.";
	values[]	= {0, 60, 120, 180, 240, 300, 360, 420, 480, 540, 600};
	texts[]		= {"None", "1 min", "2 min", "3 min (Default)", "4 min", "5 min", "6 min", "7 min", "8 min", "9 min", "10 min"};
	default		= 180;
};

class TTC_CORE_locations {
	title		= "Tactical Team Combat: Location for the mission.";
	values[]	= {-1, 0, 1, 2};
	texts[]		= {"Random (Default)", "Panochori", "Delfinaki - Ioannina", "Thronos - Oreokastro"};
	default		= -1;
};

class TTC_CORE_sectorPatterns {
	title		= "Tactical Team Combat: Pattern for the sectors (number, connections).";
	values[]	= {-1, 0, 1};
	texts[]		= {"Random (Default)", "7 Sectors", "9 Sectors"};
	default		= -1;
};

class TTC_CORE_DisableThermal {
	title		= "Tactical Team Combat: Disable thermal imaging for vehicles?";
	values[]	= {1, 0};
	texts[]		= {"Yes (Default)", "No"};
	default		= 1;
};

class TTC_CORE_fatigueReduction {
	title		= "Tactical Team Combat: Fatigue system.";
	values[]	= {0, 10, 20, 30};
	texts[]		= {"Arma", "Hard", "Medium (Default)", "Easy"};
	default		= 20;
};
