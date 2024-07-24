#ifndef _EVENT_H_
#define _EVENT_H_

#include "common.h"
#include "Game/SIGNAL.h"

// size: 0x1C
typedef struct Event {
    // offset: 0000
    short eventNumber;
    // offset: 0002
    short numInstances;
    // offset: 0004
    unsigned char numActions;
    // offset: 0005
    unsigned char processingPuppetShow;
    // offset: 0006 (10 bytes)
    short eventVariables[5];
    // offset: 0010 (2 bytes)
    struct EventBasicObject **instanceList;
    // offset: 0014 (8 bytes)
    struct ScriptPCode **conditionalList;
    // offset: 0018 (8 bytes)
    struct ScriptPCode **actionList;
} Event;

// size: 0x8
typedef struct EventPointers {
    // offset: 0000
    long numPuzzles;
    // offset: 0004 (4 bytes)
    struct Event *eventInstances[1];
} EventPointers;

// size: 0xC
typedef struct EventAliasCommandStruct {
    // offset: 0000
    struct _Instance *hostInstance;
    // offset: 0004
    short newanim;
    // offset: 0006
    short newframe;
    // offset: 0008
    short interpframes;
    // offset: 000A
    short speed;
} EventAliasCommandStruct;

// size: 0x14
typedef struct SoundObject {
    // offset: 0000
    short flags;
    // offset: 0002
    short attribute;
    // offset: 0004
    long soundNumber;
    // offset: 0008
    long value;
    // offset: 000C
    long duration;
    // offset: 0010 (4 bytes)
    // size: 0x4
    union {
        // offset: 0000 (668 bytes)
        struct _Instance *instance;
        // offset: 0000 (36 bytes)
        struct _SFXMkr *sfxMarker;
    } data;
} SoundObject;

// size: 0x24
typedef struct _SFXMkr {
    // offset: 0000
    unsigned char *soundData;
    // offset: 0004
    long uniqueID;
    // offset: 0008 (12 bytes)
    struct SoundInstance sfxTbl[4];
    // offset: 0014 (6 bytes)
    struct _Position pos;
    // offset: 001A
    short pad;
    // offset: 001C
    long livesInOnePlace;
    // offset: 0020
    long inSpectral;
} SFXMkr;

// size: 0x8
typedef struct _BVertex {
    // offset: 0000
    short x;
    // offset: 0002
    short y;
    // offset: 0004
    short z;
    // offset: 0006
    short pad;
} BVertex;

// size: 0xC
typedef struct _BFace {
    // offset: 0000
    short v0;
    // offset: 0002
    short v1;
    // offset: 0004
    short v2;
    // offset: 0006
    short pad;
    // offset: 0008 (12 bytes)
    struct TextureFT3 *texture;
} BFace;

// size: 0x18
typedef struct _BGObject {
    // offset: 0000
    short flags;
    // offset: 0002
    short numFaces;
    // offset: 0004 (8 bytes)
    struct _BVertex *vertexList;
    // offset: 0008 (12 bytes)
    struct _BFace *faceList;
    // offset: 000C
    short x;
    // offset: 000E
    short y;
    // offset: 0010
    short z;
    // offset: 0012
    short radius;
    // offset: 0014
    long numVertices;
} BGObject;

// size: 0x8
typedef struct _PlanMkr {
    // offset: 0000 (6 bytes)
    struct _Position pos;
    // offset: 0006
    short id;
} PlanMkr;

void EVENT_Init();
void EVENT_AddInstanceToInstanceList(Instance *instance);
void EVENT_RemoveInstanceFromInstanceList(Instance *instance);
void EVENT_SaveEventsFromLevel(long levelID, Level *level);
void EVENT_RemoveStreamToInstanceList(StreamUnit *stream);
void EVENT_UpdateResetSignalArrayAndWaterMovement(Level *oldLevel, Level *newLevel, long sizeOfLevel);
void EVENT_LoadEventsForLevel(long levelID, Level *level);
void EVENT_AddSignalToReset(MultiSignal *mSignal);
void EVENT_AddStreamToInstanceList(StreamUnit *stream);
void EVENT_PrintVars();

#endif
