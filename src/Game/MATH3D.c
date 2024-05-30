#include "common.h"
#include "Game/MATH3D.h"
#include "Game/G2/QUATG2.h"

void MATH3D_Sort3VectorCoords(long *a, long *b, long *c)
{
    long a1;
    long b1;
    long c1;

    a1 = *a;
    b1 = *b;
    c1 = *c;

    if (a1 < b1)
    {
        if (c1 < a1)
        {
            *c = b1;
            *b = a1;
            *a = c1;
        }
        else if (c1 < b1)
        {
            *c = b1;
            *b = c1;
        }
    }
    else if (c1 < b1)
    {
        *a = c1;
        *c = a1;
    }
    else if (c1 < a1)
    {
        *a = b1;
        *b = c1;
        *c = a1;
    }
    else
    {
        *a = b1;
        *b = a1;
    }
}

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

void MATH3D_Normalize(Normal *normal)
{
    long length;

    length = MATH3D_LengthXYZ(normal->x * 4, normal->y * 4, normal->z * 4);

    if (length != 0)
    {
        normal->x = (short)((normal->x << 14) / length);
        normal->y = (short)((normal->y << 14) / length);
        normal->z = (short)((normal->z << 14) / length);
    }
}

short MATH3D_FastAtan2(long y, long x)
{
    long ax;
    long ay;

    if (x == 0)
    {
        x = 1;
    }

    if (y == 0)
    {
        return (x < 1) * 2048;
    }

    ax = abs(x);
    ay = abs(y);

    if (x > 0)
    {
        if (y > 0)
        {
            if (ax < ay)
            {
                return (1024 - ((ax * 512) / ay));
            }
            else
            {
                return ((ay * 512) / ax);
            }
        }
        else
        {
            if (ay < ax)
            {
                return (4096 - ((ay * 512) / ax));
            }
            else
            {
                return (((ax * 512) / ay) + 3072);
            }
        }
    }

    if (y > 0)
    {
        if (ax < ay)
        {
            return (((ax * 512) / ay) + 1024);
        }
        else
        {
            return (2048 - ((ay * 512) / ax));
        }
    }

    if (ay < ax)
    {
        return (((ay * 512) / ax) + 2048);
    }
    else
    {
        return (3072 - ((ax * 512) / ay));
    }
}

long MATH3D_FastSqrt(long square)
{
    unsigned long result;
    long remainder;
    long mask;
    long shift;
    long mask_squared;
    long result_shift;

    shift = 31;

    if (square != 0)
    {
        mask = 0x80000000;

        if (square >= 0)
        {
            do
            {
                mask >>= 1;

                shift--;
            } while (!(mask & square));
        }

        shift >>= 1;

        result = 1 << (shift + 6);

        mask = result;

        result_shift = 1 << (shift << 1);

        mask_squared = result_shift;

        shift--;

        square -= result_shift;

        while (shift != -1)
        {
            mask_squared >>= 2;

            remainder = result_shift + mask_squared;
            remainder = square - remainder;

            mask >>= 1;

            if (remainder < 0)
            {
                result_shift >>= 1;
            }
            else
            {
                square = remainder;

                remainder = result_shift >> 1;

                result_shift = remainder + mask_squared;

                result |= mask;
            }

            shift--;
        }

        mask_squared >>= 2;

        square <<= 12;

        result_shift <<= 12;

        mask_squared = 4096;

        mask >>= 1;

        while (mask != 0)
        {
            mask_squared >>= 2;

            remainder = result_shift + mask_squared;
            remainder = square - remainder;

            if (remainder < 0)
            {
                result_shift >>= 1;
            }
            else
            {
                square = remainder;

                remainder = result_shift >> 1;

                result_shift = remainder + mask_squared;

                result |= mask;
            }

            mask >>= 1;
        }

        return result;
    }

    return 0;
}

INCLUDE_ASM("asm/nonmatchings/Game/MATH3D", MATH3D_FastSqrt0);

long MATH3D_DistanceBetweenPositions(Position *pos1, Position *pos2)
{
    return MATH3D_FastSqrt0(MATH3D_SquareLength((pos2->x - pos1->x), (pos2->y - pos1->y), (pos2->z - pos1->z)));
}

short MATH3D_AngleBetweenVectors(SVector *vector1, SVector *vector2)
{
    long projection_length;

    if ((vector1->x == vector2->x) && (vector1->y == vector2->y) && (vector1->z == vector2->z))
    {
        return 0;
    }

    projection_length = (((vector1->x * vector2->x) + (vector1->y * vector2->y) + (vector1->z * vector2->z)) + 2048) >> 12;

    if (projection_length >= 4097)
    {
        projection_length = 4096;
    }
    else if (projection_length < -4096)
    {
        projection_length = -4096;
    }

    return (short)ratan2(MATH3D_FastSqrt0(16777216 - projection_length * projection_length), projection_length);
}

INCLUDE_ASM("asm/nonmatchings/Game/MATH3D", MATH3D_RotMatAboutVec);

void MATH3D_SetUnityMatrix(MATRIX *mat)
{
    ((unsigned int *)&mat->m[0][0])[0] = 4096;
    ((unsigned int *)&mat->m[0][2])[0] = 0;

    ((unsigned int *)&mat->m[1][1])[0] = 4096;
    ((unsigned int *)&mat->m[2][0])[0] = 0;

    mat->m[2][2] = 4096;
}

INCLUDE_ASM("asm/nonmatchings/Game/MATH3D", AngleMoveToward);

short AngleDiff(short current, short destination)
{
    current = (destination - current) & 0xFFF;

    if (current >= 2049)
    {
        current |= 0xF000;
    }

    return current;
}

short MATH3D_AngleFromPosToPos(Position *from, Position *to)
{
    return (ratan2(from->y - to->y, from->x - to->x) + 3072) & 0xFFF;
}

void MATH3D_ZYXtoXYZ(Rotation *rot)
{
    MATRIX tempMat;
    G2EulerAngles ea;

    RotMatrixZYX((SVECTOR *)rot, &tempMat);

    G2EulerAngles_FromMatrix(&ea, (G2Matrix *)&tempMat, 21);

    rot->x = ea.x;
    rot->y = ea.y;
    rot->z = ea.z;
}

short MATH3D_ElevationFromPosToPos(Position *from, Position *to)
{
    int dx;
    int dy;

    dx = from->x - to->x;
    dy = from->y - to->y;

    return -(ratan2(to->z - from->z, (short)MATH3D_FastSqrt0((dx * dx) + (dy * dy)))) & 0xFFF;
}

void MATH3D_RotationFromPosToPos(Position *from, Position *to, Rotation *rot)
{
    rot->x = MATH3D_ElevationFromPosToPos(from, to);
    rot->y = 0;
    rot->z = MATH3D_AngleFromPosToPos(from, to);
}

INCLUDE_ASM("asm/nonmatchings/Game/MATH3D", MATH3D_veclen2);

INCLUDE_ASM("asm/nonmatchings/Game/MATH3D", MATH3D_RotateAxisToVector);

int MATH3D_ConeDetect(SVector *pos, int arc, int elevation)
{
    long x;
    long y;

    x = pos->x;
    y = -pos->y;

    if (((short)MATH3D_FastAtan2(abs(x), y) < arc) && ((short)MATH3D_FastAtan2(abs(pos->z), MATH3D_LengthXY(x, y)) < elevation))
    {
        return 1;
    }

    return 0;
}

INCLUDE_ASM("asm/nonmatchings/Game/MATH3D", MATH3D_CrossProduct);

INCLUDE_ASM("asm/nonmatchings/Game/MATH3D", MATH3D_SquareLength);
