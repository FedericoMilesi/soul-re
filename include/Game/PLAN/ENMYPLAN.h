#ifndef _ENMYPLAN_H_
#define _ENMYPLAN_H_

#include "common.h"

// size: 0x44
typedef struct EnemyPlanData
{
    // offset: 0000 (8 bytes)
    unsigned char nodeSkipArray[8];
    // offset: 0008 (8 bytes)
    unsigned char nodeTypeArray[8];
    // offset: 0010 (48 bytes)
    struct _Position wayPointArray[8];
    // offset: 0040
    short goalUnitID;
    // offset: 0042
    unsigned char numWayPoints;
} EnemyPlanData;

// size: 0x5E
typedef struct EnemyPlanSlotData
{
    // offset: 0000
    char slotInUse;
    // offset: 0001
    char state;
    // offset: 0002
    char wayPointBeingServoedTo;
    // offset: 0004 (6 bytes)
    struct _Position startPos;
    // offset: 000A (6 bytes)
    struct _Position goalPos;
    // offset: 0010 (6 bytes)
    struct _Position oldCurrentPos;
    // offset: 0016 (68 bytes)
    struct EnemyPlanData planData;
    // offset: 005A
    char targetType;
    // offset: 005C
    short timer;
} EnemyPlanSlotData;

void ENMYPLAN_RelocatePlanPositions(int slotID, Position *offset);
void ENMYPLAN_ReleasePlanningWorkspace(int slotID);
int ENMYPLAN_GetInitializedPlanningWorkspaceFinal();

#endif
