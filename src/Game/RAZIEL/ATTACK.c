#include "common.h"
#include "Game/RAZIEL/ATTACK.h"
#include "Game/RAZIEL/RAZIEL.h"
#include "Game/MATH3D.h"
#include "Game/G2/ANMCTRLR.h"

INCLUDE_ASM("asm/nonmatchings/Game/RAZIEL/ATTACK", StateHandlerDecodeHold);

INCLUDE_ASM("asm/nonmatchings/Game/RAZIEL/ATTACK", StateHandlerAttack2);

INCLUDE_ASM("asm/nonmatchings/Game/RAZIEL/ATTACK", StateHandlerCannedReaction);

INCLUDE_ASM("asm/nonmatchings/Game/RAZIEL/ATTACK", StateHandlerStumble);

INCLUDE_ASM("asm/nonmatchings/Game/RAZIEL/ATTACK", StateHandlerHitReaction);

INCLUDE_ASM("asm/nonmatchings/Game/RAZIEL/ATTACK", StateHandlerThrow2);

void PointAt(Instance *instance, Position *Target, Rotation *Rot1)
{
    Position From;
    SVECTOR v1;
    VECTOR v3;
    MATRIX *tempMat;

    tempMat = instance->matrix;

    v1.vx = Raziel.throwData->launchPointX;
    v1.vy = Raziel.throwData->launchPointY;
    v1.vz = Raziel.throwData->launchPointZ;

    ApplyMatrix(tempMat, &v1, &v3);

    v3.vx += instance->position.x;
    v3.vy += instance->position.y;
    v3.vz += instance->position.z;

    From.x = (short)v3.vx;
    From.y = (short)v3.vy;
    From.z = (short)v3.vz;

    MATH3D_RotationFromPosToPos(&From, Target, Rot1);

    Rot1->z -= instance->rotation.z;
    Rot1->y = 0;

    LimitRotation(Rot1);

    if (G2Anim_IsControllerActive(&instance->anim, 14, 14) == G2FALSE)
    {
        G2Anim_EnableController(&instance->anim, 14, 14);
    }

    MATH3D_ZYXtoXYZ(Rot1);

    G2Anim_SetController_Vector(&instance->anim, 14, 14, (G2SVector3 *)Rot1);
}

INCLUDE_ASM("asm/nonmatchings/Game/RAZIEL/ATTACK", ThrowSetFocusPoint);

void LimitRotation(Rotation *rot)
{
    rot->z &= 0xFFF;
    rot->x &= 0xFFF;

    while (rot->z >= 4097)
    {
        rot->z -= 4096;
    }

    if (rot->z > 0)
    {
        if (rot->z < 2048)
        {
            if (Raziel.throwData->maxZRotation < rot->z)
            {
                rot->z = Raziel.throwData->maxZRotation;
            }
        }
        else if (rot->z < Raziel.throwData->minZRotation)
        {
            rot->z = Raziel.throwData->minZRotation;
        }
    }
    else
    {
        rot->z += 4096;

        if (rot->z < Raziel.throwData->minZRotation)
        {
            rot->z = Raziel.throwData->minZRotation;
        }
    }

    while (rot->x >= 4097)
    {
        rot->x -= 4096;
    }

    if (rot->x > 0)
    {
        if (rot->x < 2048)
        {
            if (Raziel.throwData->maxXRotation < rot->x)
            {
                rot->x = Raziel.throwData->maxXRotation;
            }
        }
        else if (rot->x < Raziel.throwData->minXRotation)
        {
            rot->x = Raziel.throwData->minXRotation;
        }
    }
    else
    {
        rot->x += 4096;

        if (rot->x < Raziel.throwData->minXRotation)
        {
            rot->x = Raziel.throwData->minXRotation;
        }
    }
}

INCLUDE_ASM("asm/nonmatchings/Game/RAZIEL/ATTACK", StateHandlerGrab);
