#include "common.h"
#include "Game/UNDRWRLD.h"
#include "Game/MATH3D.h"
#include "Game/GAMELOOP.h"

static inline int UNDRWRLD_GetDispPage()
{
    return gameTrackerX.gameData.asmData.dispPage;
}

INCLUDE_ASM("asm/nonmatchings/Game/UNDRWRLD", UNDERWORLD_StartProcess);

INCLUDE_ASM("asm/nonmatchings/Game/UNDRWRLD", UNDERWORLD_RotateScreenStep);

void UNDERWORLD_DoUV(unsigned char *uv, UW_ScreenXY *p0, int tx)
{
    int u;

    u = p0->sx - tx;

    if (u >= 256)
    {
        uv[0] = -1;
    }
    else
    {
        uv[0] = u;
    }

    if (p0->sy >= 256)
    {
        uv[1] = -1;
    }
    else
    {
        uv[1] = (unsigned char)p0->sy;
    }
}

INCLUDE_ASM("asm/nonmatchings/Game/UNDRWRLD", UNDERWORLD_Poly);

INCLUDE_ASM("asm/nonmatchings/Game/UNDRWRLD", UNDERWORLD_DisplayFrame);

void UNDERWORLD_SetupSource()
{
    RECT rect;
    DR_STP stp;

    SetDrawStp(&stp, 1);

    DrawPrim(&stp);

    rect.x = 0;
    rect.y = UNDRWRLD_GetDispPage() << 8;
    rect.w = 512;
    rect.h = 240;

    MoveImage(&rect, 0, (UNDRWRLD_GetDispPage() ^ 1) << 8);

    SetDrawStp(&stp, 0);

    DrawPrim(&stp);
    DrawSync(0);

    PutDrawEnv(&draw[UNDRWRLD_GetDispPage()]);
}

INCLUDE_ASM("asm/nonmatchings/Game/UNDRWRLD", UNDERWORLD_InitDisplayProcess);

INCLUDE_ASM("asm/nonmatchings/Game/UNDRWRLD", UNDERWORLD_LoadLevel);

void UNDERWORLD_UpdatePlayer(Intro *playerIntro, Instance *instance)
{
    SVector offset;

    SUB_SVEC(SVector, &offset, Position, &playerIntro->position, Position, &instance->position);

    STREAM_RelocateInstance(instance, &offset);
}
