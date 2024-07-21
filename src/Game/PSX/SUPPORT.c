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

int strcmpi(char *s1, char *s2)
{
    int c1;
    int c2;

    do
    {
        c1 = mytolower((unsigned char)*s1++);
        c2 = mytolower((unsigned char)*s2++);

        if (c1 != c2)
        {
            return c1 - c2;
        }
    } while (c1 != 0);

    return 0;
}
