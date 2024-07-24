#include "common.h"
#include "Game/MCARD/MEMCARD.h"
#include "Game/SAVEINFO.h"

int MEMCARD_IsWrongVersion(memcard_t *memcard)
{
    int result;

    result = 1;

    if (memcard != NULL)
    {
        result = memcard->wrongVerison;
    }

    return result;
}

INCLUDE_ASM("asm/nonmatchings/Game/MCARD/MEMCARD", load);

INCLUDE_ASM("asm/nonmatchings/Game/MCARD/MEMCARD", unload);

int memcard_data_size()
{
    return sizeof(memcard_t);
}

INCLUDE_ASM("asm/nonmatchings/Game/MCARD/MEMCARD", memcard_initialize);

INCLUDE_ASM("asm/nonmatchings/Game/MCARD/MEMCARD", memcard_end);

INCLUDE_ASM("asm/nonmatchings/Game/MCARD/MEMCARD", maybe_start);

INCLUDE_ASM("asm/nonmatchings/Game/MCARD/MEMCARD", memcard_main_menu);

INCLUDE_ASM("asm/nonmatchings/Game/MCARD/MEMCARD", memcard_pause_menu);

INCLUDE_ASM("asm/nonmatchings/Game/MCARD/MEMCARD", gt2mcmenu);

INCLUDE_ASM("asm/nonmatchings/Game/MCARD/MEMCARD", memcard_pop);

INCLUDE_ASM("asm/nonmatchings/Game/MCARD/MEMCARD", memcard_start);

INCLUDE_ASM("asm/nonmatchings/Game/MCARD/MEMCARD", memcard_load);

void memcard_save(void *opaque)
{
    (void)opaque;

    SAVE_SaveGame();
}

INCLUDE_ASM("asm/nonmatchings/Game/MCARD/MEMCARD", memcard_item);
