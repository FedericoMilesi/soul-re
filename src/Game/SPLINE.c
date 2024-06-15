#include "common.h"
#include "Game/SPLINE.h"

void _SplineS2Pos(vecS *p, long s, SplineKey *key, SplineKey *key2)
{
    long s2;
    long s3;
    long h0;
    long h1;
    long h2;
    long h3;
    int temp, temp2; // not from decls.h

    if (s != 0)
    {
        s2 = (s * s) >> 15;

        temp = s2 * 2;

        s3 = (s2 * s) >> 15;

        temp2 = s3 * 2;

        h0 = (temp2 - (s2 * 3)) + 32768;

        h1 = (temp - temp2) + s2;

        h2 = (s3 - temp) + s;

        h3 = s3 - s2;

        p->x = (short)(((key->point.x * h0) + (key2->point.x * h1) + (key->dd.x * h2) + (key2->ds.x * h3)) >> 15);
        p->y = (short)(((key->point.y * h0) + (key2->point.y * h1) + (key->dd.y * h2) + (key2->ds.y * h3)) >> 15);
        p->z = (short)(((key->point.z * h0) + (key2->point.z * h1) + (key->dd.z * h2) + (key2->ds.z * h3)) >> 15);
    }
    else
    {
        p->x = key->point.x;
        p->y = key->point.y;
        p->z = key->point.z;
    }
}

INCLUDE_ASM("asm/nonmatchings/Game/SPLINE", SplineSetDefDenom);

INCLUDE_ASM("asm/nonmatchings/Game/SPLINE", SplineGetFrameNumber);

INCLUDE_ASM("asm/nonmatchings/Game/SPLINE", SplineSetDef2FrameNumber);

INCLUDE_ASM("asm/nonmatchings/Game/SPLINE", SplineIsWhere);

INCLUDE_ASM("asm/nonmatchings/Game/SPLINE", SplineMultiIsWhere);

INCLUDE_ASM("asm/nonmatchings/Game/SPLINE", SplineGetFirstRot);

INCLUDE_ASM("asm/nonmatchings/Game/SPLINE", SplineGetFirstPoint);

INCLUDE_ASM("asm/nonmatchings/Game/SPLINE", SplineGetNextPoint);

INCLUDE_ASM("asm/nonmatchings/Game/SPLINE", SplineGetPreviousPoint);

INCLUDE_ASM("asm/nonmatchings/Game/SPLINE", SplineGetNearestPoint);

INCLUDE_ASM("asm/nonmatchings/Game/SPLINE", SplineGetData);

INCLUDE_ASM("asm/nonmatchings/Game/SPLINE", SplineGetQuatData);

INCLUDE_ASM("asm/nonmatchings/Game/SPLINE", SplineGetNext);

INCLUDE_ASM("asm/nonmatchings/Game/SPLINE", SplineGetPrev);

INCLUDE_ASM("asm/nonmatchings/Game/SPLINE", SplineGetOffsetNext);

INCLUDE_ASM("asm/nonmatchings/Game/SPLINE", SplineGetOffsetPrev);

INCLUDE_ASM("asm/nonmatchings/Game/SPLINE", SplineGetOffsetNextPoint);

INCLUDE_ASM("asm/nonmatchings/Game/SPLINE", SplineGetOffsetPreviousPoint);
