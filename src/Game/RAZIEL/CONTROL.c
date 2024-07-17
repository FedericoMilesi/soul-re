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

INCLUDE_ASM("asm/nonmatchings/Game/RAZIEL/CONTROL", ResetPhysics);

INCLUDE_ASM("asm/nonmatchings/Game/RAZIEL/CONTROL", SetDampingPhysics);

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

INCLUDE_ASM("asm/nonmatchings/Game/RAZIEL/CONTROL", SetDropPhysics);

INCLUDE_ASM("asm/nonmatchings/Game/RAZIEL/CONTROL", InitExternalForces);

INCLUDE_ASM("asm/nonmatchings/Game/RAZIEL/CONTROL", SetExternalForce);

INCLUDE_ASM("asm/nonmatchings/Game/RAZIEL/CONTROL", SetExternalTransitionForce);

INCLUDE_ASM("asm/nonmatchings/Game/RAZIEL/CONTROL", ProcessPhysics);

INCLUDE_ASM("asm/nonmatchings/Game/RAZIEL/CONTROL", ApplyExternalLocalForces);
