/*
	Initializes all event handlers.
		
    Created by BauerMitFackel
*/


TTC_MED_dynamicBlur = ppEffectCreate ["DynamicBlur", 500];
TTC_MED_dynamicBlur ppEffectEnable true;
TTC_MED_dynamicBlur ppEffectAdjust [0.0];
TTC_MED_dynamicBlur ppEffectCommit 0.0;

TTC_MED_colorCorrections = ppEffectCreate ["colorCorrections", 1501];
TTC_MED_colorCorrections ppEffectEnable true;
TTC_MED_colorCorrections ppEffectCommit 0.0;