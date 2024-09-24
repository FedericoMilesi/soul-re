#include "common.h"
#include "Game/FX.h"
#include "Game/MONSTER/MONAPI.h"
#include "Game/MONSTER/MONLIB.h"
#include "Game/MONSTER/MONSTER.h"

INCLUDE_ASM("asm/nonmatchings/Game/MONSTER/SLUAGH", SLUAGH_Query);

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
    mv->effect = 0;

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

INCLUDE_ASM("asm/nonmatchings/Game/MONSTER/SLUAGH", SLUAGH_Death);

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
