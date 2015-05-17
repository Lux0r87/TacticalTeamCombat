/*
	Defines the sector variables.

	Created by Lux0r
*/


#define TTC_CTI_sectorVariable_name(SECTOR)					SECTOR getVariable ["TTC_CTI_sector_name", ""]
#define TTC_CTI_sectorVariable_dir(SECTOR)					SECTOR getVariable ["TTC_CTI_sector_dir", 0]
#define TTC_CTI_sectorVariable_axisA(SECTOR)				SECTOR getVariable ["TTC_CTI_sector_axisA", 0]
#define TTC_CTI_sectorVariable_axisB(SECTOR)				SECTOR getVariable ["TTC_CTI_sector_axisB", 0]
#define TTC_CTI_sectorVariable_rectangle(SECTOR)			SECTOR getVariable ["TTC_CTI_sector_rectangle", false]
#define TTC_CTI_sectorVariable_markerArea(SECTOR)			SECTOR getVariable ["TTC_CTI_sector_markerArea", ""]
#define TTC_CTI_sectorVariable_marker(SECTOR)				SECTOR getVariable ["TTC_CTI_sector_marker", ""]
#define TTC_CTI_sectorVariable_side(SECTOR)					SECTOR getVariable ["TTC_CTI_sector_side", sideUnknown]
#define TTC_CTI_sectorVariable_dominance(SECTOR)			SECTOR getVariable ["TTC_CTI_sector_dominance", 0]
#define TTC_CTI_sectorVariable_respawnDir(SECTOR)			SECTOR getVariable ["TTC_CTI_sector_respawnDir", []]
#define TTC_CTI_sectorVariable_type(SECTOR)					SECTOR getVariable ["TTC_CTI_sector_type", 0]
#define TTC_CTI_sectorVariable_objectDir(SECTOR)			SECTOR getVariable ["TTC_CTI_sector_objectDir", 0]
#define TTC_CTI_sectorVariable_patrolTypes(SECTOR)			SECTOR getVariable ["TTC_CTI_sector_patrolTypes", []]
#define TTC_CTI_sectorVariable_patrol(SECTOR)				SECTOR getVariable ["TTC_CTI_sector_patrol", grpNull]
#define TTC_CTI_sectorVariable_corpses(SECTOR)				SECTOR getVariable ["TTC_CTI_sector_corpses", []]
#define TTC_CTI_sectorVariable_flag(SECTOR)					SECTOR getVariable ["TTC_CTI_sector_flag", objNull]
#define TTC_CTI_sectorVariable_vehicle(SECTOR)				SECTOR getVariable ["TTC_CTI_sector_vehicle", objNull]
#define TTC_CTI_sectorVariable_neighbours(SECTOR)			SECTOR getVariable ["TTC_CTI_sector_neighbours", []]
#define TTC_CTI_sectorVariable_isConnectedToBase(SECTOR)	SECTOR getVariable ["TTC_CTI_sector_isConnectedToBase", false]
#define TTC_CTI_sectorVariable_visibility(SECTOR)			SECTOR getVariable ["TTC_CTI_sector_visibility", []]
#define TTC_CTI_sectorVariable_task(SECTOR)					SECTOR getVariable ["TTC_CTI_sector_task", taskNull]
