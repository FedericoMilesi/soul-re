#include "common.h"
#include "Game/INSTANCE.h"
#include "Game/STATE.h"
#include "Game/GAMELOOP.h"
#include "Game/MONSTER/MONAPI.h"

void SOUL_QueueHandler(Instance *instance)
{
    MonsterVars *mv;
    Message *message;

    mv = (MonsterVars *)instance->extraData;

    while (message = DeMessageQueue(&mv->messageQueue))
    {
        if ((message != NULL) && (message->ID == 0x100000D))
        {
            if (instance->currentMainState != MONSTER_STATE_DEAD)
            {
                MON_SwitchState(instance, MONSTER_STATE_DEAD);
            }

            continue;
        }

        MON_DefaultMessageHandler(instance, message);
    }
}

void SOUL_Physics(Instance *instance, long time)
{
    MonsterVars *mv;
    int a;

    mv = (MonsterVars *)instance->extraData;

    a = -4;

    if (((mv->speed & 31)) < 16)
    {
        a = 4;
    }

    instance->zAccl += a;

    mv->speed += 1;

    PhysicsMove(instance, &instance->position, time);
}

INCLUDE_ASM("asm/nonmatchings/Game/MONSTER/SOUL", SOUL_Fade);

void SOUL_MoveToDest(Instance *instance, long maxAccel, long time)
{
    MonsterVars *mv;

    mv = (MonsterVars *)instance->extraData;

    instance->xAccl = (mv->destination.x - instance->position.x) - instance->xVel;
    instance->yAccl = (mv->destination.y - instance->position.y) - instance->yVel;
    instance->zAccl = (mv->destination.z - instance->position.z) - instance->zVel;

    if (instance->xAccl < -maxAccel)
    {
        instance->xAccl = -maxAccel;
    }
    else if (maxAccel < instance->xAccl)
    {
        instance->xAccl = maxAccel;
    }

    if (instance->yAccl < -maxAccel)
    {
        instance->yAccl = -maxAccel;
    }
    else if (maxAccel < instance->yAccl)
    {
        instance->yAccl = maxAccel;
    }

    if (instance->zAccl < -maxAccel)
    {
        instance->zAccl = -maxAccel;
    }
    else if (maxAccel < instance->zAccl)
    {
        instance->zAccl = maxAccel;
    }

    SOUL_Physics(instance, time);
}

INCLUDE_ASM("asm/nonmatchings/Game/MONSTER/SOUL", SOUL_MovePastWall);

void SOUL_Init(Instance *instance)
{
    MonsterVars *mv;

    mv = (MonsterVars *)instance->extraData;

    MON_DefaultInit(instance);

    mv->mvFlags |= 0x200000 | 0x880;

    instance->maxXVel = 600;
    instance->maxYVel = 600;
    instance->maxZVel = 600;

    instance->flags2 |= 0x20000;

    mv->speed = 0;

    mv->damageTimer = MON_GetTime(instance) + 6500;

    if (instance->parent != NULL)
    {
        mv->soulID = instance->parent->introUniqueID;
    }

    if (!(instance->flags & 0x2))
    {
        instance->flags2 |= 0x8000000;

        MON_SwitchState(instance, MONSTER_STATE_IDLE);
    }
}

void SOUL_CleanUp(Instance *instance)
{
    MON_CleanUp(instance);
}

void SOUL_BirthEntry(Instance *instance)
{
    MonsterVars *mv;

    mv = (MonsterVars *)instance->extraData;

    instance->maxXVel = 15;
    instance->maxYVel = 15;
    instance->maxZVel = 17;

    instance->zAccl = 0;
    instance->zVel = 0;

    instance->position.z += 120;

    mv->generalTimer = MON_GetTime(instance) + 1500;
}

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

void SOUL_Reanimate(Instance *instance)
{
    MonsterVars *mv;
    Instance *body;

    mv = (MonsterVars *)instance->extraData;

    SOUL_MoveToDest(instance, 16, gameTrackerX.timeMult);

    if (MATH3D_LengthXY(instance->position.x - mv->destination.x, instance->position.y - mv->destination.y) < 250)
    {
        if (mv->soulID != 0)
        {
            body = INSTANCE_Find(mv->soulID);

            if (body != NULL)
            {
                INSTANCE_Post(body, 0x100000D, 0);
            }

            SAVE_DeleteInstance(instance);
        }

        MON_KillMonster(instance);
        return;
    }

    while (DeMessageQueue(&mv->messageQueue) != NULL)
    {
    }
}

void SOUL_Effect()
{
}
