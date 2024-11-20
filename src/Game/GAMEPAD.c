#include "common.h"
#include "Game/GAMEPAD.h"
#include "Game/GAMELOOP.h"

STATIC int gpSaved;

STATIC long overrideData[5][2];

STATIC long overrideCommand[5][2];

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
    GAMEPAD_GetData((long(*)[5])gameTracker->controlData);

    GAMEPAD_Commands((long(*)[5])gameTracker->controlCommand, (long(*)[5])gameTracker->controlData, 0);
    GAMEPAD_Commands((long(*)[5])gameTracker->controlCommand, (long(*)[5])gameTracker->controlData, 1);
}

void GAMEPAD_SaveControllers()
{
    gpSaved = 1;

    memcpy(&overrideCommand, &gameTrackerX.controlCommand, sizeof(overrideCommand));
    memcpy(&overrideData, &gameTrackerX.controlData, sizeof(overrideData));
}

void GAMEPAD_RestoreControllers()
{
    if (gpSaved != 0)
    {
        gpSaved = 0;

        memcpy(&gameTrackerX.controlData, &overrideData, sizeof(overrideData));
        memcpy(&gameTrackerX.controlCommand, &overrideCommand, sizeof(overrideCommand));

        gameTrackerX.controlCommand[0][0] |= 0x80;
    }
}
