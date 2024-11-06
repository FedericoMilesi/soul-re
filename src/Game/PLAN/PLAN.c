#include "common.h"
#include "Game/PLAN/PLANPOOL.h"

INCLUDE_ASM("asm/nonmatchings/Game/PLAN/PLAN", PLAN_CalcMinDistFromExistingNodes);

INCLUDE_ASM("asm/nonmatchings/Game/PLAN/PLAN", PLAN_UpdatePlanMkrNodes);

INCLUDE_ASM("asm/nonmatchings/Game/PLAN/PLAN", PLAN_UpdatePlayerNode);

INCLUDE_ASM("asm/nonmatchings/Game/PLAN/PLAN", PLAN_AddRandomNode);

void PLAN_DeleteRandomNode(PlanningNode *planningPool)
{
    PLANPOOL_DeleteNodeFromPool(PLANPOOL_GetFirstNodeOfSource(planningPool, 0), planningPool);
}

INCLUDE_ASM("asm/nonmatchings/Game/PLAN/PLAN", PLAN_DeleteOutOfRangeNodesOfSource);

INCLUDE_ASM("asm/nonmatchings/Game/PLAN/PLAN", PLAN_AddOrRemoveRandomNodes);

INCLUDE_ASM("asm/nonmatchings/Game/PLAN/PLAN", PLAN_AddInitialNodes);

INCLUDE_ASM("asm/nonmatchings/Game/PLAN/PLAN", PLAN_AddOrRemoveNodes);

INCLUDE_ASM("asm/nonmatchings/Game/PLAN/PLAN", PLAN_FindNodeMostInNeedOfConnectivityExpansion);
