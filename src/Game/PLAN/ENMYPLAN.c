#include "common.h"
#include "Game/PLAN/ENMYPLAN.h"
#include "Game/GAMELOOP.h"

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

INCLUDE_ASM("asm/nonmatchings/Game/PLAN/ENMYPLAN", ENMYPLAN_ReleasePlanningWorkspace);

INCLUDE_ASM("asm/nonmatchings/Game/PLAN/ENMYPLAN", ENMYPLAN_WayPointSkipped);

INCLUDE_ASM("asm/nonmatchings/Game/PLAN/ENMYPLAN", ENMYPLAN_WayPointReached);

INCLUDE_ASM("asm/nonmatchings/Game/PLAN/ENMYPLAN", ENMYPLAN_Replan);

INCLUDE_ASM("asm/nonmatchings/Game/PLAN/ENMYPLAN", ENMYPLAN_PathClear);

INCLUDE_ASM("asm/nonmatchings/Game/PLAN/ENMYPLAN", ENMYPLAN_MoveToTargetFinal);

INCLUDE_ASM("asm/nonmatchings/Game/PLAN/ENMYPLAN", ValidSlotAndState);

INCLUDE_ASM("asm/nonmatchings/Game/PLAN/ENMYPLAN", ENMYPLAN_GetNodeTypeOfNextWaypoint);

INCLUDE_ASM("asm/nonmatchings/Game/PLAN/ENMYPLAN", ENMYPLAN_GetPosOfNextWaypoint);

INCLUDE_ASM("asm/nonmatchings/Game/PLAN/ENMYPLAN", ENMYPLAN_RelocatePlanPositions);
