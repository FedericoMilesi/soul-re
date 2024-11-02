#include "common.h"
#include "Game/PLAN/PLAN.h"
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

INCLUDE_ASM("asm/nonmatchings/Game/PLAN/PLANAPI", PLANAPI_DeleteNodeFromPoolByUnit);

INCLUDE_ASM("asm/nonmatchings/Game/PLAN/PLANAPI", PLANAPI_FindPathInGraphToTarget);

INCLUDE_ASM("asm/nonmatchings/Game/PLAN/PLANAPI", PLANAPI_InitPlanning);

INCLUDE_ASM("asm/nonmatchings/Game/PLAN/PLANAPI", PLANAPI_PairType);

INCLUDE_ASM("asm/nonmatchings/Game/PLAN/PLANAPI", PLANAPI_PassThroughHit);

INCLUDE_ASM("asm/nonmatchings/Game/PLAN/PLANAPI", PLANAPI_UpdatePlanningDatabase);

INCLUDE_ASM("asm/nonmatchings/Game/PLAN/PLANAPI", PLANAPI_NumNodesInPool);

INCLUDE_ASM("asm/nonmatchings/Game/PLAN/PLANAPI", PLANAPI_InitPlanMkrList);

INCLUDE_ASM("asm/nonmatchings/Game/PLAN/PLANAPI", PLANAPI_GetFlags);

INCLUDE_ASM("asm/nonmatchings/Game/PLAN/PLANAPI", PLANAPI_FindNodePositionInUnit);

INCLUDE_ASM("asm/nonmatchings/Game/PLAN/PLANAPI", PLANAPI_FindClosestNodePositionInUnit);
