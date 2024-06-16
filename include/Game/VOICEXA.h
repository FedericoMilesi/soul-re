#ifndef _VOICEXA_H_
#define _VOICEXA_H_

// size: 0x8
typedef struct CdCommand {
    // offset: 0000
    unsigned short flags;
    // offset: 0002
    unsigned char unused;
    // offset: 0003
    unsigned char cdCommand;
    // offset: 0004 (4 bytes)
    unsigned char cdCmdParam[4];
} CdCommand;

// size: 0x4
typedef struct VoiceCommand {
    // offset: 0000
    unsigned char voiceCmd;
    // offset: 0001
    unsigned char nextVoiceStatus;
    // offset: 0002
    unsigned short voiceCmdParam;
} VoiceCommand;

// size: 0x4
typedef struct XAFileInfo {
    int startPos;
} XAFileInfo;

// size: 0x128
typedef struct XAVoiceTracker {
    // offset: 0000 (4 bytes)
    struct CdlLOC currentPos;
    // offset: 0004
    int currentSector;
    // offset: 0008
    int endSector;
    // offset: 000C
    void (*prevCallback)();
    // offset: 0010 (8 bytes)
    unsigned char cdResult[8];
    // offset: 0018 (64 bytes)
    struct CdCommand cdCmdQueue[8];
    // offset: 0058 (8 bytes)
    unsigned short requestQueue[4];
    // offset: 0060 (64 bytes)
    struct VoiceCommand voiceCmdQueue[16];
    // offset: 00A0
    unsigned char cdCmdIn;
    // offset: 00A1
    unsigned char cdCmdOut;
    // offset: 00A2
    unsigned char cdCmdsQueued;
    // offset: 00A3
    unsigned char reqIn;
    // offset: 00A4
    unsigned char reqOut;
    // offset: 00A5
    unsigned char reqsQueued;
    // offset: 00A6
    unsigned char voiceCmdIn;
    // offset: 00A7
    unsigned char voiceCmdOut;
    // offset: 00A8
    unsigned char voiceCmdsQueued;
    // offset: 00A9
    unsigned char unused1;
    // offset: 00AA
    unsigned char voiceStatus;
    // offset: 00AB
    unsigned char cdStatus;
    // offset: 00AC
    short fileNum;
    // offset: 00AE
    short unused2;
    // offset: 00B0 (120 bytes)
    struct XAFileInfo xaFileInfo[30];
} XAVoiceTracker;

#endif
