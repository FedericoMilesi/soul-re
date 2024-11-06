#ifndef _PLAN_H_
#define _PLAN_H_

#include "common.h"

void PLAN_AddRandomNode(PlanningNode *planningPool, Position *playerPos);
void PLAN_UpdatePlayerNode(PlanningNode *planningPool, Position *playerPos);
void PLAN_UpdatePlanMkrNodes(PlanningNode *planningPool, Position *playerPos);

#endif
