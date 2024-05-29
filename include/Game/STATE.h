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

// size: 0xC
typedef struct evMonsterAlarmData {
    // offset: 0000 (668 bytes)
    struct _Instance *sender;
    // offset: 0004 (6 bytes)
    struct _Position position;
    // offset: 000A
    short type;
} evMonsterAlarmData;

// size: 0xC
typedef struct evMonsterSoulSuckData {
    // offset: 0000 (668 bytes)
    struct _Instance *sender;
    // offset: 0004 (6 bytes)
    struct _Position Destination;
} evMonsterSoulSuckData;

// size: 0x14
typedef struct evMonsterImpaleData {
    // offset: 0000 (668 bytes)
    struct _Instance *weapon;
    // offset: 0004 (8 bytes)
    struct _Rotation direction;
    // offset: 000C (6 bytes)
    struct _Position position;
    // offset: 0012
    short distance;
} evMonsterImpaleData;

// size: 0x10
typedef struct evObjectData {
    // offset: 0000
    short x;
    // offset: 0002
    short y;
    // offset: 0004
    short PathNumber;
    // offset: 0006
    short LinkNode;
    // offset: 0008 (668 bytes)
    struct _Instance *Force;
    // offset: 000C
    int rc;
} evObjectData;

// size: 0x18
typedef struct evPhysicsLinkedMoveData {
    // offset: 0000 (668 bytes)
    struct _Instance *instance;
    // offset: 0004
    int segment;
    // offset: 0008 (8 bytes)
    struct _SVector posDelta;
    // offset: 0010 (8 bytes)
    struct _SVector rotDelta;
} evPhysicsLinkedMoveData;

// size: 0xC
typedef struct evPhysicsGravityData {
    // offset: 0000
    short UpperOffset;
    // offset: 0002
    short LowerOffset;
    // offset: 0004
    short x;
    // offset: 0006
    short y;
    // offset: 0008
    short z;
    // offset: 000A
    short slipSlope;
} evPhysicsGravityData;

// size: 0x24
typedef struct evPhysicsEdgeData {
    // offset: 0000
    short UpperOffset;
    // offset: 0002
    short ForwardOffset;
    // offset: 0004
    short AboveOffset;
    // offset: 0006
    short XDistance;
    // offset: 0008
    short YDistance;
    // offset: 000A
    short ZDistance;
    // offset: 000C (8 bytes)
    struct _SVector *Normal1;
    // offset: 0010 (8 bytes)
    struct _SVector *Normal2;
    // offset: 0014 (8 bytes)
    struct _SVector *Delta;
    // offset: 0018 (668 bytes)
    struct _Instance *instance;
    // offset: 001C
    int zRot;
    // offset: 0020
    int rc;
} evPhysicsEdgeData;

// size: 0x18
typedef struct evPhysicsSwimData {
    // offset: 0000
    short CheckDepth;
    // offset: 0002
    short SwimDepth;
    // offset: 0004
    short WadeDepth;
    // offset: 0006
    short TreadDepth;
    // offset: 0008 (8 bytes)
    struct _SVector *iVelocity;
    // offset: 000C
    short Depth;
    // offset: 000E
    short WaterDepth;
    // offset: 0010
    short rc;
    // offset: 0012
    short pad;
    // offset: 0014
    int WaterLevel;
} evPhysicsSwimData;

// size: 0xC
typedef struct evPhysicsDropOffData {
    // offset: 0000
    short xOffset;
    // offset: 0002
    short yOffset;
    // offset: 0004
    short DropOffset;
    // offset: 0006
    short slipSlope;
    // offset: 0008
    int UpperOffset;
} evPhysicsDropOffData;

// size: 0x28
typedef struct evPhysicsSlideData {
    // offset: 0000 (8 bytes)
    struct _SVector ForwardVector;
    // offset: 0008 (8 bytes)
    struct _SVector ForwardNormal;
    // offset: 0010 (8 bytes)
    struct _SVector DropNormal;
    // offset: 0018
    short Segment;
    // offset: 001A
    short DropOffset;
    // offset: 001C
    short UpperOffset;
    // offset: 001E
    short Height;
    // offset: 0020 (668 bytes)
    struct _Instance *UpperInstance;
    // offset: 0024
    int Dot;
} evPhysicsSlideData;

// size: 0x2C
typedef struct evPhysicsWallCrawlData {
    // offset: 0000
    short Segment;
    // offset: 0002
    short Length;
    // offset: 0004
    short ForwardOffset;
    // offset: 0006
    short NormalDistance;
    // offset: 0008 (8 bytes)
    struct _SVector DropNormal;
    // offset: 0010 (8 bytes)
    struct _SVector ForwardNormal;
    // offset: 0018 (6 bytes)
    struct _Position NewPosition;
    // offset: 001E (8 bytes)
    struct _Rotation DropRotation;
    // offset: 0026
    short ForwardXRotation;
    // offset: 0028
    int rc;
} evPhysicsWallCrawlData;

// size: 0x14
typedef struct evPhysicsDropHeightData {
    // offset: 0000 (6 bytes)
    struct _Position origin;
    // offset: 0006
    short mode;
    // offset: 0008
    short DropOffset;
    // offset: 000A
    short result;
    // offset: 000C (36 bytes)
    struct BSPTree *bsp;
    // offset: 0010 (12 bytes)
    struct _TFace *tface;
} evPhysicsDropHeightData;

Message *DeMessageQueue(MessageQueue *In);
void EnMessageQueueData(MessageQueue *In, int ID, int Data);
uintptr_t SetMonsterHitData(Instance *Sender, Instance *lastHit, int Power, int knockBackDistance, int knockBackFrames);
int SetFXHitData(Instance *hitter, int segment, int amount, int type);
uintptr_t SetObjectData(int x, int y, int PathNumber, Instance *Force, int node);
int SetObjectAbsorbData(Instance *force, unsigned short node, unsigned short steps);
void G2EmulationInstanceSetMode(Instance *instance, int CurrentSection, int Mode);
void G2EmulationInstanceSetAnimation(Instance *instance, int CurrentSection, int NewAnim, int NewFrame, int Frames);
int G2EmulationInstanceQueryFrame(Instance *instance, int CurrentSection);
int G2EmulationInstanceQueryAnimation(Instance *instance, int CurrentSection);
void G2EmulationInstancePlayAnimation(Instance *instance);
uintptr_t SetPositionData(int x, int y, int z);
void *CIRC_Alloc(int size);
void InitMessageQueue(MessageQueue *In);

#endif
