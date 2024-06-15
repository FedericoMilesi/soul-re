#include "common.h"
#include "Game/UNDRWRLD.h"
#include "Game/MATH3D.h"
#include "Game/GAMELOOP.h"
#include "Game/MEMPACK.h"
#include "Game/STREAM.h"
#include "Game/HASM.h"

EXTERN STATIC UW_ScreenXY *ScreenMorphArray;

EXTERN STATIC long UW_angle;

EXTERN STATIC long UW_scalex;

EXTERN STATIC long UW_scalexInc;

EXTERN STATIC long UW_angleInc;

extern char D_800D1DC8[];

static inline int UNDRWRLD_GetDispPage()
{
    return gameTrackerX.gameData.asmData.dispPage;
}

void UNDERWORLD_StartProcess()
{
    INSTANCE_Post(gameTrackerX.playerInstance, 0x40001, 0);

    STREAM_DumpAllLevels(gameTrackerX.playerInstance->currentStreamUnitID, 1);

    UNDERWORLD_InitDisplayProcess();

    UNDERWORLD_LoadLevel(D_800D1DC8, &gameTrackerX);

    if (ScreenMorphArray != NULL)
    {
        MEMPACK_Free((char *)ScreenMorphArray);

        ScreenMorphArray = NULL;
    }
}

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

void UNDERWORLD_InitDisplayProcess()
{
    int row;
    int col;

    do
    {
        while (CheckVolatile(gameTrackerX.drawTimerReturn) != 0);
    } while (CheckVolatile(gameTrackerX.reqDisp) != 0);

    ScreenMorphArray = (UW_ScreenXY *)MEMPACK_Malloc(sizeof(UW_ScreenXY[3][3]), 24);

    for (row = 0; row < 3; row++)
    {
        for (col = 0; col < 3; col++)
        {
            UW_ScreenXY *p;

            p = ScreenMorphArray + col + (row * 3);

            p->sx = (col * 254) + 1;
            p->sy = (row * 119) + 1;
        }
    }

    UW_scalex = 4096;
    UW_scalexInc = 32;

    UW_angle = 0;
    UW_angleInc = 8;

    UNDERWORLD_SetupSource();
}

INCLUDE_ASM("asm/nonmatchings/Game/UNDRWRLD", UNDERWORLD_LoadLevel);

void UNDERWORLD_UpdatePlayer(Intro *playerIntro, Instance *instance)
{
    SVector offset;

    SUB_SVEC(SVector, &offset, Position, &playerIntro->position, Position, &instance->position);

    STREAM_RelocateInstance(instance, &offset);
}
