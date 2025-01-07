#include "Game/MENU/MENUUTIL.h"
#include "Game/FONT.h"
#include "Game/SOUND.h"

STATIC menu_sound_entry_t the_menu_sounds[8924 + 6];

INCLUDE_ASM("asm/nonmatchings/Game/MENU/MENUUTIL", menu_get_ctrl);

void menu_print(int xpos, int ypos, char *text, int color)
{
    FONT_SetCursor(xpos, ypos);

    if (color != 0)
    {
        FONT_SetColorIndex(color);
    }

    FONT_Print2(text);

    if (color != 0)
    {
        FONT_SetColorIndex(0);
    }
}

int menu_text_width(char *text)
{
    FONT_GetStringWidth(text);
}

void menu_sound(menu_sound_t sound)
{
    menu_sound_entry_t *entry;

    entry = &the_menu_sounds[sound];

    SndPlay(entry->sfx);
}
