#include "common.h"
#include "Game/VOICEXA.h"
#include "Game/GAMELOOP.h"
#include "Game/PSX/AADLIB.h"

extern char D_800D1EB0[];

XAVoiceTracker voiceTracker;

void VOICEXA_Init()
{
    int i;
    CdlFILE fp;
    XAVoiceTracker *vt;
    char fileName[32];

    vt = &voiceTracker;

    if ((gameTrackerX.debugFlags & 0x80000))
    {
        vt->voiceStatus = 0;
        vt->cdStatus = 0;

        vt->reqIn = 0;
        vt->reqOut = 0;
        vt->reqsQueued = 0;

        vt->cdCmdIn = 0;
        vt->cdCmdOut = 0;
        vt->cdCmdsQueued = 0;

        vt->voiceCmdIn = 0;
        vt->voiceCmdOut = 0;
        vt->voiceCmdsQueued = 0;

        for (i = 0; i < 30; i++)
        {
            sprintf(&fileName[0], D_800D1EB0, i);

            if (CdSearchFile(&fp, &fileName[0]) == 0)
            {
                vt->xaFileInfo[i].startPos = 0;
            }
            else
            {
                vt->xaFileInfo[i].startPos = CdPosToInt(&fp.pos);
            }
        }
    }
}

void putCdCommand(XAVoiceTracker *vt, unsigned char cdCommand, int numParams, unsigned char *params)
{
    int i;

    vt->cdCmdQueue[vt->cdCmdIn].cdCommand = cdCommand;

    for (i = 0; i < numParams; i++)
    {
        vt->cdCmdQueue[vt->cdCmdIn].cdCmdParam[i] = params[i];
    }

    if (vt->cdCmdsQueued < 7)
    {
        vt->cdCmdsQueued++;
        vt->cdCmdIn++;

        if (vt->cdCmdIn == 8)
        {
            vt->cdCmdIn = 0;
        }
    }
}

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

void processCdCommands(XAVoiceTracker *vt)
{
    CdCommand *cmd;

    if (vt->cdStatus == 2)
    {
        vt->cdStatus = 1;

        cmd = &vt->cdCmdQueue[vt->cdCmdOut];

        CdControl(cmd->cdCommand, cmd->cdCmdParam, vt->cdResult);
    }
    else if ((vt->cdCmdsQueued != 0) && (vt->cdStatus != 1))
    {
        vt->cdStatus = 1;

        cmd = &vt->cdCmdQueue[vt->cdCmdOut];

        vt->prevCallback = CdSyncCallback((void *)VOICEXA_CdSyncCallback);

        CdControl(cmd->cdCommand, cmd->cdCmdParam, vt->cdResult);
    }
}

void putVoiceCommand(XAVoiceTracker *vt, unsigned char voiceCmd, unsigned char nextVoiceStatus, int voiceCmdParam)
{
    vt->voiceCmdQueue[vt->voiceCmdIn].voiceCmd = voiceCmd;

    vt->voiceCmdQueue[vt->voiceCmdIn].nextVoiceStatus = nextVoiceStatus;

    vt->voiceCmdQueue[vt->voiceCmdIn].voiceCmdParam = voiceCmdParam;

    if (vt->voiceCmdsQueued < 15)
    {
        vt->voiceCmdsQueued++;
        vt->voiceCmdIn++;

        if (vt->voiceCmdIn == 16)
        {
            vt->voiceCmdIn = 0;
        }
    }
}

INCLUDE_ASM("asm/nonmatchings/Game/VOICEXA", processVoiceCommands);

INCLUDE_ASM("asm/nonmatchings/Game/VOICEXA", voiceCmdPlay);

void voiceCmdStop(XAVoiceTracker *vt, short cmdParam)
{
    SpuCommonAttr spuattr;

    (void)cmdParam;

    if (vt->voiceStatus != 0)
    {
        putCdCommand(vt, 9, 0, NULL);

        spuattr.mask = 0x2200;

        spuattr.cd.mix = 0;
        spuattr.ext.mix = 0;

        SpuSetCommonAttr(&spuattr);

        aadStartMusicMasterVolFade(gameTrackerX.sound.gMusicVol, 1, NULL);
    }
}

void voiceCmdPause(XAVoiceTracker *vt, short cmdParam)
{
    (void)cmdParam;

    if ((vt->voiceStatus == 1) || (vt->voiceStatus == 2))
    {
        putCdCommand(vt, 9, 0, NULL);
    }
}

void voiceCmdResume(XAVoiceTracker *vt, short cmdParam)
{
    (void)cmdParam;

    if (vt->voiceStatus == 3)
    {
        putCdCommand(vt, 27, 4, (unsigned char *)&vt->currentPos);
    }
}

void voiceCmdNull()
{
}

INCLUDE_ASM("asm/nonmatchings/Game/VOICEXA", VOICEXA_Play);

INCLUDE_ASM("asm/nonmatchings/Game/VOICEXA", VOICEXA_FinalStatus);

INCLUDE_ASM("asm/nonmatchings/Game/VOICEXA", VOICEXA_Pause);

INCLUDE_ASM("asm/nonmatchings/Game/VOICEXA", VOICEXA_Resume);

INCLUDE_ASM("asm/nonmatchings/Game/VOICEXA", VOICEXA_Tick);

INCLUDE_ASM("asm/nonmatchings/Game/VOICEXA", VOICEXA_IsPlaying);
