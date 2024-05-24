#include "common.h"
#include "Game/INSTANCE.h"
#include "Game/MONSTER/MONAPI.h"

INCLUDE_ASM("asm/nonmatchings/Game/MONSTER/HUMAN", HUMAN_WaitForWeapon);

INCLUDE_ASM("asm/nonmatchings/Game/MONSTER/HUMAN", HUMAN_CreateWeapon);

INCLUDE_ASM("asm/nonmatchings/Game/MONSTER/HUMAN", HUMAN_Init);

INCLUDE_ASM("asm/nonmatchings/Game/MONSTER/HUMAN", HUMAN_CleanUp);

INCLUDE_ASM("asm/nonmatchings/Game/MONSTER/HUMAN", HUMAN_Query);

INCLUDE_ASM("asm/nonmatchings/Game/MONSTER/HUMAN", HUMAN_DeadEntry);

INCLUDE_ASM("asm/nonmatchings/Game/MONSTER/HUMAN", HUMAN_Dead);

INCLUDE_ASM("asm/nonmatchings/Game/MONSTER/HUMAN", HUMAN_StunnedEntry);

INCLUDE_ASM("asm/nonmatchings/Game/MONSTER/HUMAN", HUMAN_Stunned);

INCLUDE_ASM("asm/nonmatchings/Game/MONSTER/HUMAN", HUMAN_EmbraceEntry);

INCLUDE_ASM("asm/nonmatchings/Game/MONSTER/HUMAN", HUMAN_Embrace);

INCLUDE_ASM("asm/nonmatchings/Game/MONSTER/HUMAN", HUMAN_IdleEntry);

INCLUDE_ASM("asm/nonmatchings/Game/MONSTER/HUMAN", HUMAN_Idle);

INCLUDE_ASM("asm/nonmatchings/Game/MONSTER/HUMAN", HUMAN_Flee);

INCLUDE_ASM("asm/nonmatchings/Game/MONSTER/HUMAN", HUMAN_GetAngry);

int HUMAN_TypeOfHuman(Instance *instance)
{
    int type;
    MonsterVars *mv;

    type = INSTANCE_Query(instance, 1);

    mv = (MonsterVars *)instance->extraData;

    if ((type & 0x4000))
    {
        return 1;
    }

    if ((type & 0x2000))
    {
        return 4;
    }

    if (!(type & 0x8000))
    {
        return 0;
    }

    if ((mv->auxFlags & 0x20))
    {
        return 3;
    }

    return 2;
}
