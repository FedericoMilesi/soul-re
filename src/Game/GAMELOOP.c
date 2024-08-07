#include "common.h"
#include "Game/GAMELOOP.h"
#include "Game/GAMEPAD.h"

EXTERN STATIC short pause_redraw_flag;

EXTERN STATIC PrimPool *primPool[2];

INCLUDE_ASM("asm/nonmatchings/Game/GAMELOOP", GAMELOOP_AllocStaticMemory);

INCLUDE_ASM("asm/nonmatchings/Game/GAMELOOP", GAMELOOP_InitGameTracker);

INCLUDE_ASM("asm/nonmatchings/Game/GAMELOOP", GAMELOOP_SystemInit);

void GAMELOOP_ResetGameStates()
{
    EVENT_Init();
}

INCLUDE_ASM("asm/nonmatchings/Game/GAMELOOP", GAMELOOP_ClearGameTracker);

INCLUDE_ASM("asm/nonmatchings/Game/GAMELOOP", GAMELOOP_CalcGameTime);

INCLUDE_ASM("asm/nonmatchings/Game/GAMELOOP", GAMELOOP_SetGameTime);

INCLUDE_ASM("asm/nonmatchings/Game/GAMELOOP", GAMELOOP_GetTimeOfDay);

INCLUDE_ASM("asm/nonmatchings/Game/GAMELOOP", GAMELOOP_GetTimeOfDayIdx);

INCLUDE_ASM("asm/nonmatchings/Game/GAMELOOP", GAMELOOP_WaitForLoad);

INCLUDE_ASM("asm/nonmatchings/Game/GAMELOOP", LoadLevels);

INCLUDE_ASM("asm/nonmatchings/Game/GAMELOOP", GAMELOOP_InitStandardObjects);

INCLUDE_ASM("asm/nonmatchings/Game/GAMELOOP", GAMELOOP_LevelLoadAndInit);

INCLUDE_ASM("asm/nonmatchings/Game/GAMELOOP", GAMELOOP_StreamLevelLoadAndInit);

INCLUDE_ASM("asm/nonmatchings/Game/GAMELOOP", GAMELOOP_SetScreenWipe);

INCLUDE_ASM("asm/nonmatchings/Game/GAMELOOP", GAMELOOP_HandleScreenWipes);

INCLUDE_ASM("asm/nonmatchings/Game/GAMELOOP", UpdateFogSettings);

INCLUDE_ASM("asm/nonmatchings/Game/GAMELOOP", CheckForNoBlend);

INCLUDE_ASM("asm/nonmatchings/Game/GAMELOOP", BlendToColor);

INCLUDE_ASM("asm/nonmatchings/Game/GAMELOOP", MainRenderLevel);

INCLUDE_ASM("asm/nonmatchings/Game/GAMELOOP", StreamIntroInstancesForUnit);

INCLUDE_ASM("asm/nonmatchings/Game/GAMELOOP", StreamRenderLevel);

INCLUDE_ASM("asm/nonmatchings/Game/GAMELOOP", GAMELOOP_FlipScreenAndDraw);

INCLUDE_ASM("asm/nonmatchings/Game/GAMELOOP", GAMELOOP_AddClearPrim);

INCLUDE_ASM("asm/nonmatchings/Game/GAMELOOP", GAMELOOP_SwitchTheDrawBuffer);

INCLUDE_ASM("asm/nonmatchings/Game/GAMELOOP", GAMELOOP_SetupRenderFunction);

INCLUDE_ASM("asm/nonmatchings/Game/GAMELOOP", GAMELOOP_GetMainRenderUnit);

INCLUDE_ASM("asm/nonmatchings/Game/GAMELOOP", GAMELOOP_DisplayFrame);

INCLUDE_ASM("asm/nonmatchings/Game/GAMELOOP", GAMELOOP_DrawSavedOT);

void ResetPrimPool()
{
    ResetDrawPage();

    if (!(gameTrackerX.gameFlags & 0x8000000))
    {
        if (gameTrackerX.primPool == primPool[0])
        {
            gameTrackerX.primPool = primPool[1];
        }
        else
        {
            gameTrackerX.primPool = primPool[0];
        }

        gameTrackerX.primPool->nextPrim = gameTrackerX.primPool->prim;

        gameTrackerX.primPool->numPrims = 0;
    }
    else
    {
        if (gameTrackerX.drawPage != 0)
        {
            gameTrackerX.primPool->nextPrim = &gameTrackerX.primPool->prim[16500];
        }
        else
        {
            gameTrackerX.primPool->nextPrim = &gameTrackerX.primPool->prim[9000];
        }

        gameTrackerX.primPool->numPrims = 0;
    }
}

void Switch_For_Redraw()
{
    unsigned long **temp;

    temp = gameTrackerX.drawOT;

    gameTrackerX.drawOT = gameTrackerX.dispOT;
    gameTrackerX.dispOT = temp;

    if (gameTrackerX.drawPage != 0)
    {
        gameTrackerX.drawPage = 0;

        gameTrackerX.gameData.asmData.dispPage = 1;
    }
    else
    {
        gameTrackerX.drawPage = 1;

        gameTrackerX.gameData.asmData.dispPage = 0;
    }

    if (gameTrackerX.primPool == primPool[0])
    {
        gameTrackerX.primPool = primPool[1];
    }
    else
    {
        gameTrackerX.primPool = primPool[0];
    }

    gameTrackerX.primPool->nextPrim = gameTrackerX.primPool->prim;

    gameTrackerX.primPool->numPrims = 0;
}

void GAMELOOP_Set_Pause_Redraw()
{
    pause_redraw_flag = 1;
}

INCLUDE_ASM("asm/nonmatchings/Game/GAMELOOP", SaveOT);

void ResetDrawPage()
{
    unsigned long **temp;

    temp = gameTrackerX.drawOT;

    gameTrackerX.drawOT = gameTrackerX.dispOT;
    gameTrackerX.dispOT = temp;

    gameTrackerX.drawPage = 1 - gameTrackerX.drawPage;

    ClearOTagR((unsigned long *)gameTrackerX.drawOT, 3072);
}

void GAMELOOP_Set24FPS()
{
    gameTrackerX.frameRate24fps = 1;
}

void GAMELOOP_Reset24FPS()
{
    gameTrackerX.frameRate24fps = 0;
}

INCLUDE_ASM("asm/nonmatchings/Game/GAMELOOP", GAMELOOP_DoTimeProcess);

INCLUDE_ASM("asm/nonmatchings/Game/GAMELOOP", GAMELOOP_Process);

INCLUDE_ASM("asm/nonmatchings/Game/GAMELOOP", GAMELOOP_ModeStartRunning);

INCLUDE_ASM("asm/nonmatchings/Game/GAMELOOP", GAMELOOP_ModeStartPause);

INCLUDE_ASM("asm/nonmatchings/Game/GAMELOOP", GAMELOOP_ChangeMode);

INCLUDE_ASM("asm/nonmatchings/Game/GAMELOOP", GAMELOOP_RequestLevelChange);

void PSX_GameLoop(GameTracker *gameTracker)
{
    GAMEPAD_Process(gameTracker);

    GAMELOOP_Process(gameTracker);
}

MATRIX *GAMELOOP_GetMatrices(int numMatrices)
{
    MATRIX *matrix;
    PrimPool *pool;

    pool = gameTrackerX.primPool;

    matrix = (MATRIX *)pool->nextPrim;

    if (&matrix[numMatrices] < (MATRIX *)pool->lastPrim)
    {
        pool->nextPrim = (unsigned long *)&matrix[numMatrices];

        return matrix;
    }

    return NULL;
}

GameTracker *GAMELOOP_GetGT()
{
    return &gameTrackerX;
}
