#include "common.h"

INCLUDE_ASM("asm/nonmatchings/Game/MATH3D", MATH3D_Sort3VectorCoords);

long MATH3D_LengthXYZ(long x, long y, long z) 
{
    long t;

    x = abs(x);
    y = abs(y);
    z = abs(z);

    if (x < y)
    {
        if (z < x)
        {
            t = x;
            x = z;
            z = y;
            y = t;
        }
        else if (z < y)
        {
            t = y;
            y = z;
            z = t;
        }
    }
    else if (z < y)
    {
        t = x;
        x = z;
        z = t;
    }
    else if (z < x)
    {
        t = x;
        x = y;
        y = z;
        z = t;
    }
    else
    {
        t = x;
        x = y;
        y = t;
    }
    
    t = (z * 30) + (y * 12) + (x * 9);
    
    return t / 32;
}

INCLUDE_ASM("asm/nonmatchings/Game/MATH3D", MATH3D_LengthXY);

INCLUDE_ASM("asm/nonmatchings/Game/MATH3D", MATH3D_Normalize);

INCLUDE_ASM("asm/nonmatchings/Game/MATH3D", MATH3D_FastAtan2);

INCLUDE_ASM("asm/nonmatchings/Game/MATH3D", MATH3D_FastSqrt);

INCLUDE_ASM("asm/nonmatchings/Game/MATH3D", MATH3D_FastSqrt0);

INCLUDE_ASM("asm/nonmatchings/Game/MATH3D", MATH3D_DistanceBetweenPositions);

INCLUDE_ASM("asm/nonmatchings/Game/MATH3D", MATH3D_AngleBetweenVectors);

INCLUDE_ASM("asm/nonmatchings/Game/MATH3D", MATH3D_RotMatAboutVec);

INCLUDE_ASM("asm/nonmatchings/Game/MATH3D", MATH3D_SetUnityMatrix);

INCLUDE_ASM("asm/nonmatchings/Game/MATH3D", AngleMoveToward);

INCLUDE_ASM("asm/nonmatchings/Game/MATH3D", AngleDiff);

INCLUDE_ASM("asm/nonmatchings/Game/MATH3D", MATH3D_AngleFromPosToPos);

INCLUDE_ASM("asm/nonmatchings/Game/MATH3D", MATH3D_ZYXtoXYZ);

INCLUDE_ASM("asm/nonmatchings/Game/MATH3D", MATH3D_ElevationFromPosToPos);

INCLUDE_ASM("asm/nonmatchings/Game/MATH3D", MATH3D_RotationFromPosToPos);

INCLUDE_ASM("asm/nonmatchings/Game/MATH3D", MATH3D_veclen2);

INCLUDE_ASM("asm/nonmatchings/Game/MATH3D", MATH3D_RotateAxisToVector);

INCLUDE_ASM("asm/nonmatchings/Game/MATH3D", MATH3D_ConeDetect);

INCLUDE_ASM("asm/nonmatchings/Game/MATH3D", MATH3D_CrossProduct);

INCLUDE_ASM("asm/nonmatchings/Game/MATH3D", MATH3D_SquareLength);
