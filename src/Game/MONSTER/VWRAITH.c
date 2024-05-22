#include "common.h"
#include "Game/INSTANCE.h"

INCLUDE_ASM("asm/nonmatchings/Game/MONSTER/VWRAITH", VWRAITH_MoveVertical);

INCLUDE_ASM("asm/nonmatchings/Game/MONSTER/VWRAITH", VWRAITH_Init);

INCLUDE_ASM("asm/nonmatchings/Game/MONSTER/VWRAITH", VWRAITH_ShouldISwoop);

INCLUDE_ASM("asm/nonmatchings/Game/MONSTER/VWRAITH", VWRAITH_PursueEntry);

INCLUDE_ASM("asm/nonmatchings/Game/MONSTER/VWRAITH", VWRAITH_Pursue);

INCLUDE_ASM("asm/nonmatchings/Game/MONSTER/VWRAITH", VWRAITH_VerticalMove);

void VWRAITH_CombatEntry(Instance *instance)
{
    MON_CombatEntry(instance);
}

void VWRAITH_Combat(Instance *instance)
{
    MON_Combat(instance);

    VWRAITH_VerticalMove(instance);
}

void VWRAITH_EmbraceEntry(Instance *instance)
{
    MON_EmbraceEntry(instance);
}

void VWRAITH_Embrace(Instance *instance)
{
    MON_Embrace(instance);

    VWRAITH_VerticalMove(instance);
}
