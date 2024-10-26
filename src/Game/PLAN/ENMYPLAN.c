#include "common.h"
#include "Game/PLAN/ENMYPLAN.h"
#include "Game/PLAN/PLANAPI.h"
#include "Game/GAMELOOP.h"
#include "Game/MATH3D.h"
#include "Game/PLAN/PLANCOLL.h"

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

int ENMYPLAN_WayPointReached(Position *currentPos, Position *oldCurrentPos, Position *targetPos)
{
    long range[2];

    range[0] = MATH3D_LengthXYZ(targetPos->x - currentPos->x, targetPos->y - currentPos->y, targetPos->z - currentPos->z);
    range[1] = MATH3D_LengthXYZ(targetPos->x - oldCurrentPos->x, targetPos->y - oldCurrentPos->y, targetPos->z - oldCurrentPos->z);

    if (((range[0] > range[1]) && (range[0] < 400)) || (range[0] < 50))
    {
        return 1;
    }
    else
    {
        return 0;
    }
}

void ENMYPLAN_Replan(EnemyPlanSlotData *planSlot)
{
    planSlot->state = 0;

    PLANAPI_DeleteNodesFromPoolByType(2);
    PLANAPI_DeleteNodesFromPoolByType(3);
}

int ENMYPLAN_PathClear(Position *pos, Position *target)
{
    int len;
    int oldPCO;
    Position *tpos;
    Position newTarget;

    oldPCO = gameTrackerX.plan_collide_override;

    gameTrackerX.plan_collide_override = 1;

    newTarget.x = target->x - pos->x;
    newTarget.y = target->y - pos->y;
    newTarget.z = target->z - pos->z;

    len = MATH3D_LengthXYZ(newTarget.x, newTarget.y, newTarget.z);

    if (len > 1280)
    {
        newTarget.x = (((newTarget.x << 12) / len) * 1280) / 4096;
        newTarget.y = (((newTarget.y << 12) / len) * 1280) / 4096;
        newTarget.z = (((newTarget.z << 12) / len) * 1280) / 4096;

        newTarget.x += pos->x;
        newTarget.y += pos->y;

        tpos = &newTarget;

        newTarget.z += pos->z;
    }
    else
    {
        tpos = target;
    }

    PLANCOLL_DoesStraightLinePathExist(pos, tpos, 0);

    gameTrackerX.plan_collide_override = oldPCO;
}

INCLUDE_ASM("asm/nonmatchings/Game/PLAN/ENMYPLAN", ENMYPLAN_MoveToTargetFinal);

int ValidSlotAndState(EnemyPlanSlotData *pool, int slotID)
{
    if ((slotID == -1) || (slotID >= 10))
    {
        return 0;
    }

    return (pool[slotID].state == 2) || (pool[slotID].state == 3);
}

INCLUDE_ASM("asm/nonmatchings/Game/PLAN/ENMYPLAN", ENMYPLAN_GetNodeTypeOfNextWaypoint);

INCLUDE_ASM("asm/nonmatchings/Game/PLAN/ENMYPLAN", ENMYPLAN_GetPosOfNextWaypoint);

INCLUDE_ASM("asm/nonmatchings/Game/PLAN/ENMYPLAN", ENMYPLAN_RelocatePlanPositions);
