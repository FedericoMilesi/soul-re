#ifndef _PLANSRCH_H_
#define _PLANSRCH_H_

#include "common.h"
#include "Game/PLAN/PLAN.h"

void PLANSRCH_ExpandNode(PlanningNode *planningPool, PlanningNode *nodeToExpand);
PlanningNode *PLANSRCH_FindNodeToExpand(PlanningNode *planningPool, PlanningNode *goalNode, int validNodeTypes);
PlanningNode *PLANSRCH_FindPathInGraph(PlanningNode *planningPool, PlanningNode *startNode, PlanningNode *goalNode, int validNodeTypes);

#endif
