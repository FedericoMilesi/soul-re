#include "common.h"
#include "Game/INSTANCE.h"
#include "Game/COLLIDE.h"
#include "Game/STREAM.h"

void SetNoPtCollideInFamily(Instance *instance)
{
    Instance *child;

    child = instance->LinkChild;

    instance->flags |= 0x40;

    while (child != NULL)
    {
        SetNoPtCollideInFamily(child);

        child = child->LinkSibling;
    }
}

void ResetNoPtCollideInFamily(Instance *instance)
{
    Instance *child;

    child = instance->LinkChild;

    instance->flags &= ~0x40;

    while (child != NULL)
    {
        ResetNoPtCollideInFamily(child);

        child = child->LinkSibling;
    }
}

void PHYSICS_CheckLineInWorld(Instance *instance, _PCollideInfo *pcollideInfo)
{
    pcollideInfo->collideType = 63;

    PHYSICS_CheckLineInWorldMask(instance, pcollideInfo);
}

void PHYSICS_CheckLineInWorldMask(Instance *instance, _PCollideInfo *pcollideInfo)
{
    Level *level;

    level = STREAM_GetLevelWithID(instance->currentStreamUnitID);

    pcollideInfo->inst = NULL;
    pcollideInfo->instance = instance;

    SetNoPtCollideInFamily(instance);

    if (level != NULL)
    {
        COLLIDE_PointAndWorld(pcollideInfo, level);
    }
    else
    {
        pcollideInfo->type = 0;
    }

    ResetNoPtCollideInFamily(instance);
}

INCLUDE_ASM("asm/nonmatchings/Game/PHYSICS", PhysicsCheckLinkedMove);

INCLUDE_ASM("asm/nonmatchings/Game/PHYSICS", PhysicsDefaultLinkedMoveResponse);

INCLUDE_ASM("asm/nonmatchings/Game/PHYSICS", PhysicsCheckGravity);

INCLUDE_ASM("asm/nonmatchings/Game/PHYSICS", PhysicsDefaultGravityResponse);

INCLUDE_ASM("asm/nonmatchings/Game/PHYSICS", PhysicsCheckEdgeGrabbing);

INCLUDE_ASM("asm/nonmatchings/Game/PHYSICS", PhysicsDefaultEdgeGrabResponse);

INCLUDE_ASM("asm/nonmatchings/Game/PHYSICS", PhysicsCheckSliding);

INCLUDE_ASM("asm/nonmatchings/Game/PHYSICS", PhysicsUpdateTface);

INCLUDE_ASM("asm/nonmatchings/Game/PHYSICS", PhysicsCheckBlockers);

INCLUDE_ASM("asm/nonmatchings/Game/PHYSICS", PhysicsCheckSwim);

INCLUDE_ASM("asm/nonmatchings/Game/PHYSICS", PhysicsDefaultCheckSwimResponse);

INCLUDE_ASM("asm/nonmatchings/Game/PHYSICS", PhysicsForceSetWater);

INCLUDE_ASM("asm/nonmatchings/Game/PHYSICS", PhysicsCheckLOS);

INCLUDE_ASM("asm/nonmatchings/Game/PHYSICS", PhysicsCheckDropHeight);

INCLUDE_ASM("asm/nonmatchings/Game/PHYSICS", PhysicsCheckDropOff);

INCLUDE_ASM("asm/nonmatchings/Game/PHYSICS", PhysicsFollowWall);

INCLUDE_ASM("asm/nonmatchings/Game/PHYSICS", PhysicsMoveLocalZClamp);

INCLUDE_ASM("asm/nonmatchings/Game/PHYSICS", PhysicsMove);

INCLUDE_ASM("asm/nonmatchings/Game/PHYSICS", PhysicsSetVelFromZRot);

INCLUDE_ASM("asm/nonmatchings/Game/PHYSICS", PhysicsSetVelFromRot);

INCLUDE_ASM("asm/nonmatchings/Game/PHYSICS", PHYSICS_SetVAndAFromRot);

long PHYSICS_FindAFromDAndT(long d, long t)
{
    if (t != 0)
    {
        t = (d * 8192) / (t * t);

        return t / 4096;
    }

    return 0;
}

long PHYSICS_FindVFromAAndD(long a, long d)
{
    long vsq;

    vsq = a * 2 * d;

    if (vsq != 0)
    {
        return MATH3D_FastSqrt0(vsq);
    }

    return 0;
}

void PHYSICS_StopIfCloseToTarget(Instance *instance, int x, int y, int z)
{
    if ((instance->xAccl < 0) && (instance->xVel <= x) || (instance->xAccl > 0) && (instance->xVel >= x))
    {
        instance->xAccl = 0;
        instance->xVel = x;
    }

    if ((instance->yAccl < 0) && (instance->yVel <= y) || (instance->yAccl > 0) && (instance->yVel >= y))
    {
        instance->yAccl = 0;
        instance->yVel = y;
    }

    if ((instance->zAccl < 0) && (instance->zVel <= z) || (instance->zAccl > 0) && (instance->zVel >= z))
    {
        instance->zAccl = 0;
        instance->zVel = z;
    }
}

INCLUDE_ASM("asm/nonmatchings/Game/PHYSICS", PHYSICS_CheckForTerrainCollide);

INCLUDE_ASM("asm/nonmatchings/Game/PHYSICS", PHYSICS_CheckForObjectCollide);

INCLUDE_ASM("asm/nonmatchings/Game/PHYSICS", PHYSICS_CheckForValidMove);

INCLUDE_ASM("asm/nonmatchings/Game/PHYSICS", PHYSICS_CheckFaceStick);

INCLUDE_ASM("asm/nonmatchings/Game/PHYSICS", PHYSICS_CheckDontGrabEdge);

INCLUDE_ASM("asm/nonmatchings/Game/PHYSICS", PHYSICS_GenericLineCheckSetup);

INCLUDE_ASM("asm/nonmatchings/Game/PHYSICS", PHYSICS_GenericLineCheck);

INCLUDE_ASM("asm/nonmatchings/Game/PHYSICS", PHYSICS_GenericLineCheckMask);
