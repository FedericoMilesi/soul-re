#include "common.h"
#include "Game/G2/QUATG2.h"
#include "Game/HASM.h"
#include "Game/MATH3D.h"

void G2Quat_ToEuler(G2Quat *quat, G2EulerAngles *euler, int order)
{
    G2Matrix tempMatrix;

    G2Quat_ToMatrix_S(quat, &tempMatrix);

    G2EulerAngles_FromMatrix(euler, &tempMatrix, order);
}

void G2EulerAngles_FromMatrix(G2EulerAngles *euler, G2Matrix *matrix, long order)
{
    long i;
    // long j; // unused
    long k;
    long n;
    long s;
    long f;
    unsigned int o;
    long temp; // not from decls.h

    o = order;

    temp = o & 0x1;

    o >>= 1;

    i = o & 0x1;

    o >>= 1;

    f = o & 0x1;

    o >>= 1;

    n = G2EulSafe[o & 0x3];

    s = G2EulNext[n + f];
    k = G2EulNext[(n + 1) - f];

    if (i == 1)
    {
        long sy;

        sy = MATH3D_FastSqrt(((matrix->rotScale[n][s] * matrix->rotScale[n][s]) + (matrix->rotScale[n][k] * matrix->rotScale[n][k])) >> 12);

        if (sy > 16)
        {
            euler->x = (short)ratan2(matrix->rotScale[n][s], matrix->rotScale[n][k]);
            euler->y = (short)ratan2(sy, matrix->rotScale[n][n]);
            euler->z = (short)ratan2(matrix->rotScale[s][n], -matrix->rotScale[k][n]);
        }
        else
        {
            euler->x = (short)ratan2(-matrix->rotScale[s][k], matrix->rotScale[s][s]);
            euler->y = (short)ratan2(sy, matrix->rotScale[n][n]);
            euler->z = 0;
        }
    }
    else
    {
        long cy;

        cy = MATH3D_FastSqrt(((matrix->rotScale[n][n] * matrix->rotScale[n][n]) + (matrix->rotScale[s][n] * matrix->rotScale[s][n])) >> 12);

        if (cy > 16)
        {
            euler->x = (short)ratan2(matrix->rotScale[k][s], matrix->rotScale[k][k]);
            euler->y = (short)ratan2(-matrix->rotScale[k][n], cy);
            euler->z = (short)ratan2(matrix->rotScale[s][n], matrix->rotScale[n][n]);
        }
        else
        {
            euler->x = (short)ratan2(-matrix->rotScale[s][k], matrix->rotScale[s][s]);
            euler->y = (short)ratan2(-matrix->rotScale[k][n], cy);
            euler->z = 0;
        }
    }

    if (f == G2EulParOdd)
    {
        euler->x = -euler->x;
        euler->y = -euler->y;
        euler->z = -euler->z;
    }

    if (temp == G2EulFrmR)
    {
        short t;

        t = euler->x;

        euler->x = euler->z;
        euler->z = t;
    }

    euler->order = (short)order;
}
