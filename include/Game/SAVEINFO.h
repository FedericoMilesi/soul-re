#ifndef _SAVEINFO_H_
#define _SAVEINFO_H_

void SAVE_DebugSaveGame();
void SAVE_LoadSaveGame();
void SAVE_LoadSaveGame();

// size: 0x8
typedef struct _MONAPI_Regenerator {
    // offset: 0000
    unsigned long regenTime;
    // offset: 0004
    short introUniqueID;
    // offset: 0006
    short streamUnitID;
} MONAPI_Regenerator;

// size: 0x78
typedef struct _GlobalSaveTracker {
    // offset: 0000
    short savedID;
    // offset: 0002
    short saveSize;
    // offset: 0004
    short flags;
    // offset: 0006
    short saveVersion;
    // offset: 0008
    unsigned long currentTime;
    // offset: 000C
    short humanOpinionOfRaziel;
    // offset: 000E
    char numRegens;
    // offset: 0010 (80 bytes)
    struct _MONAPI_Regenerator regenEntries[10];
    // offset: 0060 (20 bytes)
    struct gSoundData sound;
    // offset: 0074
    short sizeUsedInBlock;
    // offset: 0076
    short CurrentBirthID;
} GlobalSaveTracker;

extern GlobalSaveTracker *GlobalSave;

#endif
