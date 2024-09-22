#include "common.h"
#include "Game/FX.h"
#include "Game/MONSTER/VWRAITH.h"
#include "Game/MONSTER/MONSTER.h"
#include "Game/MONSTER/MONAPI.h"
#include "Game/MONSTER/MONLIB.h"

void VWRAITH_MoveVertical(Instance *instance, long targetZ, int velocity)
{
    if (instance->position.z < targetZ)
    {
        instance->position.z += velocity;

        if (targetZ < instance->position.z)
        {
            instance->position.z = targetZ;
        }
    }
    else if (targetZ < instance->position.z)
    {
        instance->position.z -= velocity;

        if (instance->position.z < targetZ)
        {
            instance->position.z = targetZ;
        }
    }
}

void VWRAITH_Init(Instance *instance)
{
    
    long color;
    int hitpoints;
    MonsterVars *mv;

    mv = instance->extraData;
    hitpoints = mv->hitPoints;
    
    color = FX_GetHealthColor(hitpoints / 4096);
    mv->effect = FX_DoInstanceTwoSegmentGlow(instance, 0x15, 0x17, &color, 1, 0x4B0, 0x9C);
    MON_DefaultInit(instance);
    
    mv->soulJuice = 0x3000;
    mv->auxFlags &= ~1;
    mv->mvFlags |= 0x10002800;
    
}

INCLUDE_ASM("asm/nonmatchings/Game/MONSTER/VWRAITH", VWRAITH_ShouldISwoop);

void VWRAITH_PursueEntry(Instance *instance)
{

    MonsterVars *mv;
    MonsterAttributes *ma;
    MonsterAnimation *mAnim;

    mv = instance->extraData;
    
    if (VWRAITH_ShouldISwoop(instance) != 0)
    {
        mv->auxFlags |= 2;
    }
    
    if (!(mv->auxFlags & 2))
    {
        MON_PursueEntry(instance);
        return;
    }
    
    ma = instance->data;
    mAnim = ma->tunData;
    
    MON_PlayAnimFromList(instance, ma->auxAnimList, (signed char) mAnim->index[2], 1);

    mv->mode = 4;
    mv->speed = 0;

}

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
