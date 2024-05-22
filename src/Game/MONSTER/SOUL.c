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

INCLUDE_ASM("asm/nonmatchings/Game/MONSTER/SOUL", SOUL_SoulSuckEntry);

INCLUDE_ASM("asm/nonmatchings/Game/MONSTER/SOUL", SOUL_CalcAccel);

INCLUDE_ASM("asm/nonmatchings/Game/MONSTER/SOUL", SOUL_SoulSuck);

INCLUDE_ASM("asm/nonmatchings/Game/MONSTER/SOUL", SOUL_WanderEntry);

INCLUDE_ASM("asm/nonmatchings/Game/MONSTER/SOUL", SOUL_Wander);

INCLUDE_ASM("asm/nonmatchings/Game/MONSTER/SOUL", SOUL_FleeEntry);

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
