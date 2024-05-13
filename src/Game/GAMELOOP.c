#include "common.h"

INCLUDE_ASM("asm/nonmatchings/Game/GAMELOOP", GAMELOOP_AllocStaticMemory);

INCLUDE_ASM("asm/nonmatchings/Game/GAMELOOP", GAMELOOP_InitGameTracker);

INCLUDE_ASM("asm/nonmatchings/Game/GAMELOOP", GAMELOOP_SystemInit);

INCLUDE_ASM("asm/nonmatchings/Game/GAMELOOP", GAMELOOP_ResetGameStates);

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

INCLUDE_ASM("asm/nonmatchings/Game/GAMELOOP", GAMELOOP_Set24FPS);

INCLUDE_ASM("asm/nonmatchings/Game/GAMELOOP", GAMELOOP_Reset24FPS);

INCLUDE_ASM("asm/nonmatchings/Game/GAMELOOP", GAMELOOP_DoTimeProcess);

INCLUDE_ASM("asm/nonmatchings/Game/GAMELOOP", GAMELOOP_Process);

INCLUDE_ASM("asm/nonmatchings/Game/GAMELOOP", GAMELOOP_ModeStartRunning);

INCLUDE_ASM("asm/nonmatchings/Game/GAMELOOP", GAMELOOP_ModeStartPause);

INCLUDE_ASM("asm/nonmatchings/Game/GAMELOOP", GAMELOOP_ChangeMode);

INCLUDE_ASM("asm/nonmatchings/Game/GAMELOOP", GAMELOOP_RequestLevelChange);

INCLUDE_ASM("asm/nonmatchings/Game/GAMELOOP", PSX_GameLoop);

INCLUDE_ASM("asm/nonmatchings/Game/GAMELOOP", GAMELOOP_GetMatrices);

INCLUDE_ASM("asm/nonmatchings/Game/GAMELOOP", GAMELOOP_GetGT);
