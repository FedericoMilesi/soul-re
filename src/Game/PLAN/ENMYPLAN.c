#include "common.h"
#include "Game/PLAN/ENMYPLAN.h"
#include "Game/PLAN/PLANAPI.h"
#include "Game/GAMELOOP.h"
#include "Game/MATH3D.h"

void ENMYPLAN_InitEnemyPlanPool(void *enemyPlanPool)
{
    int i;

    for (i = 0; i < 10; i++)
    {
        ((EnemyPlanSlotData *)enemyPlanPool)[i].slotInUse = 0;
    }
}

int ENMYPLAN_GetNextAvailablePlanningSlot()
{
    int slotID;
    int i;

    slotID = -1;

    for (i = 0; i < 10; i++)
    {
        if ((signed char)((EnemyPlanSlotData *)gameTrackerX.enemyPlanPool)[i].slotInUse == 0)
        {
            slotID = i;
            break;
        }
    }

    return slotID;
}

int ENMYPLAN_GetInitializedPlanningWorkspaceFinal()
{
    EnemyPlanSlotData *pool;
    int slotID;

    pool = (EnemyPlanSlotData *)gameTrackerX.enemyPlanPool;

    slotID = ENMYPLAN_GetNextAvailablePlanningSlot();

    if (slotID != -1)
    {
        pool[slotID].slotInUse = 1;

        pool[slotID].state = 0;
    }

    return slotID;
}

void ENMYPLAN_ReleasePlanningWorkspace(int slotID)
{
    EnemyPlanSlotData *pool;

    pool = gameTrackerX.enemyPlanPool;

    if (slotID >= 0)
    {
        if (slotID < 10)
        {
            PLANAPI_DeleteNodesFromPoolByType(2);
            PLANAPI_DeleteNodesFromPoolByType(3);

            pool[slotID].slotInUse = 0;
        }
    }
}

int ENMYPLAN_WayPointSkipped(Position *currentPos, Position *targetPos, Position *nextTargetPos)
{
    long range[2];
    Position vector[2];

    SUB_SVEC(Position, &vector[0], Position, targetPos, Position, currentPos);

    range[0] = MATH3D_LengthXYZ(vector[0].x, vector[0].y, vector[0].z);

    SUB_SVEC(Position, &vector[1], Position, nextTargetPos, Position, targetPos);

    range[1] = MATH3D_LengthXYZ(vector[1].x, vector[1].y, vector[1].z);

    if (range[0] < range[1])
    {
        range[0] = range[0] ^ range[1];
        range[1] = range[1] ^ range[0];
        range[0] = range[0] ^ range[1];
    }

    return ((((range[0] * 724) >> 10) * range[1]) < ((vector[0].x * vector[1].x) + (vector[0].y * vector[1].y) + (vector[0].z * vector[1].z))) ^ 1;
}

INCLUDE_ASM("asm/nonmatchings/Game/PLAN/ENMYPLAN", ENMYPLAN_WayPointReached);

void ENMYPLAN_Replan(EnemyPlanSlotData *planSlot)
{
    planSlot->state = 0;

    PLANAPI_DeleteNodesFromPoolByType(2);
    PLANAPI_DeleteNodesFromPoolByType(3);
}

INCLUDE_ASM("asm/nonmatchings/Game/PLAN/ENMYPLAN", ENMYPLAN_PathClear);

INCLUDE_ASM("asm/nonmatchings/Game/PLAN/ENMYPLAN", ENMYPLAN_MoveToTargetFinal);

INCLUDE_ASM("asm/nonmatchings/Game/PLAN/ENMYPLAN", ValidSlotAndState);

INCLUDE_ASM("asm/nonmatchings/Game/PLAN/ENMYPLAN", ENMYPLAN_GetNodeTypeOfNextWaypoint);

INCLUDE_ASM("asm/nonmatchings/Game/PLAN/ENMYPLAN", ENMYPLAN_GetPosOfNextWaypoint);

INCLUDE_ASM("asm/nonmatchings/Game/PLAN/ENMYPLAN", ENMYPLAN_RelocatePlanPositions);
