#include "common.h"
#include "Game/INSTANCE.h"
#include "Game/MONSTER/MONAPI.h"

INCLUDE_ASM("asm/nonmatchings/Game/MONSTER/SOUL", SOUL_QueueHandler);

INCLUDE_ASM("asm/nonmatchings/Game/MONSTER/SOUL", SOUL_Physics);

INCLUDE_ASM("asm/nonmatchings/Game/MONSTER/SOUL", SOUL_Fade);

INCLUDE_ASM("asm/nonmatchings/Game/MONSTER/SOUL", SOUL_MoveToDest);

INCLUDE_ASM("asm/nonmatchings/Game/MONSTER/SOUL", SOUL_MovePastWall);

INCLUDE_ASM("asm/nonmatchings/Game/MONSTER/SOUL", SOUL_Init);

INCLUDE_ASM("asm/nonmatchings/Game/MONSTER/SOUL", SOUL_CleanUp);

INCLUDE_ASM("asm/nonmatchings/Game/MONSTER/SOUL", SOUL_BirthEntry);

INCLUDE_ASM("asm/nonmatchings/Game/MONSTER/SOUL", SOUL_Birth);

void SOUL_SoulSuckEntry(Instance *instance)
{
    instance->maxXVel = 600;
    instance->maxYVel = 600;
    instance->maxZVel = 17;

    instance->flags &= ~0x800;
}

long SOUL_CalcAccel(long delta, long vel, long magnitude)
{
    long rv;

    if (delta > 0)
    {
        if (vel < 0)
        {
            rv = (delta * 16) / magnitude;
        }
        else
        {
            rv = (delta * 5) / magnitude;
        }
    }
    else if (vel > 0)
    {
        rv = (delta * 16) / magnitude;
    }
    else
    {
        rv = (delta * 5) / magnitude;
    }

    return rv;
}

INCLUDE_ASM("asm/nonmatchings/Game/MONSTER/SOUL", SOUL_SoulSuck);

void SOUL_WanderEntry(Instance *instance)
{
    MonsterVars *mv;

    mv = (MonsterVars *)instance->extraData;

    instance->maxXVel = 10;
    instance->maxYVel = 10;
    instance->maxZVel = 17;

    if (!(mv->mvFlags & 0x40000))
    {
        if (instance->intro != NULL)
        {
            MON_GetRandomDestinationInWorld(instance, &instance->intro->position, mv->wanderRange);
        }
        else
        {
            MON_GetRandomDestinationInWorld(instance, &instance->position, mv->wanderRange);
        }
    }
}

INCLUDE_ASM("asm/nonmatchings/Game/MONSTER/SOUL", SOUL_Wander);

void SOUL_FleeEntry(Instance *instance)
{
    instance->maxXVel = 15;
    instance->maxYVel = 15;
    instance->maxZVel = 17;

    MON_FleeEntry(instance);
}

INCLUDE_ASM("asm/nonmatchings/Game/MONSTER/SOUL", SOUL_Flee);

void SOUL_IdleEntry(Instance *instance)
{
    MonsterVars *mv;

    mv = (MonsterVars *)instance->extraData;

    instance->maxXVel = 15;
    instance->maxYVel = 15;
    instance->maxZVel = 17;

    mv->generalTimer = MON_GetTime(instance) + 3000 + (rand() % 3000);

    mv->mvFlags &= ~0x40000;
}

INCLUDE_ASM("asm/nonmatchings/Game/MONSTER/SOUL", SOUL_Idle);

void SOUL_ReanimateEntry(Instance *instance)
{
    MonsterVars *mv;
    Instance *body;

    mv = (MonsterVars *)instance->extraData;

    body = INSTANCE_Find(mv->soulID);

    mv->destination.x = body->position.x;
    mv->destination.y = body->position.y;
    mv->destination.z = body->position.z + 160;

    MON_TurnOffBodySpheres(instance);
}

INCLUDE_ASM("asm/nonmatchings/Game/MONSTER/SOUL", SOUL_Reanimate);

void SOUL_Effect(void)
{
}
