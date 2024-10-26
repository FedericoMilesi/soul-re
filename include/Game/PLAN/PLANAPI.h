#ifndef _PLANAPI_H_
#define _PLANAPI_H_

void PLANAPI_DeleteNodeFromPoolByUnit(long streamUnitID);
void PLANAPI_InitPlanMkrList(StreamUnit *streamUnit);
int PLANAPI_NumNodesInPool(void *planningPool);
int PLANAPI_FindNodePositionInUnit(StreamUnit *streamUnit, Position *pos, int id, int type);
void PLANAPI_DeleteNodesFromPoolByType(int nodeSource);

// size: 0x20
typedef struct PoolManagementData
{
    // offset: 0000
    char state;
    // offset: 0001
    unsigned char numNodesInPool;
    // offset: 0002 (6 bytes)
    struct _Position playerPosAtLastPlanMkrUpdate;
    // offset: 0008 (28 bytes)
    struct PlanningNode *expansionNode1;
    // offset: 000C (28 bytes)
    struct PlanningNode *expansionNode2;
    // offset: 0010 (4 bytes)
    unsigned short (*distanceMatrix)[32];
    // offset: 0014
    unsigned short pairType;
    // offset: 0016 (6 bytes)
    struct _Position peakPos;
    // offset: 001C
    unsigned char currentNode;
    // offset: 001D
    unsigned char currentBit;
} PoolManagementData;

PoolManagementData *poolManagementData;

#endif
