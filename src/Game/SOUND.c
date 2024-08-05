#include "common.h"
#include "Game/SOUND.h"
#include "Game/STRMLOAD.h"
#include "Game/PSX/AADLIB.h"
#include "Game/GAMELOOP.h"
#include "Game/FONT.h"
#include "Game/PSX/AADSFX.h"
#include "Game/CAMERA.h"
#include "Game/MATH3D.h"
#include "Game/MEMPACK.h"
#include "Game/STRMLOAD.h"

char soundBuffer[13256];

MusicLoadInfo musicInfo;

int gSramFullAlarm;

EXTERN STATIC int gSramFullMsgCnt;

int gSramTotalUsed;

int gSramUsedBlocks;

int gSramTotalFree;

int gSramLargestFree;

int gSramFreeBlocks;

AadMemoryStruct *aadMem;

INCLUDE_ASM("asm/nonmatchings/Game/SOUND", SndOpenSfxChannel);

INCLUDE_ASM("asm/nonmatchings/Game/SOUND", SndCloseSfxChannel);

INCLUDE_ASM("asm/nonmatchings/Game/SOUND", SndGetSfxChannel);

INCLUDE_ASM("asm/nonmatchings/Game/SOUND", SOUND_ProcessInstanceSounds);

INCLUDE_ASM("asm/nonmatchings/Game/SOUND", SOUND_EndInstanceSounds);

INCLUDE_ASM("asm/nonmatchings/Game/SOUND", isOkayToPlaySound);

void setPeriodicSoundStateOff(SoundInstance *soundInst, ObjectPeriodicSound *sound)
{
    SndCloseSfxChannel(soundInst->channel);

    soundInst->channel = 255;

    soundInst->state = 3;

    soundInst->delay = sound->offTime;

    if (sound->offTimeVariation != 0)
    {
        soundInst->delay += sound->offTimeVariation - (rand() % (sound->offTimeVariation * 2));
    }
}

INCLUDE_ASM("asm/nonmatchings/Game/SOUND", processPeriodicSound);

INCLUDE_ASM("asm/nonmatchings/Game/SOUND", processEventSound);

void SOUND_StartInstanceSound(SoundInstance *soundInst)
{
    if ((soundInst->state & 0xF) == 0x1)
    {
        soundInst->state = 2;
    }
}

void SOUND_StopInstanceSound(SoundInstance *soundInst)
{
    SoundEffectChannel *channel;

    channel = SndGetSfxChannel(soundInst->channel);

    if (channel != NULL)
    {
        SndEndLoop(channel->handle);

        SndCloseSfxChannel(soundInst->channel);

        soundInst->channel = -1;
    }

    soundInst->state = 1;
}

int SOUND_IsInstanceSoundLoaded(unsigned char *sfxFileData, long soundNumber)
{
    unsigned short *sfxIDList;
    int numSounds;
    int numSfxIDs;
    int i;
    int status;

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

void SOUND_SetInstanceSoundPitch(SoundInstance *soundInst, long pitchChangeAmt, long time)
{
    SoundEffectChannel *channel;

    if ((soundInst->state & 0xF) == 0x2)
    {
        channel = SndGetSfxChannel(soundInst->channel);

        if (channel != NULL)
        {
            time = abs(time);

            if (time != 0)
            {
                channel->pitchChangePerUpdate = (short)(pitchChangeAmt / time);

                if (pitchChangeAmt < 0)
                {
                    channel->pitchChangeSign = -1;
                }
                else
                {
                    channel->pitchChangeSign = 1;
                }

                channel->pitchChangeError = 0;

                channel->pitchChangeTime = (short)time;
                channel->pitchChangeTimeSave = (short)time;

                channel->pitchChangeErrPerUpdate = (short)abs(pitchChangeAmt % time);
            }
            else
            {
                channel->pitchChangeTime = 0;

                channel->pitch += (short)pitchChangeAmt;
            }
        }
    }
}

void SOUND_SetInstanceSoundVolume(SoundInstance *soundInst, long volumeChangeAmt, long time)
{
    SoundEffectChannel *channel;

    if ((soundInst->state & 0xF) == 0x2)
    {
        channel = SndGetSfxChannel(soundInst->channel);

        if (channel != NULL)
        {
            time = abs(time);

            if ((volumeChangeAmt > 0) && ((channel->volume + volumeChangeAmt) >= 128))
            {
                volumeChangeAmt = 127 - channel->volume;
            }

            if ((volumeChangeAmt < 0) && ((channel->volume + volumeChangeAmt) < 0))
            {
                volumeChangeAmt = -channel->volume;
            }

            if (time != 0)
            {
                channel->volumeChangePerUpdate = (short)(volumeChangeAmt / time);

                if (volumeChangeAmt < 0)
                {
                    channel->volumeChangeSign = -1;
                }
                else
                {
                    channel->volumeChangeSign = 1;
                }

                channel->volumeChangeError = 0;

                channel->volumeChangeTime = (short)time;
                channel->volumeChangeTimeSave = (short)time;

                channel->volumeChangeErrPerUpdate = (short)abs(volumeChangeAmt % time);
            }
            else
            {
                channel->volumeChangeTime = 0;

                channel->volume += (short)volumeChangeAmt;
            }
        }
    }
}

INCLUDE_ASM("asm/nonmatchings/Game/SOUND", processOneShotSound);

INCLUDE_ASM("asm/nonmatchings/Game/SOUND", SOUND_Play3dSound);

unsigned long SOUND_Update3dSound(Position *position, unsigned long handle, int pitch, int maxVolume, int minVolDist)
{
    long dx;
    long dy;
    long dz;
    long objDist;
    long workMinVolDist;
    int angle;
    int quadrant;
    int qpos;
    int pan;
    int volume;
    int temp, temp2; // not from decls.h

    if (maxVolume != 0)
    {
        if (minVolDist == 0)
        {
            return handle;
        }

        if ((theCamera.mode == 5) && ((gameTrackerX.gameFlags & 0x10)))
        {
            dx = position->x - theCamera.core.position.x;
            dy = position->y - theCamera.core.position.y;
            dz = position->z - theCamera.core.position.z;

            workMinVolDist = minVolDist;
        }
        else
        {
            dx = position->x - theCamera.focusInstance->position.x;
            dy = position->y - theCamera.focusInstance->position.y;
            dz = position->z - theCamera.focusInstance->position.z;

            workMinVolDist = minVolDist;
        }

        objDist = MATH3D_FastSqrt0((dx * dx) + (dy * dy) + (dz * dz));

        if (objDist <= workMinVolDist)
        {
            temp = ratan2(dy, dx) + 1024;

            angle = theCamera.core.rotation.z - temp;

            volume = (workMinVolDist - objDist) / (workMinVolDist / maxVolume);

            quadrant = (angle & 0xFFF) >> 10;

            qpos = angle & 0x3FF;

            if (volume >= 128)
            {
                volume = 127;
            }

            switch (quadrant)
            {
            case 0:
                pan = 63 - (qpos >> 4);
                break;
            case 1:
                pan = qpos >> 4;
                break;
            case 2:
                pan = (qpos >> 4) + 64;
                break;
            default:
                pan = 127 - (qpos >> 4);
            }

            temp2 = (objDist << 8) / workMinVolDist;

            if (pan < 64)
            {
                pan = 63 - (((63 - pan) * temp2) >> 8);
            }
            else
            {
                pan = (((pan - 64) * temp2) >> 8) + 64;
            }

            return SndUpdateVolPanPitch(handle, volume & 0xFFFF, pan & 0xFFFF, pitch);
        }
    }

    return 0;
}

void SOUND_HandleGlobalValueSignal(int name, long data)
{
    (void)name;
    (void)data;
}

void SOUND_Init()
{
    AadInitAttr initAttr;

    initAttr.updateMode = 1;

    initAttr.numSlots = 4;

    initAttr.nonBlockLoadProc = LOAD_NonBlockingFileLoad;
    initAttr.nonBlockBufferedLoadProc = LOAD_NonBlockingBufferedLoad;

    initAttr.memoryMallocProc = (void *)MEMPACK_Malloc;
    initAttr.memoryFreeProc = MEMPACK_Free;

    aadGetMemorySize(&initAttr);

    aadInit(&initAttr, (unsigned char *)&soundBuffer);

    gameTrackerX.sound.gMasterVol = 16383;

    SOUND_SetMusicVolume(127);
    SOUND_SetSfxVolume(127);
    SOUND_SetVoiceVolume(80);

    gameTrackerX.sound.gSfxOn = 1;
    gameTrackerX.sound.gMusicOn = 1;
    gameTrackerX.sound.gVoiceOn = 1;

    gameTrackerX.sound.soundsLoaded = 0;

    SOUND_MusicInit();

    aadInitReverb();
}

void SOUND_Free()
{
    gameTrackerX.sound.soundsLoaded = 0;

    aadShutdown();
}

void SOUND_SetMusicVariable(int variable, int value)
{
    aadSetUserVariable(variable, value);
}

void SOUND_SetMusicVolume(int newVolume)
{
    if (newVolume == -1)
    {
        newVolume = gameTrackerX.sound.gMusicVol;
    }

    gameTrackerX.sound.gMusicVol = newVolume;

    aadSetMusicMasterVolume(newVolume);
}

void SOUND_SetSfxVolume(int newVolume)
{
    if (newVolume == -1)
    {
        newVolume = gameTrackerX.sound.gSfxVol;
    }

    gameTrackerX.sound.gSfxVol = newVolume;

    aadSetSfxMasterVolume(newVolume);
}

void SOUND_SetVoiceVolume(int newVolume)
{
    if (newVolume == -1)
    {
        newVolume = gameTrackerX.sound.gVoiceVol;
    }

    gameTrackerX.sound.gVoiceVol = newVolume;
}

void SOUND_PauseAllSound()
{
    if ((unsigned char)gameTrackerX.sound.soundsLoaded != 0)
    {
        aadShutdownReverb();

        aadPauseSound();
    }
}

void SOUND_ResumeAllSound()
{
    if ((unsigned char)gameTrackerX.sound.soundsLoaded != 0)
    {
        aadInitReverb();

        aadResumeSound();
    }
}

void SOUND_StopAllSound()
{
    if ((unsigned char)gameTrackerX.sound.soundsLoaded != 0)
    {
        aadStopAllSfx();
        aadStopAllSlots();

        aadShutdownReverb();

        aadCancelPauseSound();
    }
}

void SOUND_ResetAllSound()
{
    if ((unsigned char)gameTrackerX.sound.soundsLoaded != 0)
    {
        SOUND_StopAllSound();

        aadInitReverb();
    }
}

void SOUND_MusicOff()
{
    int slotNumber;

    for (slotNumber = 1; slotNumber < 4; slotNumber++)
    {
        aadDisableSlot(slotNumber);

        if (aadGetSlotStatus(slotNumber) == 1)
        {
            aadStopSlot(slotNumber);

            aadStartSlot(slotNumber);
        }
    }
}

void SOUND_MusicOn()
{
    int slotNumber;

    for (slotNumber = 1; slotNumber < 4; slotNumber++)
    {
        aadEnableSlot(slotNumber);
    }
}

void SOUND_SfxOff()
{
    aadStopAllSfx();
}

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
