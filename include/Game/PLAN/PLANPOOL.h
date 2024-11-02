#ifndef _PLANPOOL_H_
#define _PLANPOOL_H_

#include "common.h"
#include "Game/PLAN/PLAN.h"

int PLANPOOL_AreTwoNodesConnected(PlanningNode *node1, PlanningNode *node2, PlanningNode *planningPool);
int PLANPOOL_NumberOfNodesOfType(PlanningNode *planningPool, char nodeType);
int PLANPOOL_NumberOfNodesOfSource(PlanningNode *planningPool, char nodeSource);

#endif
