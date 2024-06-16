#include "common.h"
#include "Game/VOICEXA.h"

XAVoiceTracker voiceTracker;

INCLUDE_ASM("asm/nonmatchings/Game/VOICEXA", VOICEXA_Init);

INCLUDE_ASM("asm/nonmatchings/Game/VOICEXA", putCdCommand);

void VOICEXA_CdSyncCallback(unsigned char status, unsigned char *result)
{
    XAVoiceTracker *vt;

    (void)result;

    vt = &voiceTracker;

    if (status == 2)
    {
        vt->cdStatus = 0;

        if (++vt->cdCmdOut == 8)
        {
            vt->cdCmdOut = 0;
        }

        vt->cdCmdsQueued--;

        CdSyncCallback(vt->prevCallback);
    }
    else
    {
        vt->cdStatus = 2;
    }
}

INCLUDE_ASM("asm/nonmatchings/Game/VOICEXA", processCdCommands);

INCLUDE_ASM("asm/nonmatchings/Game/VOICEXA", putVoiceCommand);

INCLUDE_ASM("asm/nonmatchings/Game/VOICEXA", processVoiceCommands);

INCLUDE_ASM("asm/nonmatchings/Game/VOICEXA", voiceCmdPlay);

INCLUDE_ASM("asm/nonmatchings/Game/VOICEXA", voiceCmdStop);

INCLUDE_ASM("asm/nonmatchings/Game/VOICEXA", voiceCmdPause);

INCLUDE_ASM("asm/nonmatchings/Game/VOICEXA", voiceCmdResume);

void voiceCmdNull()
{
}

INCLUDE_ASM("asm/nonmatchings/Game/VOICEXA", VOICEXA_Play);

INCLUDE_ASM("asm/nonmatchings/Game/VOICEXA", VOICEXA_FinalStatus);

INCLUDE_ASM("asm/nonmatchings/Game/VOICEXA", VOICEXA_Pause);

INCLUDE_ASM("asm/nonmatchings/Game/VOICEXA", VOICEXA_Resume);

INCLUDE_ASM("asm/nonmatchings/Game/VOICEXA", VOICEXA_Tick);

INCLUDE_ASM("asm/nonmatchings/Game/VOICEXA", VOICEXA_IsPlaying);
