/*
	Defines different checks for the sectors.

	Created by Lux0r
*/


#include "dominanceVariables.inc"
#include "sectorVariables.inc"

#define TTC_CTI_unitSide(UNIT)						(side UNIT)
#define TTC_CTI_isSectorDominanceMax(SECTOR)		(TTC_CTI_sectorVariable_dominance(SECTOR) == TTC_CTI_dominanceMax)
#define TTC_CTI_unitControlsSector(SECTOR, UNIT)	(TTC_CTI_unitSide(UNIT)	 == TTC_CTI_sectorVariable_side(SECTOR))
#define TTC_CTI_enemyControlsSector(SECTOR, UNIT)	(TTC_CTI_unitSide(UNIT)	 != TTC_CTI_sectorVariable_side(SECTOR))
#define TTC_CTI_unitDominatesSector(SECTOR, UNIT)	(TTC_CTI_unitControlsSector(SECTOR, UNIT) && TTC_CTI_isSectorDominanceMax(SECTOR))