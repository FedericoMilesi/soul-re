#include "common.h"
#include "Game/PLAN/PLANAPI.h"
#include "Game/PLAN/PLANPOOL.h"
#include "Game/MATH3D.h"

INCLUDE_ASM("asm/nonmatchings/Game/PLAN/PLAN", PLAN_CalcMinDistFromExistingNodes);

INCLUDE_ASM("asm/nonmatchings/Game/PLAN/PLAN", PLAN_UpdatePlanMkrNodes);

INCLUDE_ASM("asm/nonmatchings/Game/PLAN/PLAN", PLAN_UpdatePlayerNode);

INCLUDE_ASM("asm/nonmatchings/Game/PLAN/PLAN", PLAN_AddRandomNode);

void PLAN_DeleteRandomNode(PlanningNode *planningPool)
{
    PLANPOOL_DeleteNodeFromPool(PLANPOOL_GetFirstNodeOfSource(planningPool, 0), planningPool);
}

void PLAN_DeleteOutOfRangeNodesOfSource(PlanningNode *planningPool, Position *playerPos, int nodeSourceToCheck, long removeDist)
{
    int i;

    for (i = 0; i < poolManagementData->numNodesInPool; i++)
    {
        if (((planningPool[i].nodeType & 0x7) == nodeSourceToCheck) && (removeDist < MATH3D_LengthXYZ(playerPos->x - planningPool[i].pos.x, playerPos->y - planningPool[i].pos.y, playerPos->z - planningPool[i].pos.z)))
        {
            PLANPOOL_DeleteNodeFromPool(&planningPool[i], planningPool);
        }
    }
}

INCLUDE_ASM("asm/nonmatchings/Game/PLAN/PLAN", PLAN_AddOrRemoveRandomNodes);

INCLUDE_ASM("asm/nonmatchings/Game/PLAN/PLAN", PLAN_AddInitialNodes);

INCLUDE_ASM("asm/nonmatchings/Game/PLAN/PLAN", PLAN_AddOrRemoveNodes);

INCLUDE_ASM("asm/nonmatchings/Game/PLAN/PLAN", PLAN_FindNodeMostInNeedOfConnectivityExpansion);
