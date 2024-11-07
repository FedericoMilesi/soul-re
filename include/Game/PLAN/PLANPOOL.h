#ifndef _PLANPOOL_H_
#define _PLANPOOL_H_

#include "common.h"

int PLANPOOL_AreTwoNodesConnected(PlanningNode *node1, PlanningNode *node2, PlanningNode *planningPool);
int PLANPOOL_NumberOfNodesOfType(PlanningNode *planningPool, char nodeType);
int PLANPOOL_NumberOfNodesOfSource(PlanningNode *planningPool, char nodeSource);
void PLANPOOL_DeleteNodeFromPool(PlanningNode *nodeToDelete, PlanningNode *planningPool);
PlanningNode *PLANPOOL_GetNodeByPosition(Position *currentPos, PlanningNode *planningPool);
PlanningNode *PLANPOOL_GetFirstNodeOfSource(PlanningNode *planningPool, char nodeSource);
int PLANPOOL_NumNodesInPlan(PlanningNode *goalNode, PlanningNode *planningPool);
PlanningNode *PLANPOOL_GetClosestUnexploredValidNeighbor(PlanningNode *startNode, PlanningNode *planningPool);
void PLANPOOL_MarkTwoNodesAsConnected(PlanningNode *node1, PlanningNode *node2, PlanningNode *planningPool);
void PLANPOOL_MarkTwoNodesAsNotConnected(PlanningNode *node1, PlanningNode *node2, PlanningNode *planningPool);
int PLANPOOL_NumConnectionsForNode(PlanningNode *node);
int PLANPOOL_NumConnectionsExaminedForNode(PlanningNode *node);

#endif
