#include "Game/PSX/PSX_G2/QUATVM.h"
#include "Game/MATH3D.h"
#include "Game/HASM.h"

void G2Quat_Slerp_VM(long ratio, G2Quat *quatA, G2Quat *quatB, G2Quat *quatOut, int spin)
{
    long beta;
    short theta;
    short cos_t;
    long bflip;
    long foo[4];
    long cosTemp1;
    long cosTemp2;
    short temp1, temp2; // not from decls.h

    gte_ldsv(quatA);

    gte_ldv0sv(quatB);

    gte_rtir12();

    cosTemp1 = (quatA->w * quatB->w) >> 12;

    gte_stlvnl0(&cosTemp2);

    cos_t = cosTemp1 + cosTemp2;

    if (cos_t < 0)
    {
        cos_t = -cos_t;

        bflip = 1;
    }
    else
    {
        bflip = 0;
    }

    if ((4096 - cos_t) > 0)
    {
        temp1 = temp2 = MATH3D_racos_S(cos_t);

        temp2 += spin << 12;

        theta = rsin(temp1);

        cosTemp1 = ratio * temp2;

        ratio = cosTemp1 >> 12;

        beta = (rsin(temp1 - ratio) << 12) / theta;

        ratio = (rsin(ratio) << 12) / theta;
    }
    else
    {
        beta = 4096 - ratio;
    }

    if (bflip != 0)
    {
        ratio = -ratio;
    }

    gte_ldsv(quatA);

    gte_lddp(beta);

    gte_ngpf12();

    foo[3] = (beta * quatA->w) >> 12;

    gte_ldsv(quatB);

    gte_lddp(ratio);

    gte_ngpl12();

    foo[3] += (ratio * quatB->w) >> 12;

    gte_stlvl(&foo);

    cosTemp1 = 0x1000000 / MATH3D_FastSqrt((((foo[3] * foo[3]) + (foo[0] * foo[0]) + (foo[1] * foo[1]) + (foo[2] * foo[2])) + 2048) >> 12);

    gte_lddp(cosTemp1);

    gte_ngpf12();

    quatOut->w = (foo[3] * cosTemp1) >> 12;

    gte_stsv(quatOut);
}
