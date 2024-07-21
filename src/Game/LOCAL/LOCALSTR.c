#include "common.h"
#include "Game/LOCAL/LOCALSTR.h"

language_t the_language;

EXTERN STATIC char **LocalStrings;

language_t localstr_get_language()
{
    return the_language;
}

INCLUDE_ASM("asm/nonmatchings/Game/LOCAL/LOCALSTR", localstr_set_language);

char D_800D1EF8[2];
char *localstr_get(localstr_t id)
{
    //static char BlankStr[2];

    if (LocalStrings != NULL)
    {
        return LocalStrings[id];
    }
    else
    {
        //return &BlankStr[0];
        return &D_800D1EF8[0];
    }
}
