#include "common.h"
#include "Game/PLAN/PLAN.h"
#include "Game/PLAN/PLANAPI.h"
#include "Game/MATH3D.h"

int PLANPOOL_NumNodesInPlan(PlanningNode *goalNode, PlanningNode *planningPool)
{
    PlanningNode *currentNode;
    int i;

    for (i = 0, currentNode = &planningPool[goalNode->parent]; goalNode != currentNode; i++)
    {
        goalNode = &planningPool[goalNode->parent];
        currentNode = &planningPool[goalNode->parent];
    }

    return i + 1;
}

int PLANPOOL_CountBitsSetInLong(long mylong)
{
    int numBitsSet;

    for (numBitsSet = 0; mylong != 0; numBitsSet++)
    {
        mylong &= mylong - 1;
    }

    return numBitsSet;
}

int PLANPOOL_NumConnectionsExaminedForNode(PlanningNode *node)
{
    return PLANPOOL_CountBitsSetInLong(node->connectionStatus);
}

int PLANPOOL_NumConnectionsForNode(PlanningNode *node)
{
    return PLANPOOL_CountBitsSetInLong(node->connections);
}

// Matches 100% on decomp.me but differs on this project
#ifndef NON_MATCHING
INCLUDE_ASM("asm/nonmatchings/Game/PLAN/PLANPOOL", PLANPOOL_GetFirstNodeOfSource);
#else
PlanningNode *PLANPOOL_GetFirstNodeOfSource(PlanningNode *planningPool, char nodeSource)
{
    int i;

    for (i = 0; i < poolManagementData->numNodesInPool; i++, planningPool++)
    {
        if ((planningPool->nodeType & 0x7) == nodeSource)
        {
            return planningPool;
        }
    }

    return NULL;
}
#endif

// Matches 100% on decomp.me but differs on this project
#ifndef NON_MATCHING
INCLUDE_ASM("asm/nonmatchings/Game/PLAN/PLANPOOL", PLANPOOL_NumberOfNodesOfType);
#else
int PLANPOOL_NumberOfNodesOfType(PlanningNode *planningPool, char nodeType)
{
    int i;
    int numNodesOfType;

    numNodesOfType = 0;

    for (i = 0; i < poolManagementData->numNodesInPool; i++, planningPool++)
    {
        if (planningPool->nodeType == nodeType)
        {
            numNodesOfType++;
        }
    }

    return numNodesOfType;
}
#endif

// Matches 100% on decomp.me but differs on this project
#ifndef NON_MATCHING
INCLUDE_ASM("asm/nonmatchings/Game/PLAN/PLANPOOL", PLANPOOL_NumberOfNodesOfSource);
#else
int PLANPOOL_NumberOfNodesOfSource(PlanningNode *planningPool, char nodeSource)
{
    int i;
    int numNodesOfSource;

    numNodesOfSource = 0;

    for (i = 0; i < poolManagementData->numNodesInPool; i++, planningPool++)
    {
        if ((planningPool->nodeType & 0x7) == nodeSource)
        {
            numNodesOfSource++;
        }
    }

    return numNodesOfSource;
}
#endif

PlanningNode *PLANPOOL_GetNodeWithID(PlanningNode *planningPool, int type, int id, long suID)
{
    int i;

    for (i = 0; i < poolManagementData->numNodesInPool; i++)
    {
        if ((planningPool[i].nodeType == type) && (planningPool[i].id == id) && (planningPool[i].streamUnitID == suID))
        {
            return &planningPool[i];
        }
    }

    return NULL;
}

PlanningNode *PLANPOOL_GetNodeByPosition(Position *currentPos, PlanningNode *planningPool)
{
    int i;
    unsigned long zDiff;
    unsigned long minZDiff;
    PlanningNode *returnNode;

    minZDiff = -1;

    returnNode = NULL;

    for (i = 0; i < poolManagementData->numNodesInPool; i++)
    {
        if (MATH3D_LengthXY(currentPos->x - planningPool[i].pos.x, currentPos->y - planningPool[i].pos.y) < 11)
        {
            zDiff = abs(currentPos->z - planningPool[i].pos.z);

            if (zDiff < minZDiff)
            {
                returnNode = &planningPool[i];
            }
        }
    }

    return returnNode;
}

// Matches 100% on decomp.me but differs on this project
#ifndef NON_MATCHING
INCLUDE_ASM("asm/nonmatchings/Game/PLAN/PLANPOOL", PLANPOOL_GetClosestNode);
#else
PlanningNode *PLANPOOL_GetClosestNode(Position *pos, PlanningNode *planningPool, char distanceType)
{
    int i;
    long dist;
    long minDist;
    PlanningNode *closestNode;

    minDist = 0x7FFFFFFF;

    closestNode = NULL;

    for (i = 0; i < poolManagementData->numNodesInPool; i++)
    {
        if (distanceType == 0)
        {
            dist = MATH3D_LengthXY(pos->x - planningPool[i].pos.x, pos->y - planningPool[i].pos.y);
        }
        else
        {
            dist = MATH3D_LengthXYZ(pos->x - planningPool[i].pos.x, pos->y - planningPool[i].pos.y, pos->z - planningPool[i].pos.z);
        }

        if (dist < minDist)
        {
            minDist = dist;

            closestNode = &planningPool[i];
        }
    }

    return closestNode;
}
#endif

INCLUDE_ASM("asm/nonmatchings/Game/PLAN/PLANPOOL", PLANPOOL_AppropriatePair);

INCLUDE_ASM("asm/nonmatchings/Game/PLAN/PLANPOOL", PLANPOOL_AreTwoNodesConnected);

void PLANPOOL_MarkTwoNodesAsConnected(PlanningNode *node1, PlanningNode *node2, PlanningNode *planningPool)
{
    int node1Index;
    int node2Index;

    node1Index = node1 - planningPool;
    node2Index = node2 - planningPool;

    poolManagementData->distanceMatrix[node1Index][node2Index] = clamp(MATH3D_DistanceBetweenPositions(&node1->pos, &node2->pos), 0, 65536);

    node1->connectionStatus |= 1 << node2Index;
    node1->connections |= 1 << node2Index;
}

void PLANPOOL_MarkTwoNodesAsNotConnected(PlanningNode *node1, PlanningNode *node2, PlanningNode *planningPool)
{
    node1->connectionStatus |= 1 << (node2 - planningPool);
    node1->connections &= ~(1 << (node2 - planningPool));
}

INCLUDE_ASM("asm/nonmatchings/Game/PLAN/PLANPOOL", PLANPOOL_GetClosestUnexploredValidNeighbor);

INCLUDE_ASM("asm/nonmatchings/Game/PLAN/PLANPOOL", PLANPOOL_ChangeNodePosition);

INCLUDE_ASM("asm/nonmatchings/Game/PLAN/PLANPOOL", PLANPOOL_AddNodeToPool);

INCLUDE_ASM("asm/nonmatchings/Game/PLAN/PLANPOOL", PLANPOOL_DeleteNodeFromPool);
