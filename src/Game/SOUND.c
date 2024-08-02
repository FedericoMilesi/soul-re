#include "common.h"
#include "Game/SOUND.h"
#include "Game/PSX/AADLIB.h"

char soundBuffer[13256];

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

INCLUDE_ASM("asm/nonmatchings/Game/SOUND", SndIsPlaying);

INCLUDE_ASM("asm/nonmatchings/Game/SOUND", SndIsPlayingOrRequested);

INCLUDE_ASM("asm/nonmatchings/Game/SOUND", SndTypeIsPlayingOrRequested);

INCLUDE_ASM("asm/nonmatchings/Game/SOUND", SndPlay);

INCLUDE_ASM("asm/nonmatchings/Game/SOUND", SndEndLoop);

INCLUDE_ASM("asm/nonmatchings/Game/SOUND", SndPlayVolPan);

INCLUDE_ASM("asm/nonmatchings/Game/SOUND", SndUpdateVolPanPitch);

INCLUDE_ASM("asm/nonmatchings/Game/SOUND", musicLoadReturnFunc);

INCLUDE_ASM("asm/nonmatchings/Game/SOUND", musicFadeoutReturnFunc);

INCLUDE_ASM("asm/nonmatchings/Game/SOUND", musicEndCallbackFunc);

INCLUDE_ASM("asm/nonmatchings/Game/SOUND", SOUND_PutMusicCommand);

INCLUDE_ASM("asm/nonmatchings/Game/SOUND", SOUND_MusicInit);

INCLUDE_ASM("asm/nonmatchings/Game/SOUND", SOUND_IsMusicLoading);

INCLUDE_ASM("asm/nonmatchings/Game/SOUND", SOUND_ProcessMusicLoad);

INCLUDE_ASM("asm/nonmatchings/Game/SOUND", SOUND_UpdateSound);

INCLUDE_ASM("asm/nonmatchings/Game/SOUND", SOUND_PlaneShift);

INCLUDE_ASM("asm/nonmatchings/Game/SOUND", SOUND_ShutdownMusic);

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
