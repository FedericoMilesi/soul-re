#include "common.h"
#include "Game/PLAN/ENMYPLAN.h"

void ENMYPLAN_InitEnemyPlanPool(void *enemyPlanPool)
{
    int i;

    for (i = 0; i < 10; i++)
    {
        ((EnemyPlanSlotData *)enemyPlanPool)[i].slotInUse = 0;
    }
}

INCLUDE_ASM("asm/nonmatchings/Game/PLAN/ENMYPLAN", ENMYPLAN_GetNextAvailablePlanningSlot);

INCLUDE_ASM("asm/nonmatchings/Game/PLAN/ENMYPLAN", ENMYPLAN_GetInitializedPlanningWorkspaceFinal);

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
