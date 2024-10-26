#include "common.h"
#include "Game/PLAN/PLAN.h"
#include "Game/PLAN/PLANAPI.h"
#include "Game/PLAN/PLANSRCH.h"
#include "Game/PLAN/PLANPOOL.h"

INCLUDE_ASM("asm/nonmatchings/Game/PLAN/PLANSRCH", PLANSRCH_FindNodeToExpand);

INCLUDE_ASM("asm/nonmatchings/Game/PLAN/PLANSRCH", PLANSRCH_ExpandNode);

void PLANSRCH_InitNodesForSearch(PlanningNode *planningPool)
{
    int i;

    for (i = 0; i < poolManagementData->numNodesInPool; i++)
    {
        planningPool[i].cost = 0;

        planningPool[i].parent = 0;

        planningPool[i].flags &= ~0x3;
    }
}

PlanningNode *PLANSRCH_FindPathInGraph(PlanningNode *planningPool, PlanningNode *startNode, PlanningNode *goalNode, int validNodeTypes)
{
    PlanningNode *nodeToExpand;

    if (!(goalNode->connections & ~(1 << (goalNode - planningPool))))
    {
        return NULL;
    }

    PLANSRCH_InitNodesForSearch(planningPool);

    startNode->parent = startNode - planningPool;

    startNode->cost = 0;

    startNode->flags |= 0x1;

    if (PLANPOOL_AreTwoNodesConnected(startNode, goalNode, planningPool) != 0)
    {
        goalNode->parent = startNode - planningPool;

        return goalNode;
    }

    while (1)
    {
        nodeToExpand = PLANSRCH_FindNodeToExpand(planningPool, goalNode, validNodeTypes);

        if (nodeToExpand == NULL)
        {
            return NULL;
        }
        else if (nodeToExpand != goalNode)
        {
            PLANSRCH_ExpandNode(planningPool, nodeToExpand);
        }
        else
        {
            return nodeToExpand;
        }
    }
}
