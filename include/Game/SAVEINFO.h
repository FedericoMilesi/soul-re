#ifndef _SAVEINFO_H_
#define _SAVEINFO_H_

#include "common.h"
#include "Game/MONSTER/MONAPI.h"

// size: 0x6
typedef struct _SmallRotation {
    // offset: 0000
    short x;
    // offset: 0002
    short y;
    // offset: 0004
    short z;
} SmallRotation;

// size: 0xC
typedef struct SavedIntroSpline {
    // offset: 0000
    unsigned char savedID;
    // offset: 0001
    unsigned char shiftedSaveSize;
    // offset: 0002
    short introUniqueID;
    // offset: 0004
    short splineFlags;
    // offset: 0006
    short splineKeyFrame;
    // offset: 0008
    short splineClipBeg;
    // offset: 000A
    short splineClipEnd;
} SavedIntroSpline;

// size: 0x4
typedef struct SavedIntroSmall {
    // offset: 0000
    unsigned char savedID;
    // offset: 0001
    unsigned char shiftedSaveSize;
    // offset: 0002
    short introUniqueID;
} SavedIntroSmall;

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

/*// size: 0x10
typedef struct _MonsterSaveInfo {
    // offset: 0000
    long mvFlags;
    // offset: 0004
    long auxFlags;
    // offset: 0008
    short soulID;
    // offset: 000A
    short soulJuice;
    // offset: 0060 (3 bytes)
    // unsigned int age;
    // offset: 0063 (6 bytes)
    // unsigned int state;
    // offset: 0069 (5 bytes)
    // unsigned int behaviorState;
    // offset: 006E (6 bytes)
    // unsigned int anim;
    // offset: 0074 (1 bytes)
    // unsigned int animLooping;
    // offset: 0075 (3 bytes)
    // unsigned int causeOfDeath;
} MonsterSaveInfo;*/

typedef struct _MonsterSaveInfo {
    long mvFlags; // size=0, offset=0
    long auxFlags; // size=0, offset=4
    short soulID; // size=0, offset=8
    short soulJuice; // size=0, offset=10
    unsigned int age : 3; // offset=12.0
    unsigned int state : 6; // offset=12.3
    unsigned int behaviorState : 5; // offset=13.1
    unsigned int anim : 6; // offset=13.6
    unsigned int animLooping : 1; // offset=14.4
    unsigned int causeOfDeath : 3; // offset=14.5
} MonsterSaveInfo;

// size: 0x8
typedef struct SavedLevel {
    // offset: 0000
    unsigned char savedID;
    // offset: 0001
    unsigned char shiftedSaveSize;
    // offset: 0002
    short areaID;
    // offset: 0004
    short waterZ;
    // offset: 0006
    short numberBSPTreesSaved;
} SavedLevel;

// size: 0x10
typedef struct SavedInfoTracker {
    // offset: 0000
    char *MemoryCardBuffer;
    // offset: 0004
    char *InfoStart;
    // offset: 0008
    char *InfoEnd;
    // offset: 000C
    char *EndOfMemory;
} SavedInfoTracker;

// size: 0x2
typedef struct SavedBasic {
    // offset: 0000
    unsigned char savedID;
    // offset: 0001
    unsigned char shiftedSaveSize;
} SavedBasic;

// size: 0x28
typedef struct _SavedIntro {
    // offset: 0000
    unsigned char savedID;
    // offset: 0001
    unsigned char shiftedSaveSize;
    // offset: 0002
    unsigned char lightGroup;
    // offset: 0003
    unsigned char specturalLightGroup;
    // offset: 0004 (8 bytes)
    char name[8];
    // offset: 000C
    short introUniqueID;
    // offset: 000E
    short streamUnitID;
    // offset: 0010
    short birthUnitID;
    // offset: 0012
    unsigned short attachedUniqueID;
    // offset: 0014 (6 bytes)
    struct _SmallRotation smallRotation;
    // offset: 001A (6 bytes)
    struct _Position position;
    // offset: 0020
    long flags;
    // offset: 0024
    long flags2;
} SavedIntro;

// size: 0x342
typedef struct SavedDeadDeadBits {
    // offset: 0000
    unsigned char savedID;
    // offset: 0001
    unsigned char shiftedSaveSize;
    // offset: 0002 (832 bytes)
    char deadDeadBits[832];
} SavedDeadDeadBits;

typedef struct _SavedIntroWithIntro {
    // offset: 0000
    unsigned char savedID;
    // offset: 0001
    unsigned char shiftedSaveSize;
    // offset: 0002
    unsigned short attachedUniqueID;
    // offset: 0004
    short introOffset;
    // offset: 0006
    short birthUnitID;
    // offset: 0008
    short introUniqueID;
    // offset: 000A
    unsigned char lightGroup;
    // offset: 000B
    unsigned char specturalLightGroup;
    // offset: 000C
    long flags;
    // offset: 0010
    long flags2;
    // offset: 0014 (6 bytes)
    struct _SmallRotation smallRotation;
    // offset: 001A (6 bytes)
    struct _Position position;
} SavedIntroWithIntro;

// size: 0x8
typedef struct SavedBspTree {
    // offset: 0000 (6 bytes)
    struct _Position localOffset;
    // offset: 0006
    unsigned char importantFlagsSaved;
    // offset: 0007
    unsigned char bspIndex;
} SavedBspTree;

// size: 0x10
typedef struct ActualSavedLevel {
    // offset: 0000
    unsigned char savedID;
    // offset: 0001
    unsigned char shiftedSaveSize;
    // offset: 0002
    short areaID;
    // offset: 0004
    short waterZ;
    // offset: 0006
    short numberBSPTreesSaved;
    // offset: 0008 (8 bytes)
    struct SavedBspTree bspTreeArray[1];
} ActualSavedLevel;

void SAVE_DebugSaveGame();
void SAVE_LoadSaveGame();
void SAVE_LoadSaveGame();
void SAVE_DeleteInstance(Instance *instance);
void SAVE_MarkDeadDead(Instance *instance);
long SAVE_IsIntroDeadDead(Intro *intro);
long SAVE_HasSavedIntro(Intro *intro, long currentStreamID);
void SAVE_DoInstanceDeadDead(Instance *instance);
SavedIntroSmall *SAVE_GetSavedSmallIntro(Instance *instance);
SavedIntroSpline *SAVE_GetIntroSpline(Instance *instance);
void SAVE_Instance(Instance *instance, Level *level);
SavedLevel *SAVE_CreatedSavedLevel(long areaID, Level *level);
void SAVE_IntroForStreamID(StreamUnit *streamUnit);
void SAVE_UpdateLevelWithSave(StreamUnit *streamUnit);
void SAVE_SaveGame();
long SAVE_SizeOfFreeSpace();
void SAVE_RestoreGame();
void SAVE_ClearMemory(GameTracker *gameTracker);
void *SAVE_GetSavedBlock(long saveType, long extraSize);
void SAVE_RestoreGlobalSavePointer();
void SAVE_RestoreGlobalSaveTracker();
void SAVE_SaveEverythingInMemory();
void SAVE_UpdateGlobalSaveTracker();
void SAVE_SetDeadDeadBit(int uniqueID, long set);
long SAVE_IsUniqueIDDeadDead(long uniqueID);
void SAVE_DeleteBlock(SavedBasic *savedBlock);
long SAVE_SaveableInstance(Instance *instance);
SavedIntro *SAVE_UpdateSavedIntro(Instance *instance, Level *level, SavedIntro *savedIntro, evControlSaveDataData *extraData);
SavedIntroWithIntro *SAVE_UpdateSavedIntroWithIntro(Instance *instance, Level *level, SavedIntroWithIntro *savedIntro, evControlSaveDataData *extraData);
SavedLevel *SAVE_HasSavedLevel(long areaID);

extern GlobalSaveTracker *GlobalSave;
extern char monVersion[];

#endif
