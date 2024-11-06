#include "common.h"
#include "Game/PLAN/PLAN.h"
#include "Game/PLAN/PLANAPI.h"
#include "Game/PLAN/PLANPOOL.h"
#include "Game/PLAN/ENMYPLAN.h"
#include "Game/PLAN/PLANSRCH.h"
#include "Game/GAMELOOP.h"
#include "Game/TIMER.h"
#include "Game/MATH3D.h"
#include "Game/PLAN/PLANCOLL.h"

STATIC long timerArray[10];

STATIC long timerIndex;

STATIC PoolManagementData poolManagementDataStorage;

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

int PLANAPI_FindPathBetweenNodes(PlanningNode *startNode, PlanningNode *goalNode, EnemyPlanData *planData, int validNodeTypes)
{
    PlanningNode *planningPool;
    int successFlag;
    PlanningNode *temp; // not from decls.h

    planningPool = gameTrackerX.planningPool;

    successFlag = 0;

    if ((startNode != NULL) && (goalNode != NULL))
    {
        temp = PLANSRCH_FindPathInGraph(planningPool, startNode, goalNode, validNodeTypes);

        if (temp != NULL)
        {
            PLANAPI_ConvertPlanIntoEnmyPlanDataFormat(temp, planData, planningPool);

            successFlag = 1;

            planData->goalUnitID = temp->streamUnitID;
        }
    }

    return successFlag;
}

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

void PLANAPI_DeleteNodesFromPoolByType(int nodeSource)
{
    PlanningNode *planningPool;
    PlanningNode *nodeToDelete;
    int i;

    planningPool = nodeToDelete = gameTrackerX.planningPool;

    for (i = 0; i < poolManagementData->numNodesInPool;)
    {
        if ((nodeToDelete->nodeType & 0x7) == nodeSource)
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

void PLANAPI_DeleteNodeFromPoolByUnit(long streamUnitID)
{
    PlanningNode *nodeToDelete;
    PlanningNode *planningPool;
    int i;

    nodeToDelete = planningPool = (PlanningNode *)gameTrackerX.planningPool;

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

void PLANAPI_InitPlanning(void *planningPool)
{
    int i;
    int j;

    poolManagementData = &poolManagementDataStorage;

    poolManagementData->state = 0;

    poolManagementData->numNodesInPool = 0;

    poolManagementData->distanceMatrix = (unsigned short(*)[32])((intptr_t)planningPool + (sizeof(PlanningNode) * 32));

    for (i = 0; i < 32; i++)
    {
        for (j = 0; j < 32; j++)
        {
            poolManagementData->distanceMatrix[i][j] = 0;
        }
    }

    for (i = 0; i < 10; i++)
    {
        timerArray[i] = 0;
    }

    timerIndex = 0;
}

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

// Matches 100% on decomp.me but differs on this project
#ifndef NON_MATCHING
INCLUDE_ASM("asm/nonmatchings/Game/PLAN/PLANAPI", PLANAPI_UpdatePlanningDatabase);
#else
void PLANAPI_UpdatePlanningDatabase(GameTracker *gameTracker, Instance *player)
{
    PlanningNode *planningPool;
    PlanningNode *node1;
    PlanningNode *node2;
    long startTime;
    int pathExistsAbove;
    int pathExistsBelow;

    planningPool = (PlanningNode *)gameTracker->planningPool;

    startTime = (GetRCnt(0xF2000000) & 0xFFFF) | (gameTimer << 16);

    gameTrackerX.plan_collide_override = 1;

    switch (poolManagementData->state)
    {
    case 0:
        PLAN_AddInitialNodes(planningPool, player);

        poolManagementData->state = 1;
        break;
    case 1:
        PLAN_AddOrRemoveNodes(planningPool, player);

        poolManagementData->state = 2;
        break;
    case 2:
        node1 = PLAN_FindNodeMostInNeedOfConnectivityExpansion(planningPool);
        node2 = PLANPOOL_GetClosestUnexploredValidNeighbor(node1, planningPool);

        poolManagementData->state = 1;

        if ((node1 == NULL) || (node2 == NULL))
        {
            break;
        }

        if (MATH3D_LengthXYZ(node1->pos.x - node2->pos.x, node1->pos.y - node2->pos.y, node1->pos.z - node2->pos.z) < 6000)
        {
            poolManagementData->pairType = PLANAPI_PairType(node1, node2);

            switch (poolManagementData->pairType)
            {
            case 0:
            case 514:
                pathExistsAbove = PLANCOLL_DoesLOSExistFinal(&node1->pos, &node2->pos, 0, PLANAPI_PassThroughHit(node1, node2), 256);
                pathExistsBelow = PLANCOLL_DoesLOSExistFinal(&node1->pos, &node2->pos, 0, PLANAPI_PassThroughHit(node1, node2), -256);
                break;
            case 3:
                if (((node1->nodeType >> 3) & 0x3) == poolManagementData->pairType)
                {
                    PlanningNode *temp;

                    temp = node1;
                    node1 = node2;
                    node2 = temp;
                }

                pathExistsAbove = PLANCOLL_DoesWaterPathUpExist(&node1->pos, &node2->pos, 0, &poolManagementData->peakPos, PLANAPI_PassThroughHit(node1, node2));
                pathExistsBelow = PLANCOLL_DoesLOSExistFinal(&node2->pos, &poolManagementData->peakPos, 0, PLANAPI_PassThroughHit(node1, node2), 0);
                break;
            default:
                pathExistsAbove = pathExistsBelow = PLANCOLL_DoesLOSExistFinal(&node1->pos, &node2->pos, 0, PLANAPI_PassThroughHit(node1, node2), 0);
            }

            poolManagementData->expansionNode1 = node1;
            poolManagementData->expansionNode2 = node2;

            if ((pathExistsAbove != 0) && (pathExistsBelow != 0))
            {
                PLANPOOL_MarkTwoNodesAsConnected(node1, node2, planningPool);
            }
            else
            {
                PLANPOOL_MarkTwoNodesAsNotConnected(node1, node2, planningPool);
            }

            poolManagementData->state = 3;
            break;
        }

        PLANPOOL_MarkTwoNodesAsNotConnected(node1, node2, planningPool);
        PLANPOOL_MarkTwoNodesAsNotConnected(node2, node1, planningPool);
        break;
    case 3:
        node1 = poolManagementData->expansionNode1;
        node2 = poolManagementData->expansionNode2;

        switch (poolManagementData->pairType)
        {
        case 0:
        case 514:
            pathExistsAbove = PLANCOLL_DoesLOSExistFinal(&node2->pos, &node1->pos, 0, PLANAPI_PassThroughHit(node2, node1), 256);
            pathExistsBelow = PLANCOLL_DoesLOSExistFinal(&node2->pos, &node1->pos, 0, PLANAPI_PassThroughHit(node2, node1), -256);
            break;
        case 3:
            pathExistsAbove = PLANCOLL_DoesWaterPathUpExist(&node2->pos, &node1->pos, 0, &poolManagementData->peakPos, PLANAPI_PassThroughHit(node2, node1));
            pathExistsBelow = PLANCOLL_DoesLOSExistFinal(&node1->pos, &poolManagementData->peakPos, 0, PLANAPI_PassThroughHit(node2, node1), 0);
            break;
        default:
            pathExistsAbove = pathExistsBelow = PLANCOLL_DoesLOSExistFinal(&node2->pos, &node1->pos, 0, PLANAPI_PassThroughHit(node2, node1), 0);
        }

        if ((pathExistsAbove != 0) && (pathExistsBelow != 0))
        {
            PLANPOOL_MarkTwoNodesAsConnected(node2, node1, planningPool);
        }
        else
        {
            PLANPOOL_MarkTwoNodesAsNotConnected(node2, node1, planningPool);
        }

        poolManagementData->state = 1;
        break;
    default:
        poolManagementData->state = 1;
    }

    PLANAPI_DoTimingCalcsAndDrawing(startTime, planningPool);

    gameTrackerX.plan_collide_override = 0;
}
#endif

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

int PLANAPI_GetFlags(int type)
{
    int chk;

    switch (type)
    {
    case 20:
        chk = 0x2000;
        break;
    case 28:
        chk = 0x4000;
        break;
    case 12:
        chk = 0x8000;
        break;
    case 5:
        chk = 0x1000;
        break;
    default:
        chk = 0;
    }

    return chk;
}

int PLANAPI_FindNodePositionInUnit(StreamUnit *streamUnit, Position *pos, int id, int type)
{
    Level *level;
    int numPlanMkrs;
    PlanMkr *planMkr;
    int i;

    if (streamUnit != NULL)
    {
        level = streamUnit->level;

        planMkr = level->PlanMarkerList;

        numPlanMkrs = level->NumberOfPlanMarkers;

        id |= PLANAPI_GetFlags(type);

        for (i = numPlanMkrs; i != 0; planMkr++, i--)
        {
            if (planMkr->id == id)
            {
                COPY_SVEC(Position, pos, Position, &planMkr->pos);

                return 1;
            }
        }
    }

    return 0;
}

INCLUDE_ASM("asm/nonmatchings/Game/PLAN/PLANAPI", PLANAPI_FindClosestNodePositionInUnit);
