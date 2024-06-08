#include "common.h"
#include "Game/G2/INSTNCG2.h"
#include "Game/GAMELOOP.h"
#include "Game/MATH3D.h"

INCLUDE_ASM("asm/nonmatchings/Game/G2/INSTNCG2", G2Instance_BuildTransformsForList);

void G2Instance_BuildTransforms(Instance *instance)
{
    if ((instance->object->animList != NULL) && (!(instance->object->oflags2 & 0x40000000)))
    {
        _G2Instance_BuildAnimatedTransforms(instance);
    }
    else
    {
        _G2Instance_BuildNonAnimatedTransforms(instance);
    }
}

void G2Instance_RebuildTransforms(Instance *instance)
{
    if ((instance->object->animList != NULL) && (!(instance->object->oflags2 & 0x40000000)))
    {
        _G2Instance_RebuildAnimatedTransforms(instance);
    }
    else
    {
        _G2Instance_RebuildNonAnimatedTransforms(instance);
    }
}

G2AnimKeylist *G2Instance_GetKeylist(Instance *instance, int id)
{
    return instance->object->animList[id];
}

INCLUDE_ASM("asm/nonmatchings/Game/G2/INSTNCG2", _G2Instance_RebuildAnimatedTransforms);

void G2Instance_ClearMatrices(Instance *instance)
{
    instance->oldMatrix = instance->matrix;
    instance->matrix = NULL;

    instance = instance->LinkChild;

    while (instance != NULL)
    {
        G2Instance_ClearMatrices(instance);

        instance = instance->LinkSibling;
    }
}

void _G2Instance_BuildAnimatedTransforms(Instance *instance)
{
    MATRIX *rootMatrix;
    Model *model;

    if (((instance->flags2 & 0x10000000)) && (((instance->flags2 & 0x4000000)) || (((instance->flags2 & 0x20000000)) && ((instance->flags & 0x800)))))
    {
        G2Instance_ClearMatrices(instance);

        return;
    }

    model = instance->object->modelList[instance->currentModel];

    rootMatrix = (MATRIX *)GAMELOOP_GetMatrices(model->numSegments + 1);

    if (rootMatrix == NULL)
    {
        instance->matrix = NULL;
    }
    else
    {
        instance->oldMatrix = instance->matrix;
        instance->matrix = &rootMatrix[1];

        _G2Instance_RebuildAnimatedTransforms(instance);
    }
}

INCLUDE_ASM("asm/nonmatchings/Game/G2/INSTNCG2", _G2Instance_RebuildNonAnimatedTransforms);

void _G2Instance_BuildDeactivatedTransforms(Instance *instance)
{
    MATRIX *segMatrix;
    MATRIX *startOldMatrix;
    int numMatrices;
    Model *model;

    if (((instance->flags2 & 0x10000000)) && (((instance->flags2 & 0x4000000)) || (((instance->flags2 & 0x20000000)) && ((instance->flags & 0x800)))))
    {
        G2Instance_ClearMatrices(instance);
        return;
    }

    if (instance->matrix == NULL)
    {
        G2Instance_BuildTransforms(instance);
        return;
    }

    model = instance->object->modelList[instance->currentModel];

    if ((instance->object->animList != NULL) && (!(instance->object->oflags2 & 0x40000000)))
    {
        numMatrices = model->numSegments + 1;
    }
    else
    {
        numMatrices = model->numSegments;
    }

    segMatrix = GAMELOOP_GetMatrices(numMatrices);

    if (segMatrix == NULL)
    {
        instance->matrix = NULL;
        return;
    }

    startOldMatrix = instance->matrix;

    instance->oldMatrix = startOldMatrix;

    if (instance->object->animList != NULL)
    {
        startOldMatrix--;

        if (!(instance->object->oflags2 & 0x40000000))
        {
            instance->matrix = &segMatrix[1];
        }
        else
        {
            startOldMatrix = instance->oldMatrix;

            instance->matrix = segMatrix;
        }
    }
    else
    {
        instance->matrix = segMatrix;

        startOldMatrix = instance->oldMatrix;
    }

    if (instance->oldMatrix != NULL)
    {
        memcpy(segMatrix, startOldMatrix, numMatrices * sizeof(MATRIX));
    }

    instance = instance->LinkChild;

    while (instance != NULL)
    {
        G2Instance_BuildTransforms(instance);

        instance = instance->LinkSibling;
    }
}

void _G2Instance_BuildNonAnimatedTransforms(Instance *instance)
{
    MATRIX *segMatrix;
    Model *model;

    if (((instance->flags2 & 0x10000000)) && (((instance->flags2 & 0x4000000)) || (((instance->flags2 & 0x20000000)) && ((instance->flags & 0x800)))))
    {
        G2Instance_ClearMatrices(instance);
    }
    else
    {
        model = instance->object->modelList[instance->currentModel];

        segMatrix = GAMELOOP_GetMatrices(model->numSegments);

        if (segMatrix == NULL)
        {
            instance->matrix = NULL;
        }
        else
        {
            instance->oldMatrix = instance->matrix;
            instance->matrix = segMatrix;

            _G2Instance_RebuildNonAnimatedTransforms(instance);
        }
    }
}

void _G2Instance_BuildFacadeTransforms(Instance *instance, Segment *segment, MATRIX *segMatrix, MATRIX *matrixPool, long scale_flag)
{
    Position *cameraPos;
    SVECTOR *segmentPos;
    SVECTOR *segmentRot;
    VECTOR *scale;

    segmentPos = (SVECTOR *)getScratchAddr(2);
    segmentRot = (SVECTOR *)getScratchAddr(4);

    scale = (VECTOR *)getScratchAddr(10);

    cameraPos = (Position *)getScratchAddr(0);

    if ((segment->pz != 0) || (segment->px != 0) || (segment->py != 0))
    {
        ApplyMatrixSV(matrixPool, (SVECTOR *)&segment->px, segmentPos);

        segmentPos->vx += instance->position.x;
        segmentPos->vy += instance->position.y;
        segmentPos->vz += instance->position.z;
    }
    else
    {
        segmentPos->vx = instance->position.x;
        segmentPos->vy = instance->position.y;
        segmentPos->vz = instance->position.z;
    }

    segMatrix->t[0] = segmentPos->vx;
    segMatrix->t[1] = segmentPos->vy;
    segMatrix->t[2] = segmentPos->vz;

    if ((segment->flags & 0x1))
    {
        SVECTOR *zvec;
        SVECTOR *camWorldPos;
        SVECTOR *camLocPos;
        long sqrt;

        zvec = (SVECTOR *)getScratchAddr(22);

        camWorldPos = (SVECTOR *)getScratchAddr(24);

        camLocPos = (SVECTOR *)getScratchAddr(26);

        zvec->vx = matrixPool->m[0][2];
        zvec->vy = matrixPool->m[1][2];
        zvec->vz = matrixPool->m[2][2];

        sqrt = MATH3D_FastSqrt(16777216 - (zvec->vx * zvec->vx));

        segmentRot->vx = -MATH3D_FastAtan2(zvec->vy, zvec->vz);
        segmentRot->vy = MATH3D_FastAtan2(zvec->vx, (sqrt >> 12));
        segmentRot->vz = 0;

        RotMatrix(segmentRot, (MATRIX *)getScratchAddr(28));

        TransposeMatrix((MATRIX *)getScratchAddr(28), (MATRIX *)getScratchAddr(14));

        camWorldPos->vx = cameraPos->x - segmentPos->vx;
        camWorldPos->vy = cameraPos->y - segmentPos->vy;
        camWorldPos->vz = cameraPos->z - segmentPos->vz;

        ApplyMatrixSV((MATRIX *)getScratchAddr(14), camWorldPos, camLocPos);

        MATH3D_SetUnityMatrix(segMatrix);

        if (scale_flag != 0)
        {
            ScaleMatrix(segMatrix, scale);
        }

        segmentRot->vz = MATH3D_FastAtan2(camLocPos->vy, camLocPos->vx) + 1024;

        RotMatrixZ(segmentRot->vz, segMatrix);
        RotMatrixY(segmentRot->vy, segMatrix);
        RotMatrixX(segmentRot->vx, segMatrix);
    }
    else if ((segment->flags & 0x2))
    {
        VECTOR *xy;

        xy = (VECTOR *)getScratchAddr(6);

        xy->vx = cameraPos->x - segmentPos->vx;
        xy->vy = cameraPos->y - segmentPos->vy;
        xy->vz = cameraPos->z - segmentPos->vz;

        segmentRot->vx = MATH3D_FastAtan2(MATH3D_LengthXY(xy->vx, xy->vy), xy->vz) + 3072;
        segmentRot->vz = MATH3D_FastAtan2(xy->vy, xy->vx) + 1024;

        MATH3D_SetUnityMatrix(segMatrix);

        if (scale_flag != 0)
        {
            ScaleMatrix(segMatrix, scale);
        }

        RotMatrixX(segmentRot->vx, segMatrix);
        RotMatrixZ(segmentRot->vz, segMatrix);
    }
}
