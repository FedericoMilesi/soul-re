#include "Game/MENU/MENUFACE.h"

char *NextTimAddr(char *addr, int w, int h, bdepth bpp)
{
    long addtl;

    if (bpp == TIM_4BIT)
    {
        addtl = ((w * h) >> 1) + 44;
    }
    else if (bpp == TIM_8BIT)
    {
        addtl = (w * h) + 524;
    }
    else
    {
        addtl = (w * h) << 1;
    }

    addtl += 20;

    return &addr[addtl];
}

INCLUDE_ASM("asm/nonmatchings/Game/MENU/MENUFACE", menuface_initialize);

INCLUDE_ASM("asm/nonmatchings/Game/MENU/MENUFACE", menuface_terminate);

INCLUDE_ASM("asm/nonmatchings/Game/MENU/MENUFACE", MENUFACE_ChangeStateRandomly);

INCLUDE_ASM("asm/nonmatchings/Game/MENU/MENUFACE", MENUFACE_RefreshFaces);
