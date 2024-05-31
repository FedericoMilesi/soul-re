#include "common.h"
#include "Game/GAMEPAD.h"
#include "Game/GAMELOOP.h"

INCLUDE_ASM("asm/nonmatchings/Game/GAMEPAD", GAMEPAD_Commands);

INCLUDE_ASM("asm/nonmatchings/Game/GAMEPAD", GAMEPAD_ControllerIsDualShock);

INCLUDE_ASM("asm/nonmatchings/Game/GAMEPAD", GAMEPAD_DualShockEnabled);

INCLUDE_ASM("asm/nonmatchings/Game/GAMEPAD", GAMEPAD_DisableDualShock);

INCLUDE_ASM("asm/nonmatchings/Game/GAMEPAD", GAMEPAD_EnableDualShock);

INCLUDE_ASM("asm/nonmatchings/Game/GAMEPAD", GAMEPAD_HandleDualShock);

INCLUDE_ASM("asm/nonmatchings/Game/GAMEPAD", GAMEPAD_Shock);

INCLUDE_ASM("asm/nonmatchings/Game/GAMEPAD", GAMEPAD_Shock0);

INCLUDE_ASM("asm/nonmatchings/Game/GAMEPAD", GAMEPAD_Shock1);

INCLUDE_ASM("asm/nonmatchings/Game/GAMEPAD", GAMEPAD_Detect);

INCLUDE_ASM("asm/nonmatchings/Game/GAMEPAD", GAMEPAD_Init);

INCLUDE_ASM("asm/nonmatchings/Game/GAMEPAD", PSXPAD_TranslateData);

INCLUDE_ASM("asm/nonmatchings/Game/GAMEPAD", GAMEPAD_RemapAnalogueButtons);

INCLUDE_ASM("asm/nonmatchings/Game/GAMEPAD", GAMEPAD_DetectInit);

INCLUDE_ASM("asm/nonmatchings/Game/GAMEPAD", GAMEPAD_GetData);

INCLUDE_ASM("asm/nonmatchings/Game/GAMEPAD", GAMEPAD_DisplayControllerStatus);

void GAMEPAD_Process(GameTracker *gameTracker)
{
    GAMEPAD_GetData(gameTracker->controlData);

    GAMEPAD_Commands(gameTracker->controlCommand, gameTracker->controlData, 0);
    GAMEPAD_Commands(gameTracker->controlCommand, gameTracker->controlData, 1);
}

INCLUDE_ASM("asm/nonmatchings/Game/GAMEPAD", GAMEPAD_SaveControllers);

INCLUDE_ASM("asm/nonmatchings/Game/GAMEPAD", GAMEPAD_RestoreControllers);
