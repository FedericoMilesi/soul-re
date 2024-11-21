#include "common.h"
#include "Game/GAMEPAD.h"
#include "Game/GAMELOOP.h"
#include "Game/FONT.h"
#include "Game/MENU/MENU.h"
#include "Game/LOCAL/LOCALSTR.h"

STATIC int gpSaved;

STATIC long overrideData[5][2];

STATIC long overrideCommand[5][2];

int gamePadControllerOut;

STATIC short dualshock_onflag;

STATIC int dualShock;

STATIC short align_flag;

INCLUDE_ASM("asm/nonmatchings/Game/GAMEPAD", GAMEPAD_Commands);

int GAMEPAD_ControllerIsDualShock()
{
    return dualShock;
}

int GAMEPAD_DualShockEnabled()
{
    return dualshock_onflag;
}

INCLUDE_ASM("asm/nonmatchings/Game/GAMEPAD", GAMEPAD_DisableDualShock);

void GAMEPAD_EnableDualShock()
{
    dualshock_onflag = 1;

    align_flag = 0;
}

INCLUDE_ASM("asm/nonmatchings/Game/GAMEPAD", GAMEPAD_HandleDualShock);

INCLUDE_ASM("asm/nonmatchings/Game/GAMEPAD", GAMEPAD_Shock);

INCLUDE_ASM("asm/nonmatchings/Game/GAMEPAD", GAMEPAD_Shock0);

INCLUDE_ASM("asm/nonmatchings/Game/GAMEPAD", GAMEPAD_Shock1);

INCLUDE_ASM("asm/nonmatchings/Game/GAMEPAD", GAMEPAD_Detect);

INCLUDE_ASM("asm/nonmatchings/Game/GAMEPAD", GAMEPAD_Init);

INCLUDE_ASM("asm/nonmatchings/Game/GAMEPAD", PSXPAD_TranslateData);

unsigned short GAMEPAD_RemapAnalogueButtons(unsigned short in)
{
    in = ~in;

    return ~(((in & 0x800) << 1) | ((in & 0x400) << 5) | ((in & 0x200) << 1) | ((in & 0x8000) >> 6) | ((in & 0x1000) >> 1) | (in & 0x61F9));
}

void GAMEPAD_DetectInit()
{
    int orgdualshock_onflag;

    orgdualshock_onflag = dualshock_onflag;

    GAMEPAD_Detect();

    if ((dualShock != 0) && (orgdualshock_onflag != 0))
    {
        GAMEPAD_EnableDualShock();
    }
}

INCLUDE_ASM("asm/nonmatchings/Game/GAMEPAD", GAMEPAD_GetData);

void GAMEPAD_DisplayControllerStatus(int msgY)
{
    char *noCtrlStr;

    if (gamePadControllerOut >= 6)
    {
        noCtrlStr = localstr_get(LOCALSTR_no_controller);

        FONT_FontPrintCentered(noCtrlStr, msgY);

        DisplayHintBox(FONT_GetStringWidth(noCtrlStr), msgY);
    }
}

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
