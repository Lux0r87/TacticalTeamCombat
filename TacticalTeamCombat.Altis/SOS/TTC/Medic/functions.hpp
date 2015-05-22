/*
    Created by BauerMitFackel
*/

class TTC_Medic {
	tag = "TTC_MED";
	
	class TTC_Medic_Initialization {
		
		class init {
			file = "SOS\TTC\Medic\init.sqf";
		};
		class preInit {
			preInit = 1;
			file = "SOS\TTC\Medic\preInit.sqf";
		};
	};
	
	class TTC_Medic_Functions {
		file = "SOS\TTC\Medic\Functions";
		
		class bleed{};
		class check{};
		class getBloodVolume{};
		class getBodyPartDamage{};
		class getVariableDescription{};
		class incapacitate{};
		class initializeActions{};
		class initializeDynamicBlur{};
		class initializeEventHandlers{};		
		class initializeVariables{};
		class isBleeding{};
		class isIncapacitated{};
		class setBleeding{};
		class setBloodVolume{};
		class setBodyPartDamage{};
		class setIncapacitated{};
	};

	class TTC_Medic_Functions_Actions {
		file = "SOS\TTC\Medic\Functions\Actions";
		
		class addAction_applyPressure{};
		class addAction_check{};
		class addAction_drag{};
		class addAction_examine{};
		class addAction_revive{};
		class addActions{};
	};
	
	class TTC_Medic_Functions_EventHandlers {
		file = "SOS\TTC\Medic\Functions\EventHandlers";
		
		class handleDamage{};
		class handleHit{};
	};
};
