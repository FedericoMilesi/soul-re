#include "common.h"
#include "Game/MCARD/MEMCARD.h"
#include "Game/SAVEINFO.h"
#include "Game/MENU/MENU.h"
#include "Game/PSX/MAIN.h"
#include "Game/MEMPACK.h"
#include "Game/RELMOD.h"
#include "Game/STRMLOAD.h"

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

extern char D_8001248C[];
void load(memcard_t *memcard)
{
    Object *object;

    if ((gameTrackerX.gameFlags & 0x8000000))
    {
        object = (Object *)&gameTrackerX.primPool->prim;
    }
    else
    {
        object = (Object *)MEMPACK_Malloc(40000, 43);
    }

    LOAD_LoadToAddress("\\kain2\\object\\mcardx\\mcardx.drm", object, 1);
    //LOAD_LoadToAddress(D_8001248C, object, 1);

    memcard->table = (mcmenu_table_t *)object->relocModule;

    RELMOD_InitModulePointers((uintptr_t)object->relocModule, (int *)object->relocList);

    memcard->object = object;

    //if (memcard->table->versionID != "Jun 30 1999")
    if (memcard->table->versionID != monVersion)
    {
        if (!(gameTrackerX.gameFlags & 0x8000000))
        {
            MEMPACK_Free((char *)object);
        }

        memcard->table = NULL;
    }
}

void unload(memcard_t *memcard)
{
    if (memcard->object != NULL)
    {
        if ((char *)memcard->object != (char *)gameTrackerX.primPool->prim)
        {
            MEMPACK_Free((char *)memcard->object);
        }

        memcard->object = NULL;
    }

    memcard->table = NULL;
}

int memcard_data_size()
{
    return sizeof(memcard_t);
}

INCLUDE_ASM("asm/nonmatchings/Game/MCARD/MEMCARD", memcard_initialize);

INCLUDE_ASM("asm/nonmatchings/Game/MCARD/MEMCARD", memcard_end);

INCLUDE_ASM("asm/nonmatchings/Game/MCARD/MEMCARD", maybe_start);

INCLUDE_ASM("asm/nonmatchings/Game/MCARD/MEMCARD", memcard_main_menu);

int memcard_pause_menu(void *gt, int index)
{
    memcard_t *memcard;

    memcard = ((GameTracker *)gt)->memcard;

    if (maybe_start(memcard) != 0)
    {
        return memcard->table->pause(memcard->mcmenu, index);
    }

    return -1;
}

void *gt2mcmenu(void *gt)
{
    memcard_t *memcard;

    memcard = ((GameTracker *)gt)->memcard;

    return memcard->mcmenu;
}

void memcard_pop(void *opaque)
{
    GameTracker *temp; // not from decls.h

    (void)opaque;

    temp = &gameTrackerX;

    menu_pop(temp->menu);

    memcard_end(temp->memcard);
}

void memcard_start(void *opaque)
{
    (void)opaque;

    gameTrackerX.streamFlags |= 0x1000000;

    MAIN_StartGame();

    memcard_end(gameTrackerX.memcard);
}

void memcard_load(void *opaque)
{
    (void)opaque;

    gameTrackerX.streamFlags |= 0x200000;

    SAVE_RestoreGame();

    MAIN_StartGame();

    memcard_end(gameTrackerX.memcard);
}

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
