#include "common.h"
#include "Game/PLAN/PLAN.h"
#include "Game/PLAN/PLANAPI.h"
#include "Game/PLAN/PLANPOOL.h"
#include "Game/PLAN/ENMYPLAN.h"
#include "Game/GAMELOOP.h"
#include "Game/TIMER.h"
#include "Game/MATH3D.h"
#include "Game/PLAN/PLANCOLL.h"

// static long timerArray[10];
long timerArray[10];

// static long timerIndex;
long timerIndex;

void PLANAPI_ConvertPlanIntoEnmyPlanDataFormat(PlanningNode *goalNode, EnemyPlanData *planData, PlanningNode *planningPool)
{
    PlanningNode *currentNode;
    int i;

    currentNode = goalNode;

    planData->numWayPoints = PLANPOOL_NumNodesInPlan(goalNode, planningPool);

    for (i = planData->numWayPoints - 1; i >= 0; i--)
    {
        if (i < 8)
        {
            planData->wayPointArray[i] = currentNode->pos;
            planData->nodeTypeArray[i] = currentNode->nodeType;
            planData->nodeSkipArray[i] = 0;
        }

        currentNode = &planningPool[currentNode->parent];
    }
}

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

int PLANAPI_FindPathInGraphToTarget(Position *startPos, EnemyPlanData *planData, int validNodeTypes)
{
    PlanningNode *planningPool;
    PlanningNode *startNode;

    planningPool = gameTrackerX.planningPool;

    startNode = PLANPOOL_GetNodeByPosition(startPos, planningPool);

    PLANAPI_FindPathBetweenNodes(startNode, PLANPOOL_GetFirstNodeOfSource(planningPool, 3), planData, validNodeTypes);
}

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

int PLANAPI_PassThroughHit(PlanningNode *node1, PlanningNode *node2)
{
    int src1;
    int src2;
    int res;

    if (gameTrackerX.gameFlags < 0)
    {
        src1 = node1->nodeType & 0x7;
        src2 = node2->nodeType & 0x7;

        if (src2 < src1)
        {
            src1 ^= src2;
            src2 ^= src1;
            src1 ^= src2;
        }

        res = (src1 << 8) | src2;

        if ((res == 260) || (res == 772) || (res == 516))
        {
            return 1;
        }
    }

    return 0;
}

INCLUDE_ASM("asm/nonmatchings/Game/PLAN/PLANAPI", PLANAPI_UpdatePlanningDatabase);

int PLANAPI_NumNodesInPool(void *planningPool)
{
    (void)planningPool;

    return poolManagementData->numNodesInPool;
}

void PLANAPI_InitPlanMkrList(StreamUnit *streamUnit)
{
    int i;
    int terrainFoundFlag;
    Level *level;
    unsigned short numPlanMkrs;
    PlanMkr *planMkrList;

    level = streamUnit->level;

    planMkrList = level->PlanMarkerList;

    numPlanMkrs = level->NumberOfPlanMarkers;

    if (planMkrList != NULL)
    {
        for (i = 0; i < numPlanMkrs; i++)
        {
            PlanCollideInfo pci;

            COPY_SVEC(Position, &pci.collidePos, Position, &planMkrList[i].pos);

            if (!(planMkrList[i].id & 0x5000))
            {
                if ((planMkrList[i].id & 0x8000))
                {
                    terrainFoundFlag = PLANCOLL_FindTerrainHitFinal(&pci, NULL, -256, 640, 1, 4);
                }
                else if ((planMkrList[i].id & 0x2000))
                {
                    terrainFoundFlag = PLANCOLL_FindTerrainHitFinal(&pci, NULL, -256, 640, 5, 5);
                }
                else
                {
                    terrainFoundFlag = PLANCOLL_FindTerrainHitFinal(&pci, NULL, 128, -1024, 0, 0);
                }

                if (terrainFoundFlag != 0)
                {
                    COPY_SVEC(Position, &planMkrList[i].pos, Position, &pci.collidePos);
                }
            }
        }
    }
}

INCLUDE_ASM("asm/nonmatchings/Game/PLAN/PLANAPI", PLANAPI_GetFlags);

INCLUDE_ASM("asm/nonmatchings/Game/PLAN/PLANAPI", PLANAPI_FindNodePositionInUnit);

INCLUDE_ASM("asm/nonmatchings/Game/PLAN/PLANAPI", PLANAPI_FindClosestNodePositionInUnit);
