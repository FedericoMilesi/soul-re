#include "common.h"

EXTERN STATIC int AlgoControlFlag;

INCLUDE_ASM("asm/nonmatchings/Game/RAZIEL/ALGOCTRL", InitAlgorithmicWings);

void DeInitAlgorithmicWings(Instance *instance)
{
    unsigned char i;

    if ((AlgoControlFlag & 0x1))
    {
        for (i = 51; i < 54; i++)
        {
            G2Anim_DisableController(&instance->anim, i, 8);
        }

        for (i = 59; i < 62; i++)
        {
            G2Anim_DisableController(&instance->anim, i, 8);
        }

        AlgoControlFlag &= ~0x1;
    }
}

INCLUDE_ASM("asm/nonmatchings/Game/RAZIEL/ALGOCTRL", AlgorithmicWings);

INCLUDE_ASM("asm/nonmatchings/Game/RAZIEL/ALGOCTRL", AlgorithmicNeck);
