#include "common.h"
#include "Game/PSX/AADSFX.h"
#include "Game/PSX/AADLIB.h"

unsigned long aadPlaySfx(unsigned int toneID, int volume, int pan, int pitchOffset)
{
    unsigned long handle;

    handle = createSfxHandle(toneID);

    aadPutSfxCommand(0, volume, pan, handle, pitchOffset);

    return handle;
}

unsigned long aadStopSfx(unsigned long handle)
{
    aadPutSfxCommand(1, 0, 0, handle, 0);

    return handle;
}

void aadStopAllSfx()
{
    aadPutSfxCommand(4, 0, 0, 0, 0);
}

// Matches 100% on decomp.me but differs on this project
#ifndef NON_MATCHING
INCLUDE_ASM("asm/nonmatchings/Game/PSX/AADSFX", aadIsSfxPlaying);
#else
int aadIsSfxPlaying(unsigned long handle)
{
    AadSynthVoice *voice;
    int i;

    for (i = 0; i < 24; i++)
    {
        voice = &aadMem->synthVoice[i];

        if ((voice->voiceID == 208) && ((aadMem->voiceStatus[i] != 0) && (aadMem->voiceStatus[i] != 2)) && (voice->handle == handle))
        {
            return 1;
        }
    }

    return 0;
}
#endif

int aadIsSfxPlayingOrRequested(unsigned long handle)
{
    int commandOut;
    int i;
    AadSfxCommand *sfxCmd;

    EnterCriticalSection();

    commandOut = aadMem->sfxSlot.commandOut;

    for (i = aadMem->sfxSlot.commandsInQueue; i != 0; i--)
    {
        sfxCmd = &aadMem->sfxSlot.commandQueue[commandOut];

        if (sfxCmd->statusByte == 0)
        {
            if (sfxCmd->ulongParam == handle)
            {
                ExitCriticalSection();

                return 1;
            }
        }

        commandOut++;

        if (commandOut == 32)
        {
            commandOut = 0;
        }
    }

    ExitCriticalSection();

    return aadIsSfxPlaying(handle);
}

INCLUDE_ASM("asm/nonmatchings/Game/PSX/AADSFX", aadIsSfxTypePlaying);

INCLUDE_ASM("asm/nonmatchings/Game/PSX/AADSFX", aadIsSfxTypePlayingOrRequested);

INCLUDE_ASM("asm/nonmatchings/Game/PSX/AADSFX", aadSetSfxVolPanPitch);

INCLUDE_ASM("asm/nonmatchings/Game/PSX/AADSFX", createSfxHandle);

INCLUDE_ASM("asm/nonmatchings/Game/PSX/AADSFX", aadPutSfxCommand);

INCLUDE_ASM("asm/nonmatchings/Game/PSX/AADSFX", aadExecuteSfxCommand);

INCLUDE_ASM("asm/nonmatchings/Game/PSX/AADSFX", sfxCmdPlayTone);

INCLUDE_ASM("asm/nonmatchings/Game/PSX/AADSFX", sfxCmdStopTone);

INCLUDE_ASM("asm/nonmatchings/Game/PSX/AADSFX", sfxCmdStopAllTones);

INCLUDE_ASM("asm/nonmatchings/Game/PSX/AADSFX", sfxCmdSetToneVolumeAndPan);

INCLUDE_ASM("asm/nonmatchings/Game/PSX/AADSFX", sfxCmdSetToneVolPanPitch);

INCLUDE_ASM("asm/nonmatchings/Game/PSX/AADSFX", sfxCmdLockVoice);

INCLUDE_ASM("asm/nonmatchings/Game/PSX/AADSFX", sfxCmdSetVoiceAttr);

INCLUDE_ASM("asm/nonmatchings/Game/PSX/AADSFX", sfxCmdSetVoiceKeyOn);

INCLUDE_ASM("asm/nonmatchings/Game/PSX/AADSFX", sfxCmdSetVoiceKeyOff);
