#include "common.h"

INCLUDE_ASM("asm/nonmatchings/Game/PSX/SUPPORT", printf);

INCLUDE_ASM("asm/nonmatchings/Game/PSX/SUPPORT", sprintf);

INCLUDE_ASM("asm/nonmatchings/Game/PSX/SUPPORT", vsprintf);

INCLUDE_ASM("asm/nonmatchings/Game/PSX/SUPPORT", my_itoa);

//int atoi(char *str)
int atoi(const char *str)
{
    int val;
    int neg;

    val = 0;

    neg = 0;

    if (*str == '-')
    {
        str++;

        neg = 1;
    }

    while (*str != 0)
    {
        val *= 10;
        val += *str - '0';

        str++;
    }

    if (neg != 0)
    {
        return -val;
    }
    else
    {
        return val;
    }
}

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
        c1 = mytolower(*s1++);
        c2 = mytolower(*s2++);

        if (c1 != c2)
        {
            return c1 - c2;
        }
    } while (c1 != 0);

    return 0;
}
