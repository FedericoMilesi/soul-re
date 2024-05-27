#ifndef _EVENT_H_
#define _EVENT_H_

#include "common.h"

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

void EVENT_Init();
void EVENT_AddInstanceToInstanceList(Instance *instance);
void EVENT_RemoveInstanceFromInstanceList(Instance *instance);

#endif
