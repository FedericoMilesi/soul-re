#include "common.h"
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

INCLUDE_ASM("asm/nonmatchings/Game/MENU/MENU", menu_set);

INCLUDE_ASM("asm/nonmatchings/Game/MENU/MENU", menu_push);

INCLUDE_ASM("asm/nonmatchings/Game/MENU/MENU", menu_pop);

INCLUDE_ASM("asm/nonmatchings/Game/MENU/MENU", menu_item_flags);

INCLUDE_ASM("asm/nonmatchings/Game/MENU/MENU", menu_item);

INCLUDE_ASM("asm/nonmatchings/Game/MENU/MENU", menu_build);

INCLUDE_ASM("asm/nonmatchings/Game/MENU/MENU", DisplayHintBox);

INCLUDE_ASM("asm/nonmatchings/Game/MENU/MENU", DisplayMenuBox);

INCLUDE_ASM("asm/nonmatchings/Game/MENU/MENU", menu_draw_item);

INCLUDE_ASM("asm/nonmatchings/Game/MENU/MENU", menu_draw);

INCLUDE_ASM("asm/nonmatchings/Game/MENU/MENU", menu_run);

INCLUDE_ASM("asm/nonmatchings/Game/MENU/MENU", menu_process);
