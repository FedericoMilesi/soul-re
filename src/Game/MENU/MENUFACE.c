#include "Game/MENU/MENUFACE.h"
#include "Game/LOAD3D.h"
#include "Game/MEMPACK.h"
#include "Game/DRAW.h"

STATIC ButtonTexture *FaceButtons;

STATIC int hack_initialized;

STATIC menuface_t MenuFaces[8];

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

extern char D_800D2088[];
void menuface_initialize()
{
    char *addr;
    char *buttonAddr;
    int i;
    int j;

    if (hack_initialized == 0)
    {
        // buttonAddr = addr = (char*)LOAD_ReadFile("\\kain2\\game\\psx\\frontend\\faces.tim", 11);
        buttonAddr = addr = (char *)LOAD_ReadFile(D_800D2088, 11);

        if (buttonAddr != NULL)
        {
            FaceButtons = (ButtonTexture *)MEMPACK_Malloc(sizeof(ButtonTexture) * 56, 45);

            if (FaceButtons == NULL)
            {
                MEMPACK_Free(addr);
            }
            else
            {
                for (i = 0; i < 8; i++)
                {
                    MenuFaces[i].curFrame = -1;

                    MenuFaces[i].transitionDir = 0;

                    MenuFaces[i].loaded = 0;

                    MenuFaces[i].delay = 0;

                    for (j = 0; j < 7; j++)
                    {
                        DRAW_LoadButton((long *)buttonAddr, &FaceButtons[(i * 7) + j]);

                        buttonAddr = NextTimAddr(buttonAddr, MenuFaces[i].w, MenuFaces[i].h, TIM_4BIT);

                        MenuFaces[i].loaded |= 1 << j;
                    }
                }

                MEMPACK_Free(addr);

                hack_initialized = 1;
            }
        }
    }
}

INCLUDE_ASM("asm/nonmatchings/Game/MENU/MENUFACE", menuface_terminate);

INCLUDE_ASM("asm/nonmatchings/Game/MENU/MENUFACE", MENUFACE_ChangeStateRandomly);

INCLUDE_ASM("asm/nonmatchings/Game/MENU/MENUFACE", MENUFACE_RefreshFaces);
