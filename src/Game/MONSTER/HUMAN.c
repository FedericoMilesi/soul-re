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

void HUMAN_Flee(Instance *instance)
{
    MonsterVars *mv;
    MonsterIR *enemy;

    mv = (MonsterVars *)instance->extraData;

    enemy = mv->enemy;

    if ((enemy != NULL) && (enemy->distance < 640))
    {
        if (!(mv->auxFlags & 0x8))
        {
            MonsterAttributes *ma;

            ma = (MonsterAttributes *)instance->data;

            MON_PlayAnimFromList(instance, ma->auxAnimList, 2, 2);

            mv->auxFlags |= 0x8;

            if ((mv->auxFlags & 0x20))
            {
                SOUND_Play3dSound(&instance->position, 459, 0, 88, 3500);
            }
            else
            {
                SOUND_Play3dSound(&instance->position, 458, -100, 92, 3500);
            }
        }

        MON_TurnToPosition(instance, &enemy->instance->position, mv->subAttr->speedPivotTurn);

        MON_DefaultQueueHandler(instance);
    }
    else if ((mv->auxFlags & 0x8))
    {
        MON_SwitchState(instance, MONSTER_STATE_FLEE);
    }
    else
    {
        MON_Flee(instance);
    }

    if (((mv->auxFlags & 0x8)) && ((mv->mvFlags & 0x1)))
    {
        mv->auxFlags &= ~0x8;
    }
}

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
