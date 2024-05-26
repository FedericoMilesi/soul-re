#include "common.h"
#include "Game/GAMELOOP.h"

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

INCLUDE_ASM("asm/nonmatchings/Game/GAMELOOP", ResetPrimPool);

INCLUDE_ASM("asm/nonmatchings/Game/GAMELOOP", Switch_For_Redraw);

INCLUDE_ASM("asm/nonmatchings/Game/GAMELOOP", GAMELOOP_Set_Pause_Redraw);

INCLUDE_ASM("asm/nonmatchings/Game/GAMELOOP", SaveOT);

INCLUDE_ASM("asm/nonmatchings/Game/GAMELOOP", ResetDrawPage);

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
