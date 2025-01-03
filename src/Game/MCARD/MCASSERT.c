#include "Game/MCARD/MCASSERT.h"

void mcassert(char *exp, char *file, long line)
{
    if (exp != NULL)
    {
        printf("%s:%ld: %s\n", file, line, exp);
    }
    else
    {
        printf("%s:%ld: assertion failure\n", file, line);
    }

    _break(0x407);
}
