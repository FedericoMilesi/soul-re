#ifndef _PLANAPI_H_
#define _PLANAPI_H_

#include "common.h"

void PLANAPI_DeleteNodeFromPoolByUnit(long streamUnitID);
void PLANAPI_InitPlanMkrList(StreamUnit *streamUnit);
int PLANAPI_NumNodesInPool(void *planningPool);
int PLANAPI_FindNodePositionInUnit(StreamUnit *streamUnit, Position *pos, int id, int type);
void PLANAPI_DeleteNodesFromPoolByType(int nodeSource);
int PLANAPI_FindPathBetweenNodes(PlanningNode *startNode, PlanningNode *goalNode, EnemyPlanData *planData, int validNodeTypes);

PoolManagementData *poolManagementData;

#endif
