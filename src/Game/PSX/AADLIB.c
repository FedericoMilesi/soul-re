#include "common.h"
#include "Game/PSX/AADSEQEV.h"

AadMemoryStruct *aadMem;

EXTERN STATIC unsigned long __hblankEvent;

unsigned long aadGetMemorySize(AadInitAttr *attributes)
{
    return (1488 * attributes->numSlots) + 7304;
}

INCLUDE_ASM("asm/nonmatchings/Game/PSX/AADLIB", aadInit);

void aadInstallUpdateFunc(long (*updateFuncPtr)(), int hblanksPerUpdate)
{
    EnterCriticalSection();

    __hblankEvent = OpenEvent(0xF2000001, 2, 4096, updateFuncPtr);

    EnableEvent(__hblankEvent);

    SetRCnt(0xF2000001, hblanksPerUpdate, 4096);

    StartRCnt(0xF2000001);

    ExitCriticalSection();
}

void aadInitVolume()
{
    aadMem->masterVolume = 0;

    SpuSetCommonCDMix(0);
    SpuSetCommonMasterVolume(0, 0);
}

INCLUDE_ASM("asm/nonmatchings/Game/PSX/AADLIB", aadSetMasterVolume);

void aadStartMasterVolumeFade(int targetVolume, int volumeStep, void (*fadeCompleteCallback)())
{
    aadMem->masterVolFader.volumeStep = volumeStep;

    aadMem->masterVolFader.targetVolume = targetVolume;

    aadMem->masterVolFader.fadeCompleteCallback = fadeCompleteCallback;
}

void aadSetSfxMasterVolume(int volume)
{
    aadMem->sfxMasterVol = volume & 0xFF;
}

void aadSetMusicMasterVolume(int volume)
{
    int slotNumber;

    aadMem->musicMasterVol = volume;

    for (slotNumber = 0; slotNumber < aadMem->numSlots; slotNumber++)
    {
        aadUpdateSlotVolPan(aadMem->sequenceSlots[slotNumber]);
    }
}

INCLUDE_ASM("asm/nonmatchings/Game/PSX/AADLIB", aadStartMusicMasterVolFade);

INCLUDE_ASM("asm/nonmatchings/Game/PSX/AADLIB", aadShutdown);

INCLUDE_ASM("asm/nonmatchings/Game/PSX/AADLIB", aadSlotUpdateWrapper);

INCLUDE_ASM("asm/nonmatchings/Game/PSX/AADLIB", aadSlotUpdate);

INCLUDE_ASM("asm/nonmatchings/Game/PSX/AADLIB", aadCreateFourCharID);

INCLUDE_ASM("asm/nonmatchings/Game/PSX/AADLIB", aadLoadDynamicSoundBank);

INCLUDE_ASM("asm/nonmatchings/Game/PSX/AADLIB", aadLoadDynamicSoundBankReturn);

INCLUDE_ASM("asm/nonmatchings/Game/PSX/AADLIB", aadLoadDynamicSoundBankReturn2);

INCLUDE_ASM("asm/nonmatchings/Game/PSX/AADLIB", aadFreeDynamicSoundBank);

INCLUDE_ASM("asm/nonmatchings/Game/PSX/AADLIB", aadOpenDynamicSoundBank);

INCLUDE_ASM("asm/nonmatchings/Game/PSX/AADLIB", aadLoadDynamicSfx);

INCLUDE_ASM("asm/nonmatchings/Game/PSX/AADLIB", aadFreeDynamicSfx);

INCLUDE_ASM("asm/nonmatchings/Game/PSX/AADLIB", aadRelocateMusicMemoryBegin);

INCLUDE_ASM("asm/nonmatchings/Game/PSX/AADLIB", aadRelocateMusicMemoryEnd);

INCLUDE_ASM("asm/nonmatchings/Game/PSX/AADLIB", aadRelocateSfxMemory);

INCLUDE_ASM("asm/nonmatchings/Game/PSX/AADLIB", aadGetNumLoadsQueued);

INCLUDE_ASM("asm/nonmatchings/Game/PSX/AADLIB", aadPurgeLoadQueue);

INCLUDE_ASM("asm/nonmatchings/Game/PSX/AADLIB", aadProcessLoadQueue);

INCLUDE_ASM("asm/nonmatchings/Game/PSX/AADLIB", aadLoadDynamicSfxAbort);

INCLUDE_ASM("asm/nonmatchings/Game/PSX/AADLIB", aadLoadDynamicSfxDone);

INCLUDE_ASM("asm/nonmatchings/Game/PSX/AADLIB", aadLoadDynamicSfxReturn);

INCLUDE_ASM("asm/nonmatchings/Game/PSX/AADLIB", aadWaveMalloc);

INCLUDE_ASM("asm/nonmatchings/Game/PSX/AADLIB", aadGetSramBlockAddr);

INCLUDE_ASM("asm/nonmatchings/Game/PSX/AADLIB", aadWaveFree);

INCLUDE_ASM("asm/nonmatchings/Game/PSX/AADLIB", aadFreeSingleDynSfx);

INCLUDE_ASM("asm/nonmatchings/Game/PSX/AADLIB", setSramFullAlarm);

INCLUDE_ASM("asm/nonmatchings/Game/PSX/AADLIB", aadLoadSingleDynSfx);

INCLUDE_ASM("asm/nonmatchings/Game/PSX/AADLIB", HackCallback);

INCLUDE_ASM("asm/nonmatchings/Game/PSX/AADLIB", aadLoadDynamicSfxReturn2);

INCLUDE_ASM("asm/nonmatchings/Game/PSX/AADLIB", aadCheckSramFragmented);

INCLUDE_ASM("asm/nonmatchings/Game/PSX/AADLIB", aadProcessSramDefrag);

INCLUDE_ASM("asm/nonmatchings/Game/PSX/AADLIB", aadIsSfxLoaded);

INCLUDE_ASM("asm/nonmatchings/Game/PSX/AADLIB", aadInitSequenceSlot);

INCLUDE_ASM("asm/nonmatchings/Game/PSX/AADLIB", aadWaitForSramTransferComplete);

INCLUDE_ASM("asm/nonmatchings/Game/PSX/AADLIB", aadInitReverb);

INCLUDE_ASM("asm/nonmatchings/Game/PSX/AADLIB", aadShutdownReverb);

INCLUDE_ASM("asm/nonmatchings/Game/PSX/AADLIB", aadGetReverbMode);

INCLUDE_ASM("asm/nonmatchings/Game/PSX/AADLIB", aadGetReverbSize);

INCLUDE_ASM("asm/nonmatchings/Game/PSX/AADLIB", aadGetReverbDepth);

INCLUDE_ASM("asm/nonmatchings/Game/PSX/AADLIB", aadGetNumDynamicSequences);

INCLUDE_ASM("asm/nonmatchings/Game/PSX/AADLIB", aadAssignDynamicSequence);

INCLUDE_ASM("asm/nonmatchings/Game/PSX/AADLIB", aadGetTempoFromDynamicSequence);

INCLUDE_ASM("asm/nonmatchings/Game/PSX/AADLIB", aadSetSlotTempo);

INCLUDE_ASM("asm/nonmatchings/Game/PSX/AADLIB", aadStartSlot);

INCLUDE_ASM("asm/nonmatchings/Game/PSX/AADLIB", aadStopSlot);

INCLUDE_ASM("asm/nonmatchings/Game/PSX/AADLIB", aadStopAllSlots);

INCLUDE_ASM("asm/nonmatchings/Game/PSX/AADLIB", aadDisableSlot);

INCLUDE_ASM("asm/nonmatchings/Game/PSX/AADLIB", aadEnableSlot);

INCLUDE_ASM("asm/nonmatchings/Game/PSX/AADLIB", aadPauseSlot);

INCLUDE_ASM("asm/nonmatchings/Game/PSX/AADLIB", aadResumeSlot);

INCLUDE_ASM("asm/nonmatchings/Game/PSX/AADLIB", aadGetSlotStatus);

INCLUDE_ASM("asm/nonmatchings/Game/PSX/AADLIB", aadAllNotesOff);

INCLUDE_ASM("asm/nonmatchings/Game/PSX/AADLIB", aadMuteChannels);

INCLUDE_ASM("asm/nonmatchings/Game/PSX/AADLIB", aadUnMuteChannels);

INCLUDE_ASM("asm/nonmatchings/Game/PSX/AADLIB", aadInstallEndSequenceCallback);

INCLUDE_ASM("asm/nonmatchings/Game/PSX/AADLIB", aadSetUserVariable);

INCLUDE_ASM("asm/nonmatchings/Game/PSX/AADLIB", aadSetNoUpdateMode);

INCLUDE_ASM("asm/nonmatchings/Game/PSX/AADLIB", aadPauseSound);

INCLUDE_ASM("asm/nonmatchings/Game/PSX/AADLIB", aadCancelPauseSound);

INCLUDE_ASM("asm/nonmatchings/Game/PSX/AADLIB", aadResumeSound);
