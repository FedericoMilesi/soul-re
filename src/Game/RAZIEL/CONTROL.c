#include "common.h"
#include "Game/RAZIEL/CONTROL.h"
#include "Game/PLAYER.h"

EXTERN STATIC Force *ExternalForces;

void SetPhysics(Instance *instance, short gravity, long x, long y, long z)
{
    SetExternalForce(ExternalForces, 0, 0, gravity, 0, 4096);

    instance->xVel = x;
    instance->yVel = y;
    instance->zVel = z;
}

void ResetPhysics(Instance *instance, short gravity)
{
    int i;

    SetExternalForce(ExternalForces, 0, 0, gravity, 0, 4096);

    for (i = 1; i < 4; i++)
    {
        SetExternalForce(&ExternalForces[i], 0, 0, 0, 0, 0);
    }

    instance->xVel = 0;
    instance->yVel = 0;
    instance->zVel = 0;

    instance->xAccl = 0;
    instance->yAccl = 0;
    instance->zAccl = gravity;
}

void SetDampingPhysics(Instance *instance, int damping)
{
    instance->xAccl = -((instance->xVel * damping) / 4096);
    instance->yAccl = -((instance->yVel * damping) / 4096);
    instance->zAccl = -((instance->zVel * damping) / 4096);

    SetExternalForce(ExternalForces, (short)instance->xAccl, (short)instance->yAccl, (short)instance->zAccl, 0, 4096);
}

void SetImpulsePhysics(Instance *instance, Player *player)
{
    int Dot;
    int vLength;

    if (!(player->Mode & 0x40000))
    {
        Dot = -instance->offset.x * player->iVelocity.x;
        Dot += -instance->offset.y * player->iVelocity.y;
        Dot += -instance->offset.z * player->iVelocity.z;

        vLength = player->iVelocity.x * player->iVelocity.x;
        vLength += player->iVelocity.y * player->iVelocity.y;
        vLength += player->iVelocity.z * player->iVelocity.z;

        if (vLength != 0)
        {
            instance->position.x += instance->offset.x + ((Dot * player->iVelocity.x) / vLength);
            instance->position.y += instance->offset.y + ((Dot * player->iVelocity.y) / vLength);
            instance->position.z += instance->offset.z + ((Dot * player->iVelocity.z) / vLength);
        }
    }
}

void SetDropPhysics(Instance *instance, Player *player)
{
    (void)instance;
    (void)player;

    SetExternalForce(ExternalForces, 0, 4, -16, 0, 4096);
}

void InitExternalForces(Force *Forces, int MaxForces)
{
    int i;

    for (i = MaxForces - 1; i != 0; i--)
    {
        Forces[i].Friction = 0;

        Forces[i].LinearForce.x = 0;
        Forces[i].LinearForce.y = 0;
        Forces[i].LinearForce.z = 0;
    }

    ExternalForces = Forces;
}

//void SetExternalForce(Force *In, short x, short y, short z, int Space, int Friction)
void SetExternalForce(Force *In, short x, short y, short z, short Space, int Friction)
{
    In->LinearForce.x = x;
    In->LinearForce.y = y;
    In->LinearForce.z = z;

    In->Friction = Friction;

    In->Type = Space;
}

void SetExternalTransitionForce(Force *in, Instance *instance, int time, int x, int y, int z)
{
    in->Type = 2;

    in->LinearForce.x = (x - instance->xVel) / time;
    in->LinearForce.y = (y - instance->yVel) / time;
    in->LinearForce.z = (z - instance->zVel) / time;

    in->Friction = (short)time;
}

INCLUDE_ASM("asm/nonmatchings/Game/RAZIEL/CONTROL", ProcessPhysics);

INCLUDE_ASM("asm/nonmatchings/Game/RAZIEL/CONTROL", ApplyExternalLocalForces);
