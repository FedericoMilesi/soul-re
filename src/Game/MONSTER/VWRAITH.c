#include "common.h"
#include "Game/FX.h"
#include "Game/MONSTER/VWRAITH.h"
#include "Game/MONSTER/MONSTER.h"
#include "Game/MONSTER/MONAPI.h"

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

void VWRAITH_Init(Instance* instance)
{
    
    long color;
    int hitpoints;
    MonsterVars* mv;

    mv = instance->extraData;
    
    hitpoints = mv->hitPoints;
    
    if (hitpoints < 0)
    {
        hitpoints += 0xFFF;
    }
    
    color = FX_GetHealthColor(hitpoints >> 0xC);
    mv->effect = FX_DoInstanceTwoSegmentGlow(instance, 0x15, 0x17, &color, 1, 0x4B0, 0x9C);
    MON_DefaultInit(instance);
    
    mv->soulJuice = 0x3000;
    mv->auxFlags &= ~1;
    mv->mvFlags |= 0x10002800;
    
}

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
