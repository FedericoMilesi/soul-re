#include "common.h"
#include "Game/PLAN/PLAN.h"
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

void PLAN_AddOrRemoveRandomNodes(PlanningNode *planningPool, Position *playerPos)
{
    int numNodeError;

    numNodeError = poolManagementData->numNodesInPool - 16;

    if (numNodeError < 0)
    {
        PLAN_AddRandomNode(planningPool, playerPos);
    }
    else if (numNodeError > 0)
    {
        PLAN_DeleteRandomNode(planningPool);
    }
}

INCLUDE_ASM("asm/nonmatchings/Game/PLAN/PLAN", PLAN_AddInitialNodes);

void PLAN_AddOrRemoveNodes(PlanningNode *planningPool, Instance *player)
{
    if (MATH3D_LengthXYZ(player->position.x - poolManagementData->playerPosAtLastPlanMkrUpdate.x, player->position.y - poolManagementData->playerPosAtLastPlanMkrUpdate.y, player->position.z - poolManagementData->playerPosAtLastPlanMkrUpdate.z) > 500)
    {
        PLAN_UpdatePlayerNode(planningPool, &player->position);
        PLAN_UpdatePlanMkrNodes(planningPool, &player->position);

        PLAN_DeleteOutOfRangeNodesOfSource(planningPool, &player->position, 0, 12000);
        PLAN_DeleteOutOfRangeNodesOfSource(planningPool, &player->position, 2, 12000);
        PLAN_DeleteOutOfRangeNodesOfSource(planningPool, &player->position, 3, 12000);

        poolManagementData->playerPosAtLastPlanMkrUpdate = player->position;
    }

    PLAN_AddOrRemoveRandomNodes(planningPool, &player->position);
}

INCLUDE_ASM("asm/nonmatchings/Game/PLAN/PLAN", PLAN_FindNodeMostInNeedOfConnectivityExpansion);
