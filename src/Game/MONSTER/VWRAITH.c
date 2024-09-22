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

    mv = (MonsterVars*) instance->extraData;
    hitpoints = mv->hitPoints;
    
    color = FX_GetHealthColor(hitpoints / 4096);
    mv->effect = FX_DoInstanceTwoSegmentGlow(instance, 0x15, 0x17, &color, 1, 0x4B0, 0x9C);
    MON_DefaultInit(instance);
    
    mv->soulJuice = 0x3000;
    mv->auxFlags &= ~1;
    mv->mvFlags |= 0x10002800;
    
}

int VWRAITH_ShouldISwoop(Instance *instance)
{
    
    MonsterVars  *mv;
    MonsterAttributes *ma;
    
    mv = (MonsterVars*) instance->extraData;
    ma = (MonsterAttributes*) instance->data;
    
    if (!(mv->mvFlags & 4)) 
    {
        if (mv->enemy != NULL) 
        {
            
            Instance *ei;
            ei = mv->enemy->instance;
            if (instance->position.z >= ei->position.z) 
            {
                if (((MonsterCombatAttributes*) ma->tunData)->surpriseRange < mv->enemy->distance) 
                {
                    return MON_ShouldIAttackInstance(instance, ei);
                }
            }
        }
    }
    return 0;
}

void VWRAITH_PursueEntry(Instance *instance)
{

    MonsterVars *mv;
    MonsterAttributes *ma;
    MonsterAnimation *mAnim;

    mv = (MonsterVars*) instance->extraData;
    
    if (VWRAITH_ShouldISwoop(instance) != 0)
    {
        mv->auxFlags |= 2;
    }
    
    if (!(mv->auxFlags & 2))
    {
        MON_PursueEntry(instance);
        return;
    }
    
    ma = (MonsterAttributes*) instance->data;
    mAnim = (MonsterAnimation*) ma->tunData;
    
    MON_PlayAnimFromList(instance, ma->auxAnimList, (signed char) mAnim->index[2], 1);

    mv->mode = 4;
    mv->speed = 0;

}

INCLUDE_ASM("asm/nonmatchings/Game/MONSTER/VWRAITH", VWRAITH_Pursue);

void VWRAITH_VerticalMove(Instance *instance) 
{
    
    short targetZ;
    G2LVector3 *velocity;
    MonsterVars *mv;
    MonsterAttributes *ma;
    MonsterIR *enemy;

    mv = (MonsterVars*) instance->extraData;
    enemy = mv->enemy;
    
    if (enemy == NULL) 
    {
        return;
    }
    
    targetZ = enemy->instance->position.z;
    ma = (MonsterAttributes*) instance->data;
    velocity = (G2LVector3*) ma->tunData;

    VWRAITH_MoveVertical(instance, targetZ, (short) velocity->z);

    if ((instance->currentMainState == MONSTER_STATE_ATTACK) && (instance->position.z != targetZ)) 
    {
        MON_SwitchState(instance, MONSTER_STATE_COMBAT);
    }
    
}

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
