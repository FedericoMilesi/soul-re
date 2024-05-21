#include "common.h"
#include "Game/TYPES.h"

void PIPE3D_NormalizeMatrix(MATRIX *target, MATRIX *source);

void PIPE3D_AspectAdjustMatrix(MATRIX *matrix)
{
    int temp, temp2, temp3; // not from decls.h

    temp = matrix->m[1][0];
    temp2 = matrix->m[1][1];
    temp3 = matrix->m[1][2];

    matrix->m[1][0] = temp;
    matrix->m[1][1] = temp2;
    matrix->m[1][2] = temp3;

    matrix->m[0][0] = (matrix->m[0][0] * 512) / 320;
    matrix->m[0][1] = (matrix->m[0][1] * 512) / 320;
    matrix->m[0][2] = (matrix->m[0][2] * 512) / 320;
}

INCLUDE_ASM("asm/nonmatchings/Game/PIPE3D", PIPE3D_CalculateWCTransform);

void PIPE3D_InvertTransform(MATRIX *target, MATRIX *source)
{
    VECTOR sourceTrans;
    MATRIX normMat;

    if (((short *)&source->t)[-1] == 1)
    {
        PIPE3D_NormalizeMatrix(&normMat, source);

        TransposeMatrix(&normMat, target);
    }
    else
    {
        TransposeMatrix(source, target);
    }

    sourceTrans.vx = -source->t[0];
    sourceTrans.vy = -source->t[1];
    sourceTrans.vz = -source->t[2];

    ApplyMatrixLV(target, &sourceTrans, (VECTOR *)target->t);
}

long PIPE3D_MatrixColumnLength(MATRIX *transform, long column)
{
    return MATH3D_FastSqrt0(MATH3D_SquareLength(transform->m[0][column], transform->m[1][column], transform->m[2][column]));
}

void PIPE3D_NormalizeMatrix(MATRIX *target, MATRIX *source)
{
    VECTOR scalevec;
    long scale;
    typedef struct
    {
        long m[3];
    } tmm;
    typedef struct
    {
        long m[5];
    } cmm;

    scale = PIPE3D_MatrixColumnLength(source, 0);

    if (scale != 0)
    {
        scale = 16777216 / scale;
    }

    scalevec.vx = scale;

    scale = PIPE3D_MatrixColumnLength(source, 1);

    if (scale != 0)
    {
        scale = 16777216 / scale;
    }

    scalevec.vy = scale;

    scale = PIPE3D_MatrixColumnLength(source, 2);

    if (scale != 0)
    {
        scale = 16777216 / scale;
    }

    scalevec.vz = scale;

    *(tmm *)(target->t) = *(tmm *)(source->t);
    *(cmm *)(target->m) = *(cmm *)(source->m);

    ScaleMatrix(target, &scalevec);
}

INCLUDE_ASM("asm/nonmatchings/Game/PIPE3D", PIPE3D_TransformVerticesToWorld);

INCLUDE_ASM("asm/nonmatchings/Game/PIPE3D", PIPE3D_InstanceTransformAndDraw);

INCLUDE_ASM("asm/nonmatchings/Game/PIPE3D", PIPE3D_InstanceListTransformAndDrawFunc);

INCLUDE_ASM("asm/nonmatchings/Game/PIPE3D", PIPE3D_InstanceListTransformAndDraw);

INCLUDE_ASM("asm/nonmatchings/Game/PIPE3D", PIPE3D_TransformFromZAxis);

INCLUDE_ASM("asm/nonmatchings/Game/PIPE3D", PIPE3D_CalcWorldToSplitPlaneTransform);

INCLUDE_ASM("asm/nonmatchings/Game/PIPE3D", PIPE3D_TransformAnimatedSplitInstanceVertices);

INCLUDE_ASM("asm/nonmatchings/Game/PIPE3D", PIPE3D_TransformSplitInstanceVertices);

INCLUDE_ASM("asm/nonmatchings/Game/PIPE3D", PIPE3D_AnimateTextures);

INCLUDE_ASM("asm/nonmatchings/Game/PIPE3D", PIPE3D_AnimateTerrainTextures);

INCLUDE_ASM("asm/nonmatchings/Game/PIPE3D", PIPE3D_HalvePlaneInstanceTransformAndDraw);

INCLUDE_ASM("asm/nonmatchings/Game/PIPE3D", PIPE3D_HalvePlaneGetRingPoints);

INCLUDE_ASM("asm/nonmatchings/Game/PIPE3D", PIPE3D_DoGlow);

INCLUDE_ASM("asm/nonmatchings/Game/PIPE3D", PIPE3D_Segment2ScreenPt);
