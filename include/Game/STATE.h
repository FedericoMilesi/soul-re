#ifndef _STATE_H_
#define _STATE_H_

#include "common.h"

// size: 0x8
typedef struct __Event {
    // offset: 0000
    int ID;
    // offset: 0004
    int Data;
} Message;

// size: 0x88
typedef struct __MessageQueue {
    // offset: 0000
    int Head;
    // offset: 0004
    int Tail;
    // offset: 0008 (128 bytes)
    struct __Event Queue[16];
} MessageQueue;

// size: 0x14
typedef struct evAnimationInstanceSwitchData {
    // offset: 0000 (668 bytes)
    struct _Instance *instance;
    // offset: 0004
    int anim;
    // offset: 0008
    int frame;
    // offset: 000C
    int frames;
    // offset: 0010
    int mode;
} evAnimationInstanceSwitchData;

// size: 0x8
typedef struct evPositionData {
    // offset: 0000
    short x;
    // offset: 0002
    short y;
    // offset: 0004
    short z;
    // offset: 0006
    short pad;
} evPositionData;

// size: 0x8
typedef struct evControlSaveDataData {
    // offset: 0000
    long length;
    // offset: 0004
    void *data;
} evControlSaveDataData;

// size: 0x14
typedef struct evFXHitData {
    // offset: 0000 (8 bytes)
    struct _SVector location;
    // offset: 0008 (8 bytes)
    struct _SVector velocity;
    // offset: 0010
    short amount;
    // offset: 0012
    short type;
} evFXHitData;

// size: 0x8
typedef struct evMonsterHitObjectData {
    // offset: 0000 (668 bytes)
    struct _Instance *instance;
    // offset: 0004
    int hitType;
} evMonsterHitObjectData;

// size: 0x10
typedef struct evMonsterHitData {
    // offset: 0000 (668 bytes)
    struct _Instance *sender;
    // offset: 0004 (668 bytes)
    struct _Instance *lastHit;
    // offset: 0008
    short knockBackDistance;
    // offset: 000A
    short knockBackDuration;
    // offset: 000C
    long power;
} evMonsterHitData;

// size: 0x10
typedef struct evMonsterThrownData {
    // offset: 0000 (668 bytes)
    struct _Instance *sender;
    // offset: 0004 (8 bytes)
    struct _Rotation direction;
    // offset: 000C
    short power;
} evMonsterThrownData;

Message *DeMessageQueue(MessageQueue *In);
void EnMessageQueueData(MessageQueue *In, int ID, int Data);
uintptr_t SetMonsterHitData(Instance *Sender, Instance *lastHit, int Power, int knockBackDistance, int knockBackFrames);
int SetFXHitData(Instance *hitter, int segment, int amount, int type);
int SetObjectData(int x, int y, int PathNumber, Instance *Force, int node);
int SetObjectAbsorbData(Instance *force, unsigned short node, unsigned short steps);
void G2EmulationInstanceSetMode(Instance *instance, int CurrentSection, int Mode);
void G2EmulationInstanceSetAnimation(Instance *instance, int CurrentSection, int NewAnim, int NewFrame, int Frames);
int G2EmulationInstanceQueryFrame(Instance *instance, int CurrentSection);
int G2EmulationInstanceQueryAnimation(Instance *instance, int CurrentSection);
void G2EmulationInstancePlayAnimation(Instance *instance);
int SetPositionData(int x, int y, int z);
void *CIRC_Alloc(int size);
void InitMessageQueue(MessageQueue *In);

#endif
