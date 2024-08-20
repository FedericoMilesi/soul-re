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

int PHYSOBS_FigureDragForSlope(Instance *instance, int pathNumber, int *result)
{
    int didSomething;

    didSomething = 0;

    do {} while (0); // garbage code for reodering

    if ((PHYSOBS_IsAPushBlockAttached(instance) != NULL) || (pathNumber == 5) || (pathNumber == 1) || (pathNumber == 7) || (pathNumber == 4) || (pathNumber == 2) || (didSomething = 0, pathNumber == 3))
    {
        *result = 0;

        didSomething = 1;
    }

    return didSomething;
}

INCLUDE_ASM("asm/nonmatchings/Game/PHYSOBS", PHYSOB_CheckThrownLineCollision);

INCLUDE_ASM("asm/nonmatchings/Game/PHYSOBS", PHYSOB_CheckDroppedLineCollision);

INCLUDE_ASM("asm/nonmatchings/Game/PHYSOBS", PHYSOB_CheckDirectedLineCollision);

long PHYSOBS_CheckForStackedForwardHits(Instance *block, long xoffset, long yoffset)
{
    Instance *attachedBlock;
    long result;

    result = 0;

    attachedBlock = PHYSOBS_IsAPushBlockAttached(block);

    while (attachedBlock != NULL)
    {
        if (PHYSOB_CheckDirectedLineCollision(attachedBlock, xoffset, yoffset, 0) != 0)
        {
            result = 1;
            break;
        }

        attachedBlock = PHYSOBS_IsAPushBlockAttached(attachedBlock);
    }

    return result;
}

void PHYSOBS_SetNewAnim(Instance *instance, PhysObData *Data, unsigned long modeBits, int path, int resetflg)
{
    Data->PathNumber = (short)path;

    Data->Mode = (Data->Mode & ~0x1) | modeBits;

    if (resetflg != 0)
    {
        ResetOrientation(instance);
    }

    PhysOb_AlignPush(instance, (int)Data->xForce, (int)Data->yForce, path, Data);
}

INCLUDE_ASM("asm/nonmatchings/Game/PHYSOBS", PHYSOB_CheckForEnemyInBlkSpot);

INCLUDE_ASM("asm/nonmatchings/Game/PHYSOBS", PHYSOBS_CheckForValidMove);

void ExecuteGravitate(Instance *instance)
{
    PhysObData *Data;
    Instance *Force;
    G2EulerAngles ea;
    Vector Position;
    Model *model;
    MATRIX *forceMatrix;
    int scale;

    Data = (PhysObData *)instance->extraData;

    Force = Data->Force;

    model = instance->object->modelList[0];

    forceMatrix = &Force->matrix[Data->LinkNode];

    if (CheckPhysObAbility(instance, 1) != 0)
    {
        COLLIDE_SegmentCollisionOff(instance, 1);
    }

    if (Data->Steps != 0)
    {
        G2EulerAngles_FromMatrix(&ea, (G2Matrix *)forceMatrix, 21);

        if (Data->Step == 0)
        {
            Data->rx1 = instance->rotation.x;
            Data->ry1 = instance->rotation.y;
            Data->rz1 = instance->rotation.z;

            Data->px = instance->position.x;
            Data->py = instance->position.y;
            Data->pz = instance->position.z;
        }

        instance->rotation.x = Data->rx1 + (((ea.x - Data->rx1) * Data->Step) / Data->Steps);
        instance->rotation.y = Data->ry1 + (((ea.y - Data->ry1) * Data->Step) / Data->Steps);
        instance->rotation.z = Data->rz1 + (((ea.z - Data->rz1) * Data->Step) / Data->Steps);

        ApplyMatrix(&instance->matrix[2], (SVECTOR *)&model->segmentList[2].px, (VECTOR *)&Position);

        Position.x = forceMatrix->t[0] - Position.x;
        Position.y = forceMatrix->t[1] - Position.y;
        Position.z = forceMatrix->t[2] - Position.z;

        instance->position.x = (short)(Data->px + (((Position.x - Data->px) * Data->Step) / Data->Steps));
        instance->position.y = (short)(Data->py + (((Position.y - Data->py) * Data->Step) / Data->Steps));
        instance->position.z = (short)(Data->pz + (((Position.z - Data->pz) * Data->Step) / Data->Steps));

        Data->Step++;
    }

    if ((Data->Mode & 0x20000))
    {
        if (Data->Steps == 0)
        {
            scale = 4096;
        }
        else
        {
            scale = 4096 - ((Data->Step << 12) / Data->Steps);
        }

        instance->scale.x = instance->scale.y = instance->scale.z = scale;
    }

    if (Data->Step == Data->Steps)
    {
        if ((Data->Mode & 0x20000))
        {
            INSTANCE_KillInstance(instance);
        }
        else
        {
            Data->Mode = (Data->Mode & ~0x1024005) | 0x1080;

            TurnOffCollisionPhysOb(instance, 7);

            INSTANCE_LinkToParent(instance, Force, Data->LinkNode);

            Data->Force = NULL;

            Data->Step = 0;
            Data->Steps = 0;

            instance->xVel = 0;
            instance->yVel = 0;
            instance->zVel = 0;

            instance->xAccl = 0;
            instance->yAccl = 0;
            instance->zAccl = 0;
        }
    }
}

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

void DropPhysOb(Instance *instance, int flags)
{
    PhysObData *Data;
    Instance *parent;
    int temp; // not from decls.h

    parent = instance->LinkParent;

    Data = (PhysObData *)instance->extraData;

    if (parent != NULL)
    {
        INSTANCE_UnlinkFromParent(instance);
    }
    else
    {
        Data->Mode &= ~0x800000;
    }

    PHYSOB_CheckDroppedLineCollision(instance, parent);

    if ((flags & 0x2))
    {
        Data->Mode = (Data->Mode & ~0x90) | 0x1000;

        instance->zAccl = 0;
    }
    else
    {
        if (!(flags & 0x4))
        {
            temp = 0;

            if (parent != NULL)
            {
                temp = -900;
            }

            PHYSOB_ReAlignFalling(instance, temp);
        }

        Data->throwingInstance = parent;

        Data->Mode = (Data->Mode & ~0x1090) | 0x400004;

        instance->zAccl = -10;
    }

    instance->xVel = 0;
    instance->yVel = 0;
    instance->zVel = 0;

    instance->xAccl = 0;
    instance->yAccl = 0;
}

void PhysicalRelocateTune(Object *object, long offset)
{
    PhysObWeaponProperties *properties;
    PhysObLight *pLight;

    properties = (PhysObWeaponProperties *)object->data;

    if (properties != NULL)
    {
        if (properties->Properties.family == 0)
        {
            pLight = (PhysObLight *)OFFSET_DATA(properties->WeaponAttributes.Light, offset);

            properties->WeaponAttributes.Light = pLight;

            if (pLight != NULL)
            {
                pLight->lightTable = (LightTableEntry *)OFFSET_DATA(pLight->lightTable, offset);
            }

            properties->WeaponAttributes.splinter.splinterData = (void *)OFFSET_DATA(properties->WeaponAttributes.splinter.splinterData, offset);
        }

        if (properties->Properties.family == 3)
        {
            PhysObInteractProperties *prop;
            PhysObWeaponAttributes *weapon;

            prop = (PhysObInteractProperties *)object->data;

            prop->weapon = (PhysObWeaponAttributes *)OFFSET_DATA(prop->weapon, offset);

            weapon = prop->weapon;

            if (weapon != NULL)
            {
                weapon->Light = (PhysObLight *)OFFSET_DATA(weapon->Light, offset);

                pLight = weapon->Light;

                if (pLight != NULL)
                {
                    pLight->lightTable = (LightTableEntry *)OFFSET_DATA(pLight->lightTable, offset);
                }

                weapon->splinter.splinterData = (void *)OFFSET_DATA(weapon->splinter.splinterData, offset);
            }
        }

        if (properties->Properties.family == 7)
        {
            PhysObProjectileProperties *prop;
            PhysObProjectileData *temp; // not from decls.h

            prop = (PhysObProjectileProperties *)object->data;

            prop->data = (PhysObProjectileData *)OFFSET_DATA(prop->data, offset);

            if (prop->data != NULL)
            {
                int i;

                temp = prop->data;

                for (i = 0; i < prop->totalProjectiles; i++)
                {
                    temp[i].weapon = (PhysObWeaponAttributes *)OFFSET_DATA(temp[i].weapon, offset);

                    if (temp[i].weapon != NULL)
                    {
                        pLight = temp[i].weapon->Light;

                        if (pLight != NULL)
                        {
                            pLight->lightTable = (LightTableEntry *)OFFSET_DATA(pLight->lightTable, offset);
                        }
                    }
                }
            }
        }
    }
}

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

int PHYSOB_CheckSlide(Instance *instance, int x, int y, evPhysicsSlideData **data)
{
    *data = (evPhysicsSlideData *)SetPhysicsSlideData(1, (short)(x * 704), (short)(y * 704), 0, 640, 640, -160);

    return PhysicsCheckSliding(instance, (intptr_t)*data, 1);
}

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
