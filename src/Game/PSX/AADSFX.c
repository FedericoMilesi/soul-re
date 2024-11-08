#include "common.h"
#include "Game/PSX/AADSFX.h"
#include "Game/PSX/AADLIB.h"

STATIC void (*sfxCmdFunction[9])();

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

// Matches 100% on decomp.me but differs on this project
#ifndef NON_MATCHING
INCLUDE_ASM("asm/nonmatchings/Game/PSX/AADSFX", aadIsSfxTypePlaying);
#else
int aadIsSfxTypePlaying(unsigned int toneID)
{
    AadSynthVoice *voice;
    int i;

    for (i = 0; i < 24; i++)
    {
        voice = &aadMem->synthVoice[i];

        if ((voice->voiceID == 208) && ((unsigned short)voice->handle == (unsigned short)toneID) && ((aadMem->voiceStatus[i] != 0) && (aadMem->voiceStatus[i] != 2)))
        {
            return 1;
        }
    }

    return 0;
}
#endif

int aadIsSfxTypePlayingOrRequested(unsigned int sfxToneID)
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
            if ((unsigned short)sfxCmd->ulongParam == sfxToneID)
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

    return aadIsSfxTypePlaying(sfxToneID);
}

unsigned long aadSetSfxVolPanPitch(unsigned long handle, int volume, int pan, int pitch)
{
    aadPutSfxCommand(3, volume & 0xFF, pan & 0xFF, handle, pitch);

    return handle;
}

unsigned long createSfxHandle(unsigned int toneID)
{
    aadMem->sfxSlot.handleCounter++;

    if (aadMem->sfxSlot.handleCounter == 0)
    {
        aadMem->sfxSlot.handleCounter += 1;
    }

    return (aadMem->sfxSlot.handleCounter << 16) | (unsigned short)toneID;
}

INCLUDE_ASM("asm/nonmatchings/Game/PSX/AADSFX", aadPutSfxCommand);

void aadExecuteSfxCommand(AadSfxCommand *sfxCmd)
{
    if (sfxCmd->statusByte < 9)
    {
        sfxCmdFunction[sfxCmd->statusByte](sfxCmd);
    }
}

INCLUDE_ASM("asm/nonmatchings/Game/PSX/AADSFX", sfxCmdPlayTone);

INCLUDE_ASM("asm/nonmatchings/Game/PSX/AADSFX", sfxCmdStopTone);

INCLUDE_ASM("asm/nonmatchings/Game/PSX/AADSFX", sfxCmdStopAllTones);

INCLUDE_ASM("asm/nonmatchings/Game/PSX/AADSFX", sfxCmdSetToneVolumeAndPan);

INCLUDE_ASM("asm/nonmatchings/Game/PSX/AADSFX", sfxCmdSetToneVolPanPitch);

INCLUDE_ASM("asm/nonmatchings/Game/PSX/AADSFX", sfxCmdLockVoice);

INCLUDE_ASM("asm/nonmatchings/Game/PSX/AADSFX", sfxCmdSetVoiceAttr);

void sfxCmdSetVoiceKeyOn(AadSfxCommand *sfxCmd)
{
    aadMem->voiceKeyOnRequest |= sfxCmd->ulongParam;
}

void sfxCmdSetVoiceKeyOff(AadSfxCommand *sfxCmd)
{
    aadMem->voiceKeyOffRequest |= sfxCmd->ulongParam;
    aadMem->voiceKeyOnRequest &= ~sfxCmd->ulongParam;
}
