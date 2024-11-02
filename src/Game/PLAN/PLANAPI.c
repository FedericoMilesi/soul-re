#include "common.h"
#include "Game/PLAN/PLAN.h"
#include "Game/PLAN/PLANAPI.h"
#include "Game/PLAN/PLANPOOL.h"
#include "Game/GAMELOOP.h"
#include "Game/TIMER.h"

// static long timerArray[10];
long timerArray[10];

// static long timerIndex;
long timerIndex;

INCLUDE_ASM("asm/nonmatchings/Game/PLAN/PLANAPI", PLANAPI_ConvertPlanIntoEnmyPlanDataFormat);

INCLUDE_ASM("asm/nonmatchings/Game/PLAN/PLANAPI", PLANAPI_FindPathBetweenNodes);

void PLANAPI_DoTimingCalcsAndDrawing(long startTime, PlanningNode *planningPool)
{
    int i;
    long minTime;
    long maxTime;

    minTime = 0x7FFFFFFF;
    maxTime = 0;

    timerArray[timerIndex] = TIMER_TimeDiff(startTime);

    for (i = 0; i < 10; i++)
    {
        if (timerArray[i] < minTime)
        {
            minTime = timerArray[i];
        }

        if (timerArray[i] > maxTime)
        {
            maxTime = timerArray[i];
        }
    }

    timerIndex++;

    if (timerIndex >= 10)
    {
        timerIndex = 0;
    }

    if ((gameTrackerX.debugFlags2 & 0x10))
    {
        PLANPOOL_NumberOfNodesOfType(planningPool, 4);
        PLANPOOL_NumberOfNodesOfType(planningPool, 12);
        PLANPOOL_NumberOfNodesOfType(planningPool, 20);
        PLANPOOL_NumberOfNodesOfType(planningPool, 28);

        PLANPOOL_NumberOfNodesOfSource(planningPool, 0);
        PLANPOOL_NumberOfNodesOfSource(planningPool, 2);
        PLANPOOL_NumberOfNodesOfSource(planningPool, 3);
        PLANPOOL_NumberOfNodesOfSource(planningPool, 1);
    }
}

INCLUDE_ASM("asm/nonmatchings/Game/PLAN/PLANAPI", PLANAPI_AddNodeOfTypeToPool);

INCLUDE_ASM("asm/nonmatchings/Game/PLAN/PLANAPI", PLANAPI_DeleteNodesFromPoolByType);

void PLANAPI_DeleteNodeFromPoolByUnit(long streamUnitID)
{
    PlanningNode *nodeToDelete;
    PlanningNode *planningPool;
    int i;

    nodeToDelete = (PlanningNode *)gameTrackerX.planningPool;
    planningPool = (PlanningNode *)gameTrackerX.planningPool;

    for (i = 0; i < poolManagementData->numNodesInPool;)
    {
        if (nodeToDelete->streamUnitID == streamUnitID)
        {
            PLANPOOL_DeleteNodeFromPool(nodeToDelete, planningPool);
        }
        else
        {
            i++;
            nodeToDelete++;
        }
    }
}

INCLUDE_ASM("asm/nonmatchings/Game/PLAN/PLANAPI", PLANAPI_FindPathInGraphToTarget);

INCLUDE_ASM("asm/nonmatchings/Game/PLAN/PLANAPI", PLANAPI_InitPlanning);

short PLANAPI_PairType(PlanningNode *node1, PlanningNode *node2)
{
    short placement1;
    short placement2;

    placement1 = (node1->nodeType >> 3) & 0x3;
    placement2 = (node2->nodeType >> 3) & 0x3;

    if (placement2 < placement1)
    {
        placement1 ^= placement2;
        placement2 ^= placement1;
        placement1 ^= placement2;
    }

    return placement2 | (placement1 << 8);
}

INCLUDE_ASM("asm/nonmatchings/Game/PLAN/PLANAPI", PLANAPI_PassThroughHit);

INCLUDE_ASM("asm/nonmatchings/Game/PLAN/PLANAPI", PLANAPI_UpdatePlanningDatabase);

INCLUDE_ASM("asm/nonmatchings/Game/PLAN/PLANAPI", PLANAPI_NumNodesInPool);

INCLUDE_ASM("asm/nonmatchings/Game/PLAN/PLANAPI", PLANAPI_InitPlanMkrList);

INCLUDE_ASM("asm/nonmatchings/Game/PLAN/PLANAPI", PLANAPI_GetFlags);

INCLUDE_ASM("asm/nonmatchings/Game/PLAN/PLANAPI", PLANAPI_FindNodePositionInUnit);

INCLUDE_ASM("asm/nonmatchings/Game/PLAN/PLANAPI", PLANAPI_FindClosestNodePositionInUnit);
