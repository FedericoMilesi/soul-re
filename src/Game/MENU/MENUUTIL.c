#include "Game/MENU/MENUUTIL.h"
#include "Game/FONT.h"

INCLUDE_ASM("asm/nonmatchings/Game/MENU/MENUUTIL", menu_get_ctrl);

INCLUDE_ASM("asm/nonmatchings/Game/MENU/MENUUTIL", menu_print);

int menu_text_width(char *text)
{
    FONT_GetStringWidth(text);
}

INCLUDE_ASM("asm/nonmatchings/Game/MENU/MENUUTIL", menu_sound);
