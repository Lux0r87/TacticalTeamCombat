/*
	TTC Medic variables.
*/


// Constants
TTC_MED_const_BODY_PART_BODY		= "body";
TTC_MED_const_BODY_PART_HANDS		= "head_hit"; //"hands";
TTC_MED_const_BODY_PART_HEAD		= "head";
TTC_MED_const_BODY_PART_LEGS		= "hand_r"; //"legs";
TTC_MED_const_BODY_PART_OVERALL		= "";
TTC_MED_const_BODY_PART_UNKNOWN		= "?";

TTC_MED_const_BODY_PARTS = [
	TTC_MED_const_BODY_PART_BODY,
	TTC_MED_const_BODY_PART_HANDS,
	TTC_MED_const_BODY_PART_HEAD,
	TTC_MED_const_BODY_PART_LEGS
];

TTC_MED_const_HELMETS = [
	"H_HelmetB",
	"H_HelmetB_camo",
	"H_HelmetB_paint",
	"H_HelmetB_light",
	"H_HelmetB_plain_mcamo",
	"H_HelmetB_plain_blk",
	"H_HelmetSpecB",
	"H_HelmetSpecB_paint1",
	"H_HelmetSpecB_paint2",
	"H_HelmetSpecB_blk",
	"H_HelmetIA",
	"H_HelmetIA_net",
	"H_HelmetIA_camo",
	"H_Helmet_Kerry",
	"H_HelmetB_grass",
	"H_HelmetB_snakeskin",
	"H_HelmetB_desert",
	"H_HelmetB_black",
	"H_HelmetB_sand",
	"H_HelmetO_ocamo",
	"H_HelmetLeaderO_ocamo",
	"H_HelmetB_light_grass",
	"H_HelmetB_light_snakeskin",
	"H_HelmetB_light_desert",
	"H_HelmetB_light_black",
	"H_HelmetB_light_sand",
	"H_HelmetO_oucamo",
	"H_HelmetLeaderO_oucamo",
	"H_HelmetSpecO_ocamo",
	"H_HelmetSpecO_blk"
];

TTC_MED_const_HIT_SOUNDS_METAL = [
	"a3\sounds_f\weapons\hits\metal_1.wss", 
	"a3\sounds_f\weapons\hits\metal_2.wss", 
	"a3\sounds_f\weapons\hits\metal_3.wss", 
	"a3\sounds_f\weapons\hits\metal_4.wss", 
	"a3\sounds_f\weapons\hits\metal_5.wss", 
	"a3\sounds_f\weapons\hits\metal_6.wss"
];



// Variable names
TTC_MED_var_BLOOD_LOSS_PER_HEARTBEAT	= "TTC_MED_bloodLossPerHeartbeat";
TTC_MED_var_BLOOD_VOLUME				= "TTC_MED_bloodVolume";
TTC_MED_var_IS_BLEEDING					= "TTC_MED_isBleeding";
TTC_MED_var_IS_DRAGGED					= "TTC_MED_isDragged";
TTC_MED_var_IS_INCAPACITATED			= "TTC_MED_isIincapacitated";
TTC_MED_var_IS_INCAPACITATED_BY			= "TTC_MED_isIincapacitatedBy";
TTC_MED_var_IS_TREATED					= "TTC_MED_isTreated";
TTC_MED_var_IS_TREATING					= "TTC_MED_isTreating";


// Variables
TTC_MED_debug						= true;
TTC_MED_damagePerBodyPart			= [0, 0, 0, 0, 0, 0];
TTC_MED_dynamicBlur					= nil;
TTC_MED_colorCorrections			= nil;
