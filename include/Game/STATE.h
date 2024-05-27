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

Message *DeMessageQueue(MessageQueue *In);
void EnMessageQueueData(MessageQueue *In, int ID, int Data);
int SetMonsterHitData(Instance *Sender, Instance *lastHit, int Power, int knockBackDistance, int knockBackFrames);
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

#endif
