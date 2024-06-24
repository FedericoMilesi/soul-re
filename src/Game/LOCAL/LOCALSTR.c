#include "common.h"
#include "Game/LOCAL/LOCALSTR.h"

language_t the_language;

language_t localstr_get_language()
{
    return the_language;
}

INCLUDE_ASM("asm/nonmatchings/Game/LOCAL/LOCALSTR", localstr_set_language);

INCLUDE_ASM("asm/nonmatchings/Game/LOCAL/LOCALSTR", localstr_get);
