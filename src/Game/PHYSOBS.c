#include "common.h"
#include "Game/PHYSOBS.h"
#include "Game/MATH3D.h"
#include "Game/PHYSICS.h"
#include "Game/STATE.h"

INCLUDE_ASM("asm/nonmatchings/Game/PHYSOBS", PHYSOB_PlayDropSound);

INCLUDE_ASM("asm/nonmatchings/Game/PHYSOBS", PHYSOBS_IsAPushBlockAttached);

INCLUDE_ASM("asm/nonmatchings/Game/PHYSOBS", PHYSOBS_IsAnythingAttached);

INCLUDE_ASM("asm/nonmatchings/Game/PHYSOBS", CheckPhysOb);

INCLUDE_ASM("asm/nonmatchings/Game/PHYSOBS", CheckPhysObAbility);

INCLUDE_ASM("asm/nonmatchings/Game/PHYSOBS", CheckPhysObFamily);

INCLUDE_ASM("asm/nonmatchings/Game/PHYSOBS", GetPhysicalAbility);

INCLUDE_ASM("asm/nonmatchings/Game/PHYSOBS", AnyBlocksInMotion);

INCLUDE_ASM("asm/nonmatchings/Game/PHYSOBS", SetThrowDirection);

INCLUDE_ASM("asm/nonmatchings/Game/PHYSOBS", ThrowPhysOb);

INCLUDE_ASM("asm/nonmatchings/Game/PHYSOBS", PushPhysOb);

INCLUDE_ASM("asm/nonmatchings/Game/PHYSOBS", ResetSwitchPhysOb);

INCLUDE_ASM("asm/nonmatchings/Game/PHYSOBS", SwitchPhysOb);

INCLUDE_ASM("asm/nonmatchings/Game/PHYSOBS", InteractPhysOb);

INCLUDE_ASM("asm/nonmatchings/Game/PHYSOBS", ResetOrientation);

INCLUDE_ASM("asm/nonmatchings/Game/PHYSOBS", FinishPush);

INCLUDE_ASM("asm/nonmatchings/Game/PHYSOBS", PhysOb_AlignPush);

INCLUDE_ASM("asm/nonmatchings/Game/PHYSOBS", FlipPhysOb);

INCLUDE_ASM("asm/nonmatchings/Game/PHYSOBS", CanBePickedUp);

INCLUDE_ASM("asm/nonmatchings/Game/PHYSOBS", PickUpPhysOb);

INCLUDE_ASM("asm/nonmatchings/Game/PHYSOBS", PHYSOB_BirthCollectible);

INCLUDE_ASM("asm/nonmatchings/Game/PHYSOBS", PHYSOB_BirthProjectile);

INCLUDE_ASM("asm/nonmatchings/Game/PHYSOBS", BirthProjectilePhysOb);

INCLUDE_ASM("asm/nonmatchings/Game/PHYSOBS", PHYSOB_SetLightTable);

INCLUDE_ASM("asm/nonmatchings/Game/PHYSOBS", PHYSOB_EndLighting);

INCLUDE_ASM("asm/nonmatchings/Game/PHYSOBS", PHYSOB_StartLighting);

INCLUDE_ASM("asm/nonmatchings/Game/PHYSOBS", PHYSOB_StartBurnFX);

INCLUDE_ASM("asm/nonmatchings/Game/PHYSOBS", PHYSOB_StartBurning);

INCLUDE_ASM("asm/nonmatchings/Game/PHYSOBS", PHYSOB_StopLighting);

INCLUDE_ASM("asm/nonmatchings/Game/PHYSOBS", PHYSOB_StopBurning);

INCLUDE_ASM("asm/nonmatchings/Game/PHYSOBS", PHYSOB_EndBurning);

INCLUDE_ASM("asm/nonmatchings/Game/PHYSOBS", StopPhysOb);

INCLUDE_ASM("asm/nonmatchings/Game/PHYSOBS", InitPhysicalObject);

INCLUDE_ASM("asm/nonmatchings/Game/PHYSOBS", ProcessPhysicalObject);

INCLUDE_ASM("asm/nonmatchings/Game/PHYSOBS", PhysicalObjectQuery);

INCLUDE_ASM("asm/nonmatchings/Game/PHYSOBS", PhysicalObjectPost);

INCLUDE_ASM("asm/nonmatchings/Game/PHYSOBS", PhysobAnimCallback);

INCLUDE_ASM("asm/nonmatchings/Game/PHYSOBS", CheckForceCollision);

INCLUDE_ASM("asm/nonmatchings/Game/PHYSOBS", GetObliqueDirection);

INCLUDE_ASM("asm/nonmatchings/Game/PHYSOBS", CollidePhysicalObject);

INCLUDE_ASM("asm/nonmatchings/Game/PHYSOBS", PhysObGetWeapon);

INCLUDE_ASM("asm/nonmatchings/Game/PHYSOBS", PhysObGetLight);

INCLUDE_ASM("asm/nonmatchings/Game/PHYSOBS", PhysObGetSplinter);

INCLUDE_ASM("asm/nonmatchings/Game/PHYSOBS", TurnOnCollisionPhysOb);

INCLUDE_ASM("asm/nonmatchings/Game/PHYSOBS", TurnOffCollisionPhysOb);

INCLUDE_ASM("asm/nonmatchings/Game/PHYSOBS", GetPhysObCollisionType);

INCLUDE_ASM("asm/nonmatchings/Game/PHYSOBS", ExecuteThrow);

INCLUDE_ASM("asm/nonmatchings/Game/PHYSOBS", ExecuteDrag);

INCLUDE_ASM("asm/nonmatchings/Game/PHYSOBS", ExecuteSlideToStop);

INCLUDE_ASM("asm/nonmatchings/Game/PHYSOBS", ExecuteFlip);

INCLUDE_ASM("asm/nonmatchings/Game/PHYSOBS", CheckSlope);

INCLUDE_ASM("asm/nonmatchings/Game/PHYSOBS", CheckBlockSlope);

INCLUDE_ASM("asm/nonmatchings/Game/PHYSOBS", PHYSOBS_FigureDragForSlope);

INCLUDE_ASM("asm/nonmatchings/Game/PHYSOBS", PHYSOB_CheckThrownLineCollision);

INCLUDE_ASM("asm/nonmatchings/Game/PHYSOBS", PHYSOB_CheckDroppedLineCollision);

INCLUDE_ASM("asm/nonmatchings/Game/PHYSOBS", PHYSOB_CheckDirectedLineCollision);

INCLUDE_ASM("asm/nonmatchings/Game/PHYSOBS", PHYSOBS_CheckForStackedForwardHits);

INCLUDE_ASM("asm/nonmatchings/Game/PHYSOBS", PHYSOBS_SetNewAnim);

INCLUDE_ASM("asm/nonmatchings/Game/PHYSOBS", PHYSOB_CheckForEnemyInBlkSpot);

INCLUDE_ASM("asm/nonmatchings/Game/PHYSOBS", PHYSOBS_CheckForValidMove);

INCLUDE_ASM("asm/nonmatchings/Game/PHYSOBS", ExecuteGravitate);

INCLUDE_ASM("asm/nonmatchings/Game/PHYSOBS", ExecuteFollow);

void PHYSOB_Normalize(SVector *v)
{
    long len;

    len = MATH3D_SquareLength(v->x, v->y, v->z);

    if (len != 0)
    {
        len = MATH3D_FastSqrt0(len);
    }
    else
    {
        len = 1;
    }

    v->x = ((v->x << 12) / len);
    v->y = ((v->y << 12) / len);
    v->z = ((v->z << 12) / len);
}

INCLUDE_ASM("asm/nonmatchings/Game/PHYSOBS", PHYSOB_MoveTowardsAlign);

INCLUDE_ASM("asm/nonmatchings/Game/PHYSOBS", PHYSOB_ReAlignFalling);

INCLUDE_ASM("asm/nonmatchings/Game/PHYSOBS", DropPhysOb);

INCLUDE_ASM("asm/nonmatchings/Game/PHYSOBS", PhysicalRelocateTune);

int PHYSOBS_CheckObjectAxisAlignment(MATRIX *m0, MATRIX *m1, SVector *axis)
{
    VECTOR r0;
    VECTOR r1;
    SVector v0;
    SVector v1;

    ApplyMatrix(m0, (SVECTOR *)axis, &r0);
    ApplyMatrix(m1, (SVECTOR *)axis, &r1);

    v0.x = r0.vx;
    v0.y = r0.vy;
    v0.z = r0.vz;

    v1.x = r1.vx;
    v1.y = r1.vy;
    v1.z = r1.vz;

    return (short)(((v0.x * v1.x) + (v0.y * v1.y) + (v0.z * v1.z)) >> 12);
}

INCLUDE_ASM("asm/nonmatchings/Game/PHYSOBS", PHYSOB_CheckSlide);

int PHYSOB_CheckSlide2(Instance *instance, int x, int y, evPhysicsSlideData **data)
{
    *data = (evPhysicsSlideData *)SetPhysicsSlideData(1, (short)(x * 704), (short)(y * 704), 0, 640, 640, -150);

    return PhysicsCheckSliding(instance, (intptr_t)*data, 1);
}

int PHYSOB_CheckDropOnSlope(Instance *instance, int x, int y, evPhysicsSlideData **data)
{
    *data = (evPhysicsSlideData *)SetPhysicsSlideData(1, (short)(x * 704), (short)(y * 704), 0, 2560, 640, -160);

    return PhysicsCheckSliding(instance, (intptr_t)*data, 1);
}

int PHYSOB_CheckSlideNormal(Instance *instance, int x, int y, evPhysicsSlideData **data)
{
    PHYSOB_NormalToAxis((short *)&x, (short *)&y);

    return PHYSOB_CheckSlide2(instance, x, y, data);
}

void PHYSOB_NormalToAxis(short *x, short *y)
{
    int x1;
    int y1;

    x1 = *x;
    y1 = *y;

    if (x1 >= 1025)
    {
        *x = 1;
    }
    else if (x1 < -1024)
    {
        *x = -1;
    }
    else
    {
        *x = 0;
    }

    if (y1 >= 1025)
    {
        *y = 1;
        return;
    }

    if (y1 < -1024)
    {
        *y = -1;
        return;
    }

    *y = 0;
}
