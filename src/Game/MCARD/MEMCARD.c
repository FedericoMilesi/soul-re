#include "common.h"
#include "Game/MCARD/MEMCARD.h"
#include "Game/SAVEINFO.h"
#include "Game/MENU/MENU.h"

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

void memcard_pop(void *opaque)
{
    GameTracker *temp; // not from decls.h

    (void)opaque;

    temp = &gameTrackerX;

    menu_pop(temp->menu);

    memcard_end(temp->memcard);
}

INCLUDE_ASM("asm/nonmatchings/Game/MCARD/MEMCARD", memcard_start);

INCLUDE_ASM("asm/nonmatchings/Game/MCARD/MEMCARD", memcard_load);

void memcard_save(void *opaque)
{
    (void)opaque;

    SAVE_SaveGame();
}

void memcard_item(void *opaque, int (*fn)(), long parameter, long flags, char *text)
{
    (void)opaque;

    if (flags != 0)
    {
        menu_item_flags(gameTrackerX.menu, fn, parameter, flags, text);
    }
    else
    {
        menu_item(gameTrackerX.menu, fn, parameter, text);
    }
}
