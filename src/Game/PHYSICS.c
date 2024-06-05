#include "common.h"
#include "Game/PHYSICS.h"
#include "Game/MATH3D.h"
#include "Game/PHYSICS.h"
#include "Game/GAMELOOP.h"
#include "Game/HASM.h"

int PHYSICS_CheckFaceStick(PCollideInfo *CInfo);
void PHYSICS_GenericLineCheck(Instance *instance, MATRIX *transMat, MATRIX *rotMat, PCollideInfo *cInfo);
void PHYSICS_GenericLineCheckMask(Instance *instance, MATRIX *transMat, MATRIX *rotMat, PCollideInfo *cInfo);

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

void PHYSICS_CheckLineInWorld(Instance *instance, PCollideInfo *pcollideInfo)
{
    pcollideInfo->collideType = 63;

    PHYSICS_CheckLineInWorldMask(instance, pcollideInfo);
}

void PHYSICS_CheckLineInWorldMask(Instance *instance, PCollideInfo *pcollideInfo)
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

void PhysicsDefaultLinkedMoveResponse(Instance *instance, evPhysicsLinkedMoveData *Data, int updateTransforms)
{
    instance->position.x += Data->posDelta.x;
    instance->position.y += Data->posDelta.y;
    instance->position.z += Data->posDelta.z;

    if (updateTransforms != 0)
    {
        COLLIDE_UpdateAllTransforms(instance, (SVECTOR *)&Data->posDelta);
    }

    instance->rotation.z += Data->rotDelta.z;
}

INCLUDE_ASM("asm/nonmatchings/Game/PHYSICS", PhysicsCheckGravity);

void PhysicsDefaultGravityResponse(Instance *instance, evPhysicsGravityData *Data)
{
    instance->position.x += Data->x;
    instance->position.y += Data->y;

    if ((instance == gameTrackerX.playerInstance) && (Data->z > 128))
    {
        instance->position.z += 128;
    }
    else
    {
        instance->position.z += Data->z;
    }
}

INCLUDE_ASM("asm/nonmatchings/Game/PHYSICS", PhysicsCheckEdgeGrabbing);

INCLUDE_ASM("asm/nonmatchings/Game/PHYSICS", PhysicsDefaultEdgeGrabResponse);

INCLUDE_ASM("asm/nonmatchings/Game/PHYSICS", PhysicsCheckSliding);

int PhysicsUpdateTface(Instance *instance, intptr_t Data)
{
    PCollideInfo CInfo;
    SVECTOR Old;
    SVECTOR New;

    CInfo.oldPoint = &Old;
    CInfo.newPoint = &New;

    Old.vx = New.vx = instance->position.x;
    Old.vy = New.vy = instance->position.y;
    Old.vz = New.vz = instance->position.z;

    Old.vz = New.vz + ((short *)Data)[0];

    New.vz -= ((short *)Data)[1];

    PHYSICS_CheckLineInWorld(instance, &CInfo);

    if (CInfo.type == 3)
    {
        if (instance->tface != CInfo.prim)
        {
            instance->oldTFace = instance->tface;
            instance->tface = (TFace *)CInfo.prim;
            instance->tfaceLevel = CInfo.inst;
            instance->bspTree = CInfo.segment;
        }

        return 1;
    }

    if (instance->tface != NULL)
    {
        instance->oldTFace = instance->tface;
        instance->tface = NULL;
        instance->tfaceLevel = NULL;
        instance->bspTree = 0;
    }

    return 0;
}

INCLUDE_ASM("asm/nonmatchings/Game/PHYSICS", PhysicsCheckBlockers);

INCLUDE_ASM("asm/nonmatchings/Game/PHYSICS", PhysicsCheckSwim);

INCLUDE_ASM("asm/nonmatchings/Game/PHYSICS", PhysicsDefaultCheckSwimResponse);

void PhysicsForceSetWater(Instance *instance, int *Time, int Depth, int rate, int maxAmplitude)
{
    int Amplitude;

    Amplitude = Depth;

    if (Amplitude < -3072)
    {
        Amplitude = -3072;
    }

    if (Amplitude > 0)
    {
        Amplitude = 0;
    }

    Amplitude = (Amplitude * maxAmplitude) / -3072;

    *Time += (rate << 12) / gameTrackerX.timeMult;

    if (*Time >= 4097)
    {
        *Time -= 4096;
    }

    if (Depth < 0)
    {
        instance->position.z += (Amplitude * rcos(*Time)) / 4096;
    }
}

int PhysicsCheckLOS(Instance *instance, intptr_t Data, int Mode)
{
    PCollideInfo CInfo;

    (void)Mode;
    CInfo.oldPoint = (SVECTOR *)(Data + 8);
    CInfo.newPoint = (SVECTOR *)Data;

    PHYSICS_CheckLineInWorld(instance, &CInfo);

    return CInfo.type == 0;
}

INCLUDE_ASM("asm/nonmatchings/Game/PHYSICS", PhysicsCheckDropHeight);

INCLUDE_ASM("asm/nonmatchings/Game/PHYSICS", PhysicsCheckDropOff);

INCLUDE_ASM("asm/nonmatchings/Game/PHYSICS", PhysicsFollowWall);

void PhysicsMoveLocalZClamp(Instance *instance, long segment, long time, long clamp)
{
    Position pos;
    SVECTOR v;
    SVECTOR dv;

    memset(&pos, 0, sizeof(Position));

    PhysicsMove(instance, &pos, time);

    v.vx = pos.x;
    v.vy = -pos.y;
    v.vz = pos.z;

    ApplyMatrixSV(&instance->matrix[segment], &v, &dv);

    instance->position.x += dv.vx;
    instance->position.y += dv.vy;

    if (clamp == 0)
    {
        instance->position.z += dv.vz;
    }
}

INCLUDE_ASM("asm/nonmatchings/Game/PHYSICS", PhysicsMove);

void PhysicsSetVelFromZRot(Instance *instance, short angle, long magnitude)
{
    instance->xVel = (rcos(angle - 1024) * magnitude) >> 12;
    instance->yVel = (rsin(angle - 1024) * magnitude) >> 12;
}

void PhysicsSetVelFromRot(Instance *instance, Rotation *rot, long magnitude)
{
    MATRIX mat;
    SVECTOR flatPt;
    SVECTOR newPt;

    (void)rot;
    flatPt.vx = 0;
    flatPt.vy = -magnitude;
    flatPt.vz = 0;

    RotMatrix((SVECTOR *)&instance->rotation, &mat);

    ApplyMatrixSV(&mat, &flatPt, &newPt);

    instance->xVel = newPt.vx;
    instance->yVel = newPt.vy;
    instance->zVel = newPt.vz;
}

void PHYSICS_SetVAndAFromRot(Instance *instance, Rotation *rot, long v, long a)
{
    SVECTOR flatPt;
    MATRIX mat;

    (void)rot;
    if ((v != 0) || (a != 0))
    {
        RotMatrix((SVECTOR *)&instance->rotation, &mat);

        flatPt.vx = 0;
        flatPt.vz = 0;
    }

    if (v != 0)
    {
        SVECTOR newPt;

        flatPt.vy = -v;

        ApplyMatrixSV(&mat, &flatPt, &newPt);

        instance->xVel = newPt.vx;
        instance->yVel = newPt.vy;
        instance->zVel = newPt.vz;
    }
    else
    {
        instance->xVel = 0;
        instance->yVel = 0;
        instance->zVel = 0;
    }

    if (a != 0)
    {
        SVECTOR newPt;

        flatPt.vy = -a;

        ApplyMatrixSV(&mat, &flatPt, &newPt);

        instance->xAccl = newPt.vx;
        instance->yAccl = newPt.vy;
        instance->zAccl = newPt.vz;
    }
    else
    {
        instance->xAccl = 0;
        instance->yAccl = 0;
        instance->zAccl = 0;
    }
}

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
    if (((instance->xAccl < 0) && (instance->xVel <= x)) || ((instance->xAccl > 0) && (instance->xVel >= x)))
    {
        instance->xAccl = 0;
        instance->xVel = x;
    }

    if (((instance->yAccl < 0) && (instance->yVel <= y)) || ((instance->yAccl > 0) && (instance->yVel >= y)))
    {
        instance->yAccl = 0;
        instance->yVel = y;
    }

    if (((instance->zAccl < 0) && (instance->zVel <= z)) || ((instance->zAccl > 0) && (instance->zVel >= z)))
    {
        instance->zAccl = 0;
        instance->zVel = z;
    }
}

int PHYSICS_CheckForTerrainCollide(Instance *instance, SVECTOR *startVec, SVECTOR *endVec, int segment)
{
    PCollideInfo CInfo;
    MATRIX *pTempMat;

    CInfo.oldPoint = startVec;
    CInfo.newPoint = endVec;

    pTempMat = &instance->matrix[segment];

    CInfo.collideType = 1;

    PHYSICS_GenericLineCheckMask(instance, pTempMat, pTempMat, &CInfo);

    return CInfo.type == 3;
}

int PHYSICS_CheckForObjectCollide(Instance *instance, SVECTOR *startVec, SVECTOR *endVec, int segment)
{
    PCollideInfo CInfo;
    MATRIX *pTempMat;

    CInfo.oldPoint = startVec;
    CInfo.newPoint = endVec;

    pTempMat = instance->matrix;

    CInfo.collideType = 62;

    PHYSICS_GenericLineCheckMask(instance, &pTempMat[segment], &pTempMat[segment], &CInfo);

    return CInfo.type != 0;
}

int PHYSICS_CheckForValidMove(Instance *instance, SVECTOR *startVec, SVECTOR *endVec, int segment)
{
    PCollideInfo CInfo;
    MATRIX *pTempMat;
    int rc;

    CInfo.oldPoint = startVec;
    CInfo.newPoint = endVec;

    pTempMat = &instance->matrix[segment];

    PHYSICS_GenericLineCheck(instance, pTempMat, pTempMat, &CInfo);

    rc = PHYSICS_CheckFaceStick(&CInfo) != 0;

    if ((CInfo.type == 2) || (CInfo.type == 3) || (CInfo.type == 5))
    {
        rc += 2;
    }

    return rc;
}

INCLUDE_ASM("asm/nonmatchings/Game/PHYSICS", PHYSICS_CheckFaceStick);

INCLUDE_ASM("asm/nonmatchings/Game/PHYSICS", PHYSICS_CheckDontGrabEdge);

void PHYSICS_GenericLineCheckSetup(short x, short y, short z, SVECTOR *inVec)
{
    inVec->vx = x;
    inVec->vy = y;
    inVec->vz = z;
}

void PHYSICS_GenericLineCheck(Instance *instance, MATRIX *transMat, MATRIX *rotMat, PCollideInfo *cInfo)
{
    cInfo->collideType = 63;

    PHYSICS_GenericLineCheckMask(instance, transMat, rotMat, cInfo);
}

void PHYSICS_GenericLineCheckMask(Instance *instance, MATRIX *transMat, MATRIX *rotMat, PCollideInfo *cInfo)
{
    SVECTOR *startVec;
    SVECTOR *endVec;
    VECTOR outVec;

    startVec = cInfo->oldPoint;
    endVec = cInfo->newPoint;

    gte_SetRotMatrix(&rotMat->m[0][0]);
    gte_ldv0(&startVec->vx);
    gte_nrtv0();
    gte_stlvnl(&outVec);

    startVec->vx = (short)(transMat->t[0] + outVec.vx);
    startVec->vy = (short)(transMat->t[1] + outVec.vy);
    startVec->vz = (short)(transMat->t[2] + outVec.vz);

    gte_SetRotMatrix(&rotMat->m[0][0]);
    gte_ldv0(&endVec->vx);
    gte_nrtv0();
    gte_stlvnl(&outVec);

    endVec->vx = (short)(transMat->t[0] + outVec.vx);
    endVec->vy = (short)(transMat->t[1] + outVec.vy);
    endVec->vz = (short)(transMat->t[2] + outVec.vz);

    PHYSICS_CheckLineInWorldMask(instance, cInfo);
}
