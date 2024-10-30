#include "common.h"
#include "Game/PLAN/PLAN.h"
#include "Game/PLAN/PLANAPI.h"

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

INCLUDE_ASM("asm/nonmatchings/Game/PLAN/PLANPOOL", PLANPOOL_NumberOfNodesOfSource);

INCLUDE_ASM("asm/nonmatchings/Game/PLAN/PLANPOOL", PLANPOOL_GetNodeWithID);

INCLUDE_ASM("asm/nonmatchings/Game/PLAN/PLANPOOL", PLANPOOL_GetNodeByPosition);

INCLUDE_ASM("asm/nonmatchings/Game/PLAN/PLANPOOL", PLANPOOL_GetClosestNode);

INCLUDE_ASM("asm/nonmatchings/Game/PLAN/PLANPOOL", PLANPOOL_AppropriatePair);

INCLUDE_ASM("asm/nonmatchings/Game/PLAN/PLANPOOL", PLANPOOL_AreTwoNodesConnected);

INCLUDE_ASM("asm/nonmatchings/Game/PLAN/PLANPOOL", PLANPOOL_MarkTwoNodesAsConnected);

INCLUDE_ASM("asm/nonmatchings/Game/PLAN/PLANPOOL", PLANPOOL_MarkTwoNodesAsNotConnected);

INCLUDE_ASM("asm/nonmatchings/Game/PLAN/PLANPOOL", PLANPOOL_GetClosestUnexploredValidNeighbor);

INCLUDE_ASM("asm/nonmatchings/Game/PLAN/PLANPOOL", PLANPOOL_ChangeNodePosition);

INCLUDE_ASM("asm/nonmatchings/Game/PLAN/PLANPOOL", PLANPOOL_AddNodeToPool);

INCLUDE_ASM("asm/nonmatchings/Game/PLAN/PLANPOOL", PLANPOOL_DeleteNodeFromPool);
