#ifndef _SOUND_H_
#define _SOUND_H_

#include "common.h"

// size: 0x3
typedef struct SoundInstance {
    // offset: 0000
    unsigned char channel;
    // offset: 0001
    unsigned char state;
    // offset: 0002
    unsigned char delay;
} SoundInstance;

// size: 0x24
typedef struct SoundEffectChannel {
    // offset: 0000
    unsigned char inUse;
    // offset: 0001
    unsigned char unused;
    // offset: 0002
    unsigned short unused1;
    // offset: 0004
    unsigned long handle;
    // offset: 0008
    short volume;
    // offset: 000A
    short volumeChangeTime;
    // offset: 000C
    short volumeChangeTimeSave;
    // offset: 000E
    short volumeChangePerUpdate;
    // offset: 0010
    short volumeChangeSign;
    // offset: 0012
    short volumeChangeErrPerUpdate;
    // offset: 0014
    short volumeChangeError;
    // offset: 0016
    short pitch;
    // offset: 0018
    short pitchChangeTime;
    // offset: 001A
    short pitchChangeTimeSave;
    // offset: 001C
    short pitchChangePerUpdate;
    // offset: 001E
    short pitchChangeSign;
    // offset: 0020
    short pitchChangeErrPerUpdate;
    // offset: 0022
    short pitchChangeError;
} SoundEffectChannel;

// size: 0x14
typedef struct gSoundData {
    // offset: 0000
    unsigned long gMasterVol;
    // offset: 0004
    unsigned long gMusicVol;
    // offset: 0008
    unsigned long gSfxVol;
    // offset: 000C
    unsigned long gVoiceVol;
    // offset: 0010
    char gSfxOn;
    // offset: 0011
    char gMusicOn;
    // offset: 0012
    char gVoiceOn;
    // offset: 0013
    char soundsLoaded;
} gSoundData;

// size: 0x8
typedef struct MusicLoadCmd {
    // offset: 0000
    int type;
    // offset: 0004
    int data;
} MusicLoadCmd;

// size: 0x4C
typedef struct MusicLoadInfo {
    // offset: 0000
    int state;
    // offset: 0004
    int nextState;
    // offset: 0008
    int errorStatus;
    // offset: 000C
    int bankLoaded;
    // offset: 0010
    int checkMusicDelay;
    // offset: 0014
    int currentMusicPlane;
    // offset: 0018 (8 bytes)
    char currentMusicName[8];
    // offset: 0020 (32 bytes)
    struct MusicLoadCmd commandQueue[4];
    // offset: 0040
    int commandIn;
    // offset: 0044
    int commandOut;
    // offset: 0048
    int numCmdsInQueue;
} MusicLoadInfo;

// size: 0x18
typedef struct AadTempoCounter {
    // offset: 0000
    unsigned long currentTick;
    // offset: 0004
    unsigned long currentError;
    // offset: 0008
    unsigned long tickTimeFixed;
    // offset: 000C
    unsigned long errorPerUpdate;
    // offset: 0010
    unsigned short ticksPerUpdate;
    // offset: 0012
    unsigned short ppqn;
    // offset: 0014
    unsigned long quarterNoteTime;
} AadTempoCounter;

// size: 0xC
typedef struct AadSeqEvent {
    // offset: 0000
    unsigned long deltaTime;
    // offset: 0004
    unsigned char track;
    // offset: 0005
    unsigned char statusByte;
    // offset: 0006 (6 bytes)
    char dataByte[6];
} AadSeqEvent;

// size: 0x5D0
typedef struct _AadSequenceSlot {
    // offset: 0000 (24 bytes)
    struct AadTempoCounter tempo;
    // offset: 0018 (768 bytes)
    struct AadSeqEvent eventQueue[16][4];
    // offset: 0318 (16 bytes)
    unsigned char eventIn[16];
    // offset: 0328 (16 bytes)
    unsigned char eventOut[16];
    // offset: 0338 (16 bytes)
    unsigned char eventsInQueue[16];
    // offset: 0348 (64 bytes)
    unsigned char *sequencePosition[16];
    // offset: 0388 (64 bytes)
    unsigned long lastEventExecutedTime[16];
    // offset: 03C8 (16 bytes)
    unsigned char runningStatus[16];
    // offset: 03D8 (16 bytes)
    unsigned char trackFlags[16];
    // offset: 03E8 (256 bytes)
    unsigned char *loopSequencePosition[16][4];
    // offset: 04E8 (16 bytes)
    unsigned char loopCurrentNestLevel[16];
    // offset: 04F8 (64 bytes)
    unsigned char loopCounter[16][4];
    // offset: 0538 (1488 bytes)
    struct _AadSequenceSlot *selectedSlotPtr;
    // offset: 053C
    unsigned char selectedSlotNum;
    // offset: 053D
    unsigned char selectedChannel;
    // offset: 053E
    unsigned char sequenceNumberAssigned;
    // offset: 053F
    unsigned char thisSlotNumber;
    // offset: 0540
    unsigned short status;
    // offset: 0542
    unsigned short channelMute;
    // offset: 0544
    unsigned short delayedMuteMode;
    // offset: 0546
    unsigned short delayedMuteCmds;
    // offset: 0548
    unsigned short delayedUnMuteCmds;
    // offset: 054A
    unsigned short unused;
    // offset: 054C
    unsigned short enableSustainUpdate;
    // offset: 054E
    unsigned short ignoreTranspose;
    // offset: 0550
    unsigned char slotFlags;
    // offset: 0551
    unsigned char slotID;
    // offset: 0552
    unsigned char slotVolume;
    // offset: 0553
    unsigned char slotPan;
    // offset: 0554
    int *masterVolPtr;
    // offset: 0558
    int selectedDynamicBank;
    // offset: 055C
    int sequenceAssignedDynamicBank;
    // offset: 0560 (16 bytes)
    unsigned char currentDynamicBank[16];
    // offset: 0570 (32 bytes)
    unsigned short pitchWheel[16];
    // offset: 0590 (16 bytes)
    unsigned char currentProgram[16];
    // offset: 05A0 (16 bytes)
    unsigned char volume[16];
    // offset: 05B0 (16 bytes)
    unsigned char panPosition[16];
    // offset: 05C0 (16 bytes)
    char transpose[16];
} AadSequenceSlot;

// size: 0xC
typedef struct AadVolFader {
    // offset: 0000
    int volumeStep;
    // offset: 0004
    int targetVolume;
    // offset: 0008
    void (*fadeCompleteCallback)();
} AadVolFader;

// size: 0xC
typedef struct AadSfxCommand {
    // offset: 0000
    unsigned char statusByte;
    // offset: 0001 (3 bytes)
    unsigned char dataByte[3];
    // offset: 0004
    unsigned long ulongParam;
    // offset: 0008
    short shortParam;
    // offset: 000A
    unsigned short unused;
} AadSfxCommand;

// size: 0x188
typedef struct AadSfxSlot {
    // offset: 0000 (384 bytes)
    struct AadSfxCommand commandQueue[32];
    // offset: 0180
    unsigned char commandIn;
    // offset: 0181
    unsigned char commandOut;
    // offset: 0182
    unsigned short commandsInQueue;
    // offset: 0184
    unsigned short handleCounter;
    // offset: 0186
    unsigned char sfxVolume;
    // offset: 0187
    unsigned char sfxPan;
} AadSfxSlot;

// size: 0x1C
typedef struct AadSynthVoice {
    // offset: 0000
    unsigned long voiceMask;
    // offset: 0004
    unsigned long handle;
    // offset: 0008
    unsigned char voiceID;
    // offset: 0009
    unsigned char priority;
    // offset: 000A
    unsigned char note;
    // offset: 000B
    unsigned char unused;
    // offset: 000C
    unsigned char program;
    // offset: 000D
    unsigned char baseProg;
    // offset: 000E
    unsigned char volume;
    // offset: 000F
    unsigned char updateVol;
    // offset: 0010
    unsigned char pan;
    // offset: 0011
    unsigned char voiceNum;
    // offset: 0012
    unsigned short flags;
    // offset: 0014 (16 bytes)
    struct AadToneAtr *toneAtr;
    // offset: 0018 (8 bytes)
    struct AadProgramAtr *progAtr;
} AadSynthVoice;

// size: 0x1C
typedef struct AadDynamicLoadRequest {
    // offset: 0000
    int type;
    // offset: 0004
    int handle;
    // offset: 0008
    long directoryID;
    // offset: 000C
    long flags;
    // offset: 0010 (12 bytes)
    char fileName[12];
} AadDynamicLoadRequest;

// size: 0x58
typedef struct AadDynamicBankLoadInfo {
    // offset: 0000 (32 bytes)
    char sndFileName[32];
    // offset: 0020 (32 bytes)
    char smpFileName[32];
    // offset: 0040
    int dynamicBankIndex;
    // offset: 0044
    int loadOption;
    // offset: 0048
    void (*userCallbackProc)();
    // offset: 004C
    unsigned long sramDataSize;
    // offset: 0050
    unsigned long nextSramAddr;
    // offset: 0054
    unsigned long flags;
} AadDynamicBankLoadInfo;

// size: 0x14
typedef struct _AadDynSfxFileHdr {
    // offset: 0000
    unsigned long snfID;
    // offset: 0004
    unsigned short snfVersion;
    // offset: 0006
    unsigned short uniqueID;
    // offset: 0008
    unsigned short handle;
    // offset: 000A
    unsigned short numSfxInFile;
    // offset: 000C (20 bytes)
    struct _AadDynSfxFileHdr *prevDynSfxFile;
    // offset: 0010 (20 bytes)
    struct _AadDynSfxFileHdr *nextDynSfxFile;
} AadDynSfxFileHdr;

// size: 0x10
typedef struct AadToneAtr {
    // offset: 0000
    unsigned char priority;
    // offset: 0001
    unsigned char parentProgram;
    // offset: 0002
    unsigned char volume;
    // offset: 0003
    unsigned char panPosition;
    // offset: 0004
    unsigned char centerNote;
    // offset: 0005
    char centerFine;
    // offset: 0006
    unsigned char minNote;
    // offset: 0007
    unsigned char maxNote;
    // offset: 0008
    unsigned char mode;
    // offset: 0009
    unsigned char pitchBendMax;
    // offset: 000A
    unsigned short adsr1;
    // offset: 000C
    unsigned short adsr2;
    // offset: 000E
    short waveIndex;
} AadToneAtr;

// size: 0x18
typedef struct AadDynSfxAttr {
    // offset: 0000
    unsigned short sfxID;
    // offset: 0002
    unsigned short waveID;
    // offset: 0004 (16 bytes)
    struct AadToneAtr toneAttr;
    // offset: 0014
    unsigned long waveSize;
} AadDynSfxAttr;

// size: 0x94
typedef struct AadDynamicSfxLoadInfo {
    // offset: 0000 (40 bytes)
    char snfFileName[40];
    // offset: 0028 (40 bytes)
    char smfFileName[40];
    // offset: 0050
    int fileHandle;
    // offset: 0054
    long directoryID;
    // offset: 0058
    long loadFlags;
    // offset: 005C
    long flags;
    // offset: 0060
    int smfLoadingState;
    // offset: 0064
    unsigned long bytesToLoad;
    // offset: 0068
    int numSfxToLoad;
    // offset: 006C
    int error;
    // offset: 0070
    unsigned long waveTransferAddr;
    // offset: 0074
    unsigned long totalSramUsed;
    // offset: 0078 (20 bytes)
    struct _AadDynSfxFileHdr *snfFile;
    // offset: 007C (24 bytes)
    struct AadDynSfxAttr attr;
} AadDynamicSfxLoadInfo;

// size: 0x20
typedef struct AadSramDefragInfo {
    // offset: 0000
    int status;
    // offset: 0004
    unsigned char *fragBuffer;
    // offset: 0008
    int masterListEntry;
    // offset: 000C
    int waveID;
    // offset: 0010
    unsigned long destSramAddr;
    // offset: 0014
    unsigned long srcSramAddr;
    // offset: 0018
    unsigned long moveSize;
    // offset: 001C
    unsigned long readSize;
} AadSramDefragInfo;

// size: 0x14
typedef struct AadLoadedSfxToneAttr {
    // offset: 0000
    unsigned short referenceCount;
    // offset: 0002
    unsigned short waveID;
    // offset: 0004 (16 bytes)
    struct AadToneAtr toneAttr;
} AadLoadedSfxToneAttr;

// size: 0x4
typedef struct AadLoadedSfxWaveAttr {
    // offset: 0000
    unsigned short referenceCount;
    // offset: 0002
    unsigned char unused;
    // offset: 0003
    unsigned char sramHandle;
} AadLoadedSfxWaveAttr;

// size: 0x8
typedef struct AadNewSramBlockDesc {
    // offset: 0000
    unsigned short waveID;
    // offset: 0002
    unsigned short address;
    // offset: 0004
    unsigned short size;
    // offset: 0006
    unsigned char prevIndex;
    // offset: 0007
    unsigned char nextIndex;
} AadNewSramBlockDesc;

// size: 0x1C88
typedef struct AadMemoryStruct {
    // offset: 0000
    unsigned long updateCounter;
    // offset: 0004
    int numSlots;
    // offset: 0008
    int updateMode;
    // offset: 000C
    int masterVolume;
    // offset: 0010 (12 bytes)
    struct AadVolFader masterVolFader;
    // offset: 001C
    int sfxMasterVol;
    // offset: 0020
    int musicMasterVol;
    // offset: 0024
    int flags;
    // offset: 0028 (12 bytes)
    struct AadVolFader musicMasterVolFader;
    // offset: 0034 (32 bytes)
    struct _AadSequenceSlot *sequenceSlots[8];
    // offset: 0054 (392 bytes)
    struct AadSfxSlot sfxSlot;
    // offset: 01DC (672 bytes)
    struct AadSynthVoice synthVoice[24];
    // offset: 047C (24 bytes)
    char voiceStatus[24];
    // offset: 0494 (48 bytes)
    unsigned short voicePitchSave[24];
    // offset: 04C4
    unsigned long voiceKeyOffRequest;
    // offset: 04C8
    unsigned long voiceKeyOnRequest;
    // offset: 04CC
    unsigned long voiceReverbRequest;
    // offset: 04D0 (8 bytes)
    struct AadSoundBankHdr *dynamicSoundBankHdr[2];
    // offset: 04D8 (8 bytes)
    struct AadProgramAtr *dynamicProgramAtr[2];
    // offset: 04E0 (8 bytes)
    struct AadToneAtr *dynamicToneAtr[2];
    // offset: 04E8 (8 bytes)
    unsigned long *dynamicWaveAddr[2];
    // offset: 04F0 (8 bytes)
    unsigned char **dynamicSequenceAddressTbl[2];
    // offset: 04F8 (8 bytes)
    unsigned long *dynamicSequenceLabelOffsetTbl[2];
    // offset: 0500 (8 bytes)
    int dynamicBankStatus[2];
    // offset: 0508 (8 bytes)
    unsigned char *dynamicSoundBankData[2];
    // offset: 0510 (8 bytes)
    unsigned long dynamicSoundBankSramData[2];
    // offset: 0518 (448 bytes)
    struct AadDynamicLoadRequest loadRequestQueue[16];
    // offset: 06D8 (88 bytes)
    struct AadDynamicBankLoadInfo dynamicBankLoadInfo;
    // offset: 0730
    void (*nonBlockLoadProc)();
    // offset: 0734
    void (*nonBlockBufferedLoadProc)();
    // offset: 0738
    void *(*memoryMallocProc)();
    // offset: 073C
    void (*memoryFreeProc)();
    // offset: 0740
    int nextLoadReqIn;
    // offset: 0744
    int nextLoadReqOut;
    // offset: 0748
    int numLoadReqsQueued;
    // offset: 074C (148 bytes)
    struct AadDynamicSfxLoadInfo dynamicSfxLoadInfo;
    // offset: 07E0 (20 bytes)
    struct _AadDynSfxFileHdr *firstDynSfxFile;
    // offset: 07E4
    int nextFileHandle;
    // offset: 07E8 (32 bytes)
    struct AadSramDefragInfo sramDefragInfo;
    // offset: 0808 (512 bytes)
    unsigned char sfxToneMasterList[512];
    // offset: 0A08 (512 bytes)
    unsigned char sfxWaveMasterList[512];
    // offset: 0C08 (2560 bytes)
    struct AadLoadedSfxToneAttr sfxToneAttrTbl[128];
    // offset: 1608 (480 bytes)
    struct AadLoadedSfxWaveAttr sfxWaveAttrTbl[120];
    // offset: 17E8
    int nextToneIndex;
    // offset: 17EC
    int nextWaveIndex;
    // offset: 17F0 (1024 bytes)
    struct AadNewSramBlockDesc sramDescriptorTbl[128];
    // offset: 1BF0
    int nextSramDescIndex;
    // offset: 1BF4
    int firstSramBlockDescIndex;
    // offset: 1BF8
    void (*controller11Callback)();
    // offset: 1BFC
    void (*endSequenceCallback)();
    // offset: 1C00
    long controller11CallbackData;
    // offset: 1C04
    long endSequenceCallbackData;
    // offset: 1C08 (128 bytes)
    unsigned char userVariables[128];
} AadMemoryStruct;

typedef struct ObjectPeriodicSound {
    // offset: 0000
    unsigned char type;
    // offset: 0001
    unsigned char numSfxIDs;
    // offset: 0002
    unsigned char soundInst;
    // offset: 0003
    unsigned char flags;
    // offset: 0004
    unsigned short minVolDistance;
    // offset: 0006
    short pitch;
    // offset: 0008
    unsigned short pitchVariation;
    // offset: 000A
    unsigned char maxVolume;
    // offset: 000B
    unsigned char maxVolVariation;
    // offset: 000C
    unsigned char initialDelay;
    // offset: 000D
    unsigned char initialDelayVariation;
    // offset: 000E
    unsigned char onTime;
    // offset: 000F
    unsigned char onTimeVariation;
    // offset: 0010
    unsigned char offTime;
    // offset: 0011
    unsigned char offTimeVariation;
} ObjectPeriodicSound;

unsigned long SOUND_Play3dSound(Position *position, int sfxToneID, int pitch, int maxVolume, int minVolDist);
void SOUND_ProcessInstanceSounds(unsigned char *sfxFileData, SoundInstance *soundInstTbl, Position *position, int livesInOnePlace, int inSpectral, int hidden, int burning, long *triggerFlags);
void SOUND_EndInstanceSounds(unsigned char *sfxFileData, SoundInstance *soundInstTbl);
unsigned long SndPlayVolPan(unsigned int sample, unsigned short vol, unsigned short pan, short pitch);
void SOUND_HandleGlobalValueSignal(int name, long data);
void SOUND_MusicOff();
void SOUND_MusicOn();
void SOUND_SfxOff();
void SOUND_SfxOn();
void SOUND_ShutdownMusic();
void SOUND_SetMusicVolume(int newVolume);
void SOUND_SetSfxVolume(int newVolume);
void SOUND_SetVoiceVolume(int newVolume);
void SOUND_StopAllSound();
void SOUND_ResetAllSound();
void SndEndLoop(unsigned long handle);
void SOUND_PlaneShift(int newPlane);
void SOUND_SetMusicVariable(int variable, int value);
void SOUND_PutMusicCommand(int cmdType, int cmdData);
void SOUND_ProcessMusicLoad();
unsigned long SndUpdateVolPanPitch(unsigned long handle, unsigned short vol, unsigned short pan, short pitch);
SoundEffectChannel *SndGetSfxChannel(int channelNum);
void SndCloseSfxChannel(int channelNum);

#endif
