#include "common.h"
#include "Game/GAMELOOP.h"
#include "Game/PHYSOBS.h"
#include "Game/MONSTER/MISSILE.h"
#include "Game/MONSTER/MONLIB.h"

void MISSILE_Process(Instance *instance, GameTracker *gameTracker)
{
    ProcessPhysicalObject(instance, gameTracker);

    if ((instance->LinkParent == NULL) && ((unsigned)instance->work2 < MON_GetTime(instance)))
    {
        INSTANCE_KillInstance(instance);
    }
}

void MISSILE_Collide(Instance *instance, GameTracker *gameTracker)
{
    CollidePhysicalObject(instance, gameTracker);

    if (instance->LinkParent == NULL)
    {
        INSTANCE_KillInstance(instance);
    }
}

INCLUDE_ASM("asm/nonmatchings/Game/MONSTER/MISSILE", MISSILE_Find);

INCLUDE_ASM("asm/nonmatchings/Game/MONSTER/MISSILE", MISSILE_Birth);

INCLUDE_ASM("asm/nonmatchings/Game/MONSTER/MISSILE", MISSILE_Fire);

Instance *MISSILE_FireAtInstance(Instance *instance, MonsterMissile *missiledef, Instance *target)
{
    return MISSILE_Fire(instance, missiledef, target, 1);
}
