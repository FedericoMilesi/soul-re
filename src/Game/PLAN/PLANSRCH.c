#include "common.h"
#include "Game/PLAN/PLAN.h"
#include "Game/PLAN/PLANAPI.h"

INCLUDE_ASM("asm/nonmatchings/Game/PLAN/PLANSRCH", PLANSRCH_FindNodeToExpand);

INCLUDE_ASM("asm/nonmatchings/Game/PLAN/PLANSRCH", PLANSRCH_ExpandNode);

void PLANSRCH_InitNodesForSearch(PlanningNode *planningPool)
{
    int i;

    for (i = 0; i < poolManagementData->numNodesInPool; i++)
    {
        planningPool[i].cost = 0;

        planningPool[i].parent = 0;

        planningPool[i].flags &= ~0x3;
    }
}

INCLUDE_ASM("asm/nonmatchings/Game/PLAN/PLANSRCH", PLANSRCH_FindPathInGraph);
