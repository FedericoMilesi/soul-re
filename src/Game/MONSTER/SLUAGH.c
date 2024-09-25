#include "common.h"
#include "Game/FX.h"
#include "Game/MONSTER/MONAPI.h"
#include "Game/MONSTER/MONLIB.h"
#include "Game/MONSTER/MONMSG.h"
#include "Game/MONSTER/MONSTER.h"

uintptr_t SLUAGH_Query(Instance *instance, unsigned long query)
{

    MonsterVars *mv;
    MonsterAttributes *ma;

    mv = (MonsterVars *)instance->extraData;
    ma = (MonsterAttributes *)instance->data;

    switch (query)
    {
    case 1:
        if (mv->auxFlags & 1)
        {
            return ma->whatAmI | 4;
        }
        return ma->whatAmI;
    case 0:
        if (!(mv->auxFlags & 1))
        {
            // TODO: Investigate this line later.
            return (((unsigned char *)&mv->mvFlags)[1] & 1) << 0x1D;
        }
        return 0x04000000;
    default:
        return MonsterQuery(instance, query);
    }
}

INCLUDE_ASM("asm/nonmatchings/Game/MONSTER/SLUAGH", SLUAGH_DamageEffect);

void SLUAGH_Init(Instance *instance)
{

    MonsterVars *mv;
    MonsterAttributes *ma;
    short hitpoints;
    long color;

    mv = (MonsterVars *)instance->extraData;
    ma = (MonsterAttributes *)instance->data;
    hitpoints = mv->hitPoints;


    color = FX_GetHealthColor(hitpoints / 4096);
    mv->effect = FX_DoInstanceOneSegmentGlow(instance, ma->headSegment, &color, 1, 0x4B0, 0x68, 0x70);

    MON_DefaultInit(instance);
    mv->soulJuice = 8192;
    mv->auxFlags &= ~1;
    mv->mvFlags |= 0x02002000;

}

void SLUAGH_DeathEntry(Instance *instance)
{

    MonsterVars *mv;
    MonsterIR *enemy;

    mv = (MonsterVars *)instance->extraData;
    FX_StopGlowEffect(mv->effect, 0);

    enemy = mv->enemy;
    mv->effect = NULL;

    if (enemy != NULL)
    {
        if (MON_SetUpKnockBack(instance, enemy->instance, (evMonsterHitData *)mv->messageData) != 0)
        {
            MON_PlayAnim(instance, MONSTER_ANIM_HIT1, 1);
        }
        else
        {
            MON_PlayAnim(instance, MONSTER_ANIM_HIT2, 1);
        }
    }

    mv->behaviorState = MONSTER_STATE_STUNNED;

    if (!(mv->auxFlags & 1))
    {
        MON_BirthMana(instance);
        mv->auxFlags |= 1;
    }

    mv->mvFlags |= 0x200000;
    MON_StartSpecialFade(instance, 0x800, 0x14);
}

void SLUAGH_Death(Instance *instance)
{

    if (instance->flags2 & 0x10)
    {
        MON_PlayAnim(instance, MONSTER_ANIM_GENERALDEATH, 2);
    }

    if (instance->flags2 & 2)
    {

        MonsterVars *mv;
        mv = (MonsterVars *)instance->extraData;

        if (mv->enemy != NULL)
        {
            MON_SwitchState(instance, MONSTER_STATE_FLEE);
        }
        else
        {
            MON_SwitchState(instance, MONSTER_STATE_IDLE);
        }
    }

    MON_DefaultQueueHandler(instance);
}

void SLUAGH_AttackEntry(Instance *instance)
{

    MonsterVars *mv;
    mv = (MonsterVars *)instance->extraData;

    if (mv->enemy->mirFlags & 8)
    {
        MON_PlayAnim(instance, MONSTER_ANIM_SOULSUCK, 1);
        mv->auxFlags |= 4;
        return;
    }

    MON_AttackEntry(instance);
}

INCLUDE_ASM("asm/nonmatchings/Game/MONSTER/SLUAGH", SLUAGH_Attack);
