#ifndef _PLAN_H_
#define _PLAN_H_

#include "common.h"

void PLAN_AddRandomNode(PlanningNode *planningPool, Position *playerPos);
void PLAN_UpdatePlayerNode(PlanningNode *planningPool, Position *playerPos);
void PLAN_UpdatePlanMkrNodes(PlanningNode *planningPool, Position *playerPos);
void PLAN_AddInitialNodes(PlanningNode *planningPool, Instance *player);
void PLAN_AddOrRemoveNodes(PlanningNode *planningPool, Instance *player);
PlanningNode *PLAN_FindNodeMostInNeedOfConnectivityExpansion(PlanningNode *planningPool);
long PLAN_CalcMinDistFromExistingNodes(Position *pos, PlanningNode *planningPool, int distanceType);

#endif
