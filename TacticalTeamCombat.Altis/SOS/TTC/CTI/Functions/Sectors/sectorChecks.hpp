/*
	Defines different checks for the sectors.

	Created by Lux0r
*/


#include "dominanceVariables.hpp"
#include "sectorVariables.hpp"

#define TTC_CTI_unitSide (side _unit)
#define TTC_CTI_isSectorDominanceMax (TTC_CTI_sectorVariable_dominance == TTC_CTI_dominanceMax)
#define TTC_CTI_unitControlsSector (TTC_CTI_unitSide == TTC_CTI_sectorVariable_side)
#define TTC_CTI_enemyControlsSector (TTC_CTI_unitSide != TTC_CTI_sectorVariable_side)
#define TTC_CTI_unitDominatesSector (TTC_CTI_unitControlsSector && TTC_CTI_isSectorDominanceMax)