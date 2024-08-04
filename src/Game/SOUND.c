#include "common.h"
#include "Game/SOUND.h"
#include "Game/STRMLOAD.h"
#include "Game/PSX/AADLIB.h"
#include "Game/GAMELOOP.h"
#include "Game/FONT.h"
#include "Game/PSX/AADSFX.h"

char soundBuffer[13256];

MusicLoadInfo musicInfo;

int gSramFullAlarm;

EXTERN STATIC int gSramFullMsgCnt;

int gSramTotalUsed;

int gSramUsedBlocks;

int gSramTotalFree;

int gSramLargestFree;

int gSramFreeBlocks;

INCLUDE_ASM("asm/nonmatchings/Game/SOUND", SndOpenSfxChannel);

INCLUDE_ASM("asm/nonmatchings/Game/SOUND", SndCloseSfxChannel);

INCLUDE_ASM("asm/nonmatchings/Game/SOUND", SndGetSfxChannel);

INCLUDE_ASM("asm/nonmatchings/Game/SOUND", SOUND_ProcessInstanceSounds);

INCLUDE_ASM("asm/nonmatchings/Game/SOUND", SOUND_EndInstanceSounds);

INCLUDE_ASM("asm/nonmatchings/Game/SOUND", isOkayToPlaySound);

INCLUDE_ASM("asm/nonmatchings/Game/SOUND", setPeriodicSoundStateOff);

INCLUDE_ASM("asm/nonmatchings/Game/SOUND", processPeriodicSound);

INCLUDE_ASM("asm/nonmatchings/Game/SOUND", processEventSound);

INCLUDE_ASM("asm/nonmatchings/Game/SOUND", SOUND_StartInstanceSound);

INCLUDE_ASM("asm/nonmatchings/Game/SOUND", SOUND_StopInstanceSound);

int SOUND_IsInstanceSoundLoaded(unsigned char *sfxFileData, long soundNumber)
{
    unsigned short *sfxIDList; // $s1
    int numSounds; // $a3
    int numSfxIDs; // $s0
    int i; // $a2
    int status; // $v0

    if ((sfxFileData != NULL) && (*sfxFileData++ == 190) && (*sfxFileData++ == 239))
    {
        numSounds = *sfxFileData;

        sfxFileData += 2;

        for (i = 0; i < numSounds; i++)
        {
            switch (*sfxFileData)
            {
            case 0:
                sfxIDList = (unsigned short *)&sfxFileData[18];
                numSfxIDs = sfxFileData[1];
                sfxFileData += numSfxIDs*2+18;
                break;
            case 1:
                sfxIDList = (unsigned short *)&sfxFileData[14];
                numSfxIDs = sfxFileData[1];
                sfxFileData += numSfxIDs*2+14;
                break;
            case 2:
            default:
                sfxIDList = (unsigned short *)&sfxFileData[14];
                numSfxIDs = sfxFileData[1];
                sfxFileData += numSfxIDs*2+14;
                break;
            }

            if (i == soundNumber)
            {
                numSfxIDs--;
                while (1)
                {
                    if (numSfxIDs == -1)
                        return 1;

                    status = aadIsSfxLoaded(sfxIDList[0]);
                    sfxIDList += 1;
                    if (status != 0)
                    {
                        numSfxIDs -= 1;
                        if (status == -1)
                            return -1;
                    }
                    else
                        return 0;
                }
            }
        }

    }
    return -1;
}

INCLUDE_ASM("asm/nonmatchings/Game/SOUND", SOUND_SetInstanceSoundPitch);

INCLUDE_ASM("asm/nonmatchings/Game/SOUND", SOUND_SetInstanceSoundVolume);

INCLUDE_ASM("asm/nonmatchings/Game/SOUND", processOneShotSound);

INCLUDE_ASM("asm/nonmatchings/Game/SOUND", SOUND_Play3dSound);

INCLUDE_ASM("asm/nonmatchings/Game/SOUND", SOUND_Update3dSound);

void SOUND_HandleGlobalValueSignal(int name, long data)
{
    (void)name;
    (void)data;
}

INCLUDE_ASM("asm/nonmatchings/Game/SOUND", SOUND_Init);

INCLUDE_ASM("asm/nonmatchings/Game/SOUND", SOUND_Free);

INCLUDE_ASM("asm/nonmatchings/Game/SOUND", SOUND_SetMusicVariable);

INCLUDE_ASM("asm/nonmatchings/Game/SOUND", SOUND_SetMusicVolume);

INCLUDE_ASM("asm/nonmatchings/Game/SOUND", SOUND_SetSfxVolume);

INCLUDE_ASM("asm/nonmatchings/Game/SOUND", SOUND_SetVoiceVolume);

INCLUDE_ASM("asm/nonmatchings/Game/SOUND", SOUND_PauseAllSound);

INCLUDE_ASM("asm/nonmatchings/Game/SOUND", SOUND_ResumeAllSound);

INCLUDE_ASM("asm/nonmatchings/Game/SOUND", SOUND_StopAllSound);

INCLUDE_ASM("asm/nonmatchings/Game/SOUND", SOUND_ResetAllSound);

INCLUDE_ASM("asm/nonmatchings/Game/SOUND", SOUND_MusicOff);

INCLUDE_ASM("asm/nonmatchings/Game/SOUND", SOUND_MusicOn);

INCLUDE_ASM("asm/nonmatchings/Game/SOUND", SOUND_SfxOff);

void SOUND_SfxOn()
{
}

int SndIsPlaying(unsigned long handle)
{
    return aadIsSfxPlaying(handle);
}

int SndIsPlayingOrRequested(unsigned long handle)
{
    return aadIsSfxPlayingOrRequested(handle);
}

int SndTypeIsPlayingOrRequested(unsigned int sfxToneID)
{
    return aadIsSfxTypePlayingOrRequested(sfxToneID);
}

unsigned long SndPlay(unsigned int sample)
{
    if ((unsigned char)gameTrackerX.sound.gSfxOn != 0)
    {
        return aadPlaySfx(sample, 90, 64, 0);
    }

    return 0;
}

void SndEndLoop(unsigned long handle)
{
    aadStopSfx(handle);
}

unsigned long SndPlayVolPan(unsigned int sample, unsigned short vol, unsigned short pan, short pitch)
{
    if ((unsigned char)gameTrackerX.sound.gSfxOn != 0)
    {
        return aadPlaySfx(sample, vol & 0xFFFF, pan & 0xFFFF, pitch);
    }

    return 0;
}

unsigned long SndUpdateVolPanPitch(unsigned long handle, unsigned short vol, unsigned short pan, short pitch)
{
    if ((handle != 0) && ((unsigned char)gameTrackerX.sound.gSfxOn != 0))
    {
        return aadSetSfxVolPanPitch(handle, vol, pan, pitch);
    }
    else
    {
        return 0;
    }
}

void musicLoadReturnFunc(int dynamicBankIndex, int errorStatus)
{
    (void)dynamicBankIndex;

    musicInfo.errorStatus = errorStatus;

    musicInfo.state = musicInfo.nextState;
}

void musicFadeoutReturnFunc()
{
    musicInfo.state = musicInfo.nextState;
}

void musicEndCallbackFunc(long userData, int slot, int loopFlag)
{
    (void)userData;
    (void)loopFlag;

    if (slot == 0)
    {
        aadInstallEndSequenceCallback(NULL, 0);

        if (aadAssignDynamicSequence(musicInfo.bankLoaded, 0, 0) == 0)
        {
            aadStartSlot(0);

            musicInfo.state = musicInfo.nextState;
        }
        else
        {
            musicInfo.state = 0;
        }
    }
}

void SOUND_PutMusicCommand(int cmdType, int cmdData)
{
    MusicLoadCmd *cmd;

    cmd = &musicInfo.commandQueue[musicInfo.commandIn];

    cmd->type = cmdType;

    cmd->data = cmdData;

    if (musicInfo.numCmdsInQueue < 3)
    {
        musicInfo.numCmdsInQueue++;

        musicInfo.commandIn = (musicInfo.commandIn + 1) & 0x3;
    }
}

void SOUND_MusicInit()
{
    musicInfo.state = 0;

    musicInfo.errorStatus = 0;

    musicInfo.checkMusicDelay = 0;

    musicInfo.currentMusicPlane = -1;
    musicInfo.currentMusicName[0] = 0;

    musicInfo.numCmdsInQueue = 0;

    musicInfo.commandOut = 0;
    musicInfo.commandIn = 0;
}

int SOUND_IsMusicLoading()
{
    int temp; // not from decls.h

    temp = 0;

    if ((musicInfo.state == 1) || (musicInfo.state == 3) || (musicInfo.state == 7))
    {
        temp = 1;
    }

    return temp;
}

INCLUDE_ASM("asm/nonmatchings/Game/SOUND", SOUND_ProcessMusicLoad);

extern char D_800D0F9C[];
void SOUND_UpdateSound()
{
    aadProcessLoadQueue();

    if ((!(gameTrackerX.debugFlags & 0x40000)) && ((gSramFullAlarm != 0) || (gSramFullMsgCnt != 0)))
    {
        if (gSramFullMsgCnt == 0)
        {
            gSramFullMsgCnt = 60;
        }
        else
        {
            gSramFullMsgCnt--;
        }

        //FONT_Print("$\n\n\n\n\n\n\n\n\n\nsound memory full!\nu = % d % d f = % d % d lf = % d", gSramTotalUsed, gSramUsedBlocks, gSramTotalFree, gSramFreeBlocks, gSramLargestFree);
        FONT_Print(D_800D0F9C, gSramTotalUsed, gSramUsedBlocks, gSramTotalFree, gSramFreeBlocks, gSramLargestFree);
    }

    if ((unsigned char)gameTrackerX.sound.gMusicOn != 0)
    {
        SOUND_ProcessMusicLoad();
    }
}

void SOUND_PlaneShift(int newPlane)
{
    if ((unsigned char)gameTrackerX.sound.gMusicOn != 0)
    {
        SOUND_PutMusicCommand(0, newPlane);
    }
    else
    {
        musicInfo.currentMusicPlane = -1;
    }
}

void SOUND_ShutdownMusic()
{
    aadStopAllSlots();

    EnterCriticalSection();

    if ((musicInfo.state == 1) || (musicInfo.state == 3) || (musicInfo.state == 7))
    {
        musicInfo.nextState = 0;

        ExitCriticalSection();

        while (musicInfo.state != 0)
        {
            STREAM_PollLoadQueue();
        }
    }
    else
    {
        ExitCriticalSection();
    }

    musicInfo.currentMusicName[0] = 0;

    aadFreeDynamicSoundBank(0);
    aadFreeDynamicSoundBank(1);

    musicInfo.state = 0;

    aadStartMusicMasterVolFade(gameTrackerX.sound.gMusicVol, 1, NULL);
}

void SOUND_SetMusicModifier(long modifier)
{
    switch (modifier)
    {
    case 0:
        SOUND_SetMusicVariable(0, 0);
        break;
    case 1:
        SOUND_SetMusicVariable(0, 1);
        break;
    case 2:
        SOUND_SetMusicVariable(0, 3);
        break;
    case 3:
        SOUND_SetMusicVariable(0, 4);
        break;
    case 4:
        SOUND_SetMusicVariable(0, 2);
        break;
    case 5:
        SOUND_SetMusicVariable(1, 1);
        break;
    case 6:
        SOUND_SetMusicVariable(2, 1);
        break;
    case 9:
        SOUND_SetMusicVariable(125, 1);
        break;
    case 10:
        SOUND_SetMusicVariable(126, 1);
        break;
    case 11:
        SOUND_SetMusicVariable(124, 1);
        break;
    case 13:
        SOUND_SetMusicVariable(120, 1);
        break;
    case 14:
        SOUND_SetMusicVariable(3, 1);
        break;
    case 15:
        SOUND_SetMusicVariable(119, 1);
        break;
    }
}

void SOUND_ResetMusicModifier(long modifier)
{
    switch (modifier)
    {
    case 0:
    case 1:
    case 2:
    case 3:
    case 4:
        SOUND_SetMusicVariable(0, 0);
        break;
    case 5:
        SOUND_SetMusicVariable(1, 0);
        break;
    case 6:
        SOUND_SetMusicVariable(2, 0);
        break;
    case 9:
        SOUND_SetMusicVariable(125, 0);
        break;
    case 10:
        SOUND_SetMusicVariable(126, 0);
        break;
    case 11:
        SOUND_SetMusicVariable(124, 0);
        break;
    case 13:
        SOUND_SetMusicVariable(120, 0);
        break;
    case 14:
        SOUND_SetMusicVariable(3, 0);
        break;
    case 15:
        SOUND_SetMusicVariable(119, 0);
        break;
    }
}
