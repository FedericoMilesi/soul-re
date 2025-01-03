#include "Game/MENU/MENU.h"

int menu_data_size()
{
    return sizeof(menu_t);
}

void menu_initialize(menu_t *menu, void *opaque)
{
    memset(menu, 0, sizeof(menu_t));

    menu->nmenus = -1;

    menu->opaque = opaque;
}

INCLUDE_ASM("asm/nonmatchings/Game/MENU/MENU", menu_format);

void menu_set(menu_t *menu, int (*fn)())
{
    menu->nmenus = 0;

    menu->drawfn = NULL;

    menu_push(menu, fn);
}

INCLUDE_ASM("asm/nonmatchings/Game/MENU/MENU", menu_push);

void menu_pop(menu_t *menu)
{
    menu->nmenus--;
}

INCLUDE_ASM("asm/nonmatchings/Game/MENU/MENU", menu_item_flags);

INCLUDE_ASM("asm/nonmatchings/Game/MENU/MENU", menu_item);

INCLUDE_ASM("asm/nonmatchings/Game/MENU/MENU", menu_build);

INCLUDE_ASM("asm/nonmatchings/Game/MENU/MENU", DisplayHintBox);

INCLUDE_ASM("asm/nonmatchings/Game/MENU/MENU", DisplayMenuBox);

INCLUDE_ASM("asm/nonmatchings/Game/MENU/MENU", menu_draw_item);

INCLUDE_ASM("asm/nonmatchings/Game/MENU/MENU", menu_draw);

INCLUDE_ASM("asm/nonmatchings/Game/MENU/MENU", menu_run);

void menu_process(menu_t *menu)
{
    menu_build(menu);

    menu_draw(menu);

    menu_run(menu);
}
