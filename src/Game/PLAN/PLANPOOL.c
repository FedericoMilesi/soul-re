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

int PLANPOOL_AppropriatePair(PlanningNode *node1, PlanningNode *node2)
{
    PlanningNode *temp;
    int res;
    int src;
    int plc;
    short type1;
    short type2;
    short placement1;
    short placement2;
    short source1;
    short source2;

    type1 = node1->nodeType;
    type2 = node2->nodeType;

    placement1 = (type1 >> 3) & 0x3;
    placement2 = (type2 >> 3) & 0x3;

    source1 = type1 & 0x7;
    source2 = type2 & 0x7;

    if (placement2 < placement1)
    {
        placement1 ^= placement2;
        placement2 ^= placement1;
        placement1 ^= placement2;

        temp = node1;
        node1 = node2;
        node2 = temp;
    }

    if (source2 < source1)
    {
        source1 ^= source2;
        source2 ^= source1;
        source1 ^= source2;
    }

    plc = placement2 | (placement1 << 8);
    src = source2 | (source1 << 8);

    res = 1;

    switch (plc)
    {
    case 2:
        res = 0;
        break;
    case 3:
        if (src != 1028)
        {
            res = 0;
        }

        break;
    case 1:
    case 258:
        if ((src != 1028) || (node1->pos.z >= node2->pos.z) || (node2->pos.z >= (node1->pos.z + 800)) || (MATH3D_LengthXY(node1->pos.x - node2->pos.x, node1->pos.y - node2->pos.y) > 800))
        {
            res = 0;
        }

        break;
    case 259:
        res = 0;
        break;
    case 515:
        res = 0;
        break;
    }

    return res;
}

int PLANPOOL_AreTwoNodesConnected(PlanningNode *node1, PlanningNode *node2, PlanningNode *planningPool)
{
    long node2Mask;

    node2Mask = 1 << (node2 - planningPool);

    if (((node1->connectionStatus & node2Mask)) && ((node1->connections & node2Mask)))
    {
        return 1;
    }

    return 0;
}

void PLANPOOL_MarkTwoNodesAsConnected(PlanningNode *node1, PlanningNode *node2, PlanningNode *planningPool)
{
    int node1Index;
    int node2Index;
    int temp; // not from decls.h

    node1Index = node1 - planningPool;
    node2Index = node2 - planningPool;

    temp = MATH3D_DistanceBetweenPositions(&node1->pos, &node2->pos);

    if (temp < 0)
    {
        temp = 0;
    }

    if (temp > 65536)
    {
        temp = 65536;
    }

    poolManagementData->distanceMatrix[node1Index][node2Index] = temp;

    node1->connectionStatus |= 1 << node2Index;
    node1->connections |= 1 << node2Index;
}

void PLANPOOL_MarkTwoNodesAsNotConnected(PlanningNode *node1, PlanningNode *node2, PlanningNode *planningPool)
{
    node1->connectionStatus |= 1 << (node2 - planningPool);
    node1->connections &= ~(1 << (node2 - planningPool));
}

PlanningNode *PLANPOOL_GetClosestUnexploredValidNeighbor(PlanningNode *startNode, PlanningNode *planningPool)
{
    int i;
    unsigned long connectionStatus;
    unsigned long dist;
    unsigned long minDist;
    PlanningNode *returnNode;

    minDist = -1;

    returnNode = NULL;

    if (startNode == NULL)
    {
        return NULL;
    }

    connectionStatus = startNode->connectionStatus;

    for (i = 0; i < poolManagementData->numNodesInPool; i++)
    {
        if (!(connectionStatus & 0x1))
        {
            if (PLANPOOL_AppropriatePair(startNode, &planningPool[i]) != 0)
            {
                dist = MATH3D_LengthXYZ(startNode->pos.x - planningPool[i].pos.x, startNode->pos.y - planningPool[i].pos.y, startNode->pos.z - planningPool[i].pos.z);

                if (dist < minDist)
                {
                    minDist = dist;

                    returnNode = &planningPool[i];
                }
            }
            else
            {
                PLANPOOL_MarkTwoNodesAsNotConnected(startNode, &planningPool[i], planningPool);
            }
        }

        connectionStatus >>= 1;
    }

    return returnNode;
}

void PLANPOOL_ChangeNodePosition(Position *newPos, PlanningNode *nodeToChange, PlanningNode *planningPool)
{
    int i;
    unsigned char nodeToChangeMask;
    int temp; // not from decls.h

    temp = nodeToChange - planningPool;

    if (nodeToChange != NULL)
    {
        nodeToChange->pos = *newPos;

        nodeToChange->connectionStatus = 0;
        nodeToChange->connections = 0;

        nodeToChangeMask = 1 << temp;

        for (i = 0; i < poolManagementData->numNodesInPool; i++)
        {
            planningPool[i].connectionStatus &= ~nodeToChangeMask;
            planningPool[i].connections &= ~nodeToChangeMask;
        }
    }
}

INCLUDE_ASM("asm/nonmatchings/Game/PLAN/PLANPOOL", PLANPOOL_AddNodeToPool);

INCLUDE_ASM("asm/nonmatchings/Game/PLAN/PLANPOOL", PLANPOOL_DeleteNodeFromPool);
