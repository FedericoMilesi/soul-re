#include "common.h"
#include "Game/INSTANCE.h"
#include "Game/GAMELOOP.h"
#include "Game/MONSTER/MONAPI.h"

INCLUDE_ASM("asm/nonmatchings/Game/MONSTER/HUMAN", HUMAN_WaitForWeapon);

INCLUDE_ASM("asm/nonmatchings/Game/MONSTER/HUMAN", HUMAN_CreateWeapon);

INCLUDE_ASM("asm/nonmatchings/Game/MONSTER/HUMAN", HUMAN_Init);

void HUMAN_CleanUp(Instance *instance)
{
    MON_CleanUp(instance);
}

INCLUDE_ASM("asm/nonmatchings/Game/MONSTER/HUMAN", HUMAN_Query);

void HUMAN_DeadEntry(Instance *instance)
{
    MonsterVars *mv;

    mv = (MonsterVars *)instance->extraData;

    mv->soulJuice /= 4;

    if (mv->soulJuice >= 4097)
    {
        mv->soulJuice = 4096;
    }

    MON_DeadEntry(instance);

    mv->damageTimer = MON_GetTime(instance);

    MON_BirthMana(instance);
}

INCLUDE_ASM("asm/nonmatchings/Game/MONSTER/HUMAN", HUMAN_Dead);

INCLUDE_ASM("asm/nonmatchings/Game/MONSTER/HUMAN", HUMAN_StunnedEntry);

INCLUDE_ASM("asm/nonmatchings/Game/MONSTER/HUMAN", HUMAN_Stunned);

INCLUDE_ASM("asm/nonmatchings/Game/MONSTER/HUMAN", HUMAN_EmbraceEntry);

INCLUDE_ASM("asm/nonmatchings/Game/MONSTER/HUMAN", HUMAN_Embrace);

INCLUDE_ASM("asm/nonmatchings/Game/MONSTER/HUMAN", HUMAN_IdleEntry);

INCLUDE_ASM("asm/nonmatchings/Game/MONSTER/HUMAN", HUMAN_Idle);

INCLUDE_ASM("asm/nonmatchings/Game/MONSTER/HUMAN", HUMAN_Flee);

void HUMAN_GetAngry()
{
    Instance *instance;

    instance = gameTrackerX.instanceList->first;

    while (instance != NULL)
    {
        if ((INSTANCE_Query(instance, 1) & 0xC000))
        {
            MonsterVars *mv;
            MonsterAllegiances *allegiances;
            MonsterIR *mir;

            mv = (MonsterVars *)instance->extraData;

            allegiances = mv->subAttr->allegiances;

            do
            {

            } while (0); // garbage code for reodering

            allegiances->gods &= ~0x1;

            allegiances->allies &= ~0x1;

            allegiances->enemies |= 0x1;

            mir = MONSENSE_SetEnemy(instance, gameTrackerX.playerInstance);

            if (mir != NULL)
            {
                mir->mirFlags &= ~0x6;
            }
        }

        instance = instance->next;
    }
}

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
