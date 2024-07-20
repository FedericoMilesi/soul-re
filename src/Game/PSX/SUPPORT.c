#include "common.h"

INCLUDE_ASM("asm/nonmatchings/Game/PSX/SUPPORT", printf);

INCLUDE_ASM("asm/nonmatchings/Game/PSX/SUPPORT", sprintf);

INCLUDE_ASM("asm/nonmatchings/Game/PSX/SUPPORT", vsprintf);

INCLUDE_ASM("asm/nonmatchings/Game/PSX/SUPPORT", my_itoa);

INCLUDE_ASM("asm/nonmatchings/Game/PSX/SUPPORT", atoi);

int mytolower(int c)
{
    if ((c >= 'A') && (c <= 'Z'))
    {
        c += 32;
    }

    return c;
}

INCLUDE_ASM("asm/nonmatchings/Game/PSX/SUPPORT", strcmpi);
