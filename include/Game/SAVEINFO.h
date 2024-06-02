#ifndef _SAVEINFO_H_
#define _SAVEINFO_H_

#include "common.h"
#include "Game/MONSTER/MONAPI.h"

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

// size: 0x10
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
} MonsterSaveInfo;

void SAVE_DebugSaveGame();
void SAVE_LoadSaveGame();
void SAVE_LoadSaveGame();
void SAVE_DeleteInstance(Instance *instance);
void SAVE_MarkDeadDead(Instance *instance);
long SAVE_IsIntroDeadDead(Intro *intro);
long SAVE_HasSavedIntro(Intro *intro, long currentStreamID);
void SAVE_DoInstanceDeadDead(Instance *instance);

extern GlobalSaveTracker *GlobalSave;
extern char monVersion[];

#endif
