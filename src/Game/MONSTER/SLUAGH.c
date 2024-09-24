#include "common.h"
#include "Game/FX.h"
#include "Game/MONSTER/MONAPI.h"
#include "Game/MONSTER/MONSTER.h"

INCLUDE_ASM("asm/nonmatchings/Game/MONSTER/SLUAGH", SLUAGH_Query);

INCLUDE_ASM("asm/nonmatchings/Game/MONSTER/SLUAGH", SLUAGH_DamageEffect);

void SLUAGH_Init(Instance *instance)
{
    
    MonsterVars *mv;
    MonsterAttributes *ma;
    short hitpoints;
    long color;

    mv = (MonsterVars*) instance->extraData;
    ma = (MonsterAttributes*) instance->data;
    hitpoints = mv->hitPoints;
    

    color = FX_GetHealthColor(hitpoints / 4096);
    mv->effect = FX_DoInstanceOneSegmentGlow(instance, ma->headSegment, &color, 1, 0x4B0, 0x68, 0x70);
    
    MON_DefaultInit(instance);
    mv->soulJuice = 8192;
    mv->auxFlags &= ~1;
    mv->mvFlags |= 0x02002000;

}

INCLUDE_ASM("asm/nonmatchings/Game/MONSTER/SLUAGH", SLUAGH_DeathEntry);

INCLUDE_ASM("asm/nonmatchings/Game/MONSTER/SLUAGH", SLUAGH_Death);

INCLUDE_ASM("asm/nonmatchings/Game/MONSTER/SLUAGH", SLUAGH_AttackEntry);

INCLUDE_ASM("asm/nonmatchings/Game/MONSTER/SLUAGH", SLUAGH_Attack);
