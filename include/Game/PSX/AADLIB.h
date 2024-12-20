#ifndef _AADLIB_H_
#define _AADLIB_H_

#include "common.h"

AadMemoryStruct *aadMem;

int aadIsSfxLoaded(unsigned int toneID);
int aadFreeDynamicSfx(int handle);
int aadLoadDynamicSfx(char *fileName, long directoryID, long flags);
void aadStartMusicMasterVolFade(int targetVolume, int volumeStep, void (*fadeCompleteCallback)());
void aadStopAllSlots();
int aadFreeDynamicSoundBank(int dynamicBankIndex);
void aadProcessLoadQueue();
void (*aadInstallEndSequenceCallback(void (*callbackProc)(), long data))();
int aadAssignDynamicSequence(int bank, int sequenceNumber, int slotNumber);
void aadStartSlot(int slotNumber);
void aadEnableSlot(int slotNumber);
void aadDisableSlot(int slotNumber);
int aadGetSlotStatus(int slotNumber);
void aadStopSlot(int slotNumber);
void aadInitReverb();
void aadShutdownReverb();
void aadCancelPauseSound();
void aadResumeSound();
void aadPauseSound();
void aadSetSfxMasterVolume(int volume);
void aadSetMusicMasterVolume(int volume);
void aadSetUserVariable(int variableNumber, int value);
void aadShutdown();
unsigned long aadGetMemorySize(AadInitAttr *attributes);
int aadInit(AadInitAttr *attributes, unsigned char *memoryPtr);
int aadLoadDynamicSoundBank(char *sndFileName, char *smpFileName, int dynamicBankIndex, int loadOption, void (*retProc)());
unsigned long aadGetSramBlockAddr(int handle);
void aadRelocateSfxMemory(void *oldAddress, int offset);
void aadRelocateMusicMemoryEnd(void *oldAddress, int offset);
void aadRelocateMusicMemoryBegin();

#endif
