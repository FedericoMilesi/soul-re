#ifndef _INSTANCE_H_
#define _INSTANCE_H_

#include "Game/TYPES.h"
#include "Game/LIST.h"
#include "Game/COLLIDE.h"
#include "Game/FX.h"
#include "Game/SOUND.h"
#include "Game/EVENT.h"
#include "Game/OBTABLE.h"
#include "Game/G2/ANIMG2.h"

// size: 0x29C
struct _Instance {
    // offset: 0000 (8 bytes)
    struct NodeType node;
    // offset: 0008 (668 bytes)
    struct _Instance *next;
    // offset: 000C (668 bytes)
    struct _Instance *prev;
    // offset: 0010
    long instanceID;
    // offset: 0014
    long flags;
    // offset: 0018
    long flags2;
    // offset: 001C (76 bytes)
    struct Object *object;
    // offset: 0020
    struct Intro *intro;
    // offset: 0024
    void *data;
    // offset: 0028
    void *introData;
    // offset: 002C (668 bytes)
    struct _Instance *parent;
    // offset: 0030
    long introNum;
    // offset: 0034
    long birthStreamUnitID;
    // offset: 0038
    long currentStreamUnitID;
    // offset: 003C
    long introUniqueID;
    // offset: 0040 (32 bytes)
    struct MATRIX *matrix;
    // offset: 0044 (32 bytes)
    struct MATRIX *oldMatrix;
    // offset: 0048 (12 bytes)
    struct SoundInstance soundInstanceTbl[4];
    // offset: 0054
    unsigned long maxCheckDistance;
    // offset: 0058
    unsigned long checkMask;
    // offset: 005C (6 bytes)
    struct _Position position;
    // offset: 0062
    unsigned char lightGroup;
    // offset: 0064 (6 bytes)
    struct _Position oldPos;
    // offset: 006A
    unsigned char spectralLightGroup;
    // offset: 006C
    short currentTextureAnimFrame;
    // offset: 006E (6 bytes)
    struct _Position initialPos;
    // offset: 0074 (8 bytes)
    struct _Rotation rotation;
    // offset: 007C (8 bytes)
    struct _Rotation oldRotation;
    // offset: 0084 (8 bytes)
    struct _SVector scale;
    // offset: 008C
    long attachedID;
    // offset: 0090
    long attachedSegment;
    // offset: 0094 (32 bytes)
    struct MATRIX relativeMatrix;
    // offset: 00B4 (12 bytes)
    struct _TFace *tface;
    // offset: 00B8 (12 bytes)
    struct _TFace *oldTFace;
    // offset: 00BC
    void *tfaceLevel;
    // offset: 00C0
    void *collideInfo;
    // offset: 00C4
    long bspTree;
    // offset: 00C8
    short cachedTFace;
    // offset: 00CA
    short cachedBSPTree;
    // offset: 00CC
    void *cachedTFaceLevel;
    // offset: 00D0 (8 bytes)
    struct _Normal oldWNormal;
    // offset: 00D8 (8 bytes)
    struct _Normal wNormal;
    // offset: 00E0 (8 bytes)
    struct _SVector offset;
    // offset: 00E8
    void *dsignal;
    // offset: 00EC
    void *shadow0;
    // offset: 00F0
    void *shadow1;
    // offset: 00F4
    void *extraLight;
    // offset: 00F8 (6 bytes)
    struct _Position extraLightDir;
    // offset: 00FE
    short extraLightScale;
    // offset: 0100 (8 bytes)
    struct _HModel *hModelList;
    // offset: 0104
    short fadeValue;
    // offset: 0106
    short lightMatrix;
    // offset: 0108
    void (*processFunc)();
    // offset: 010C
    void (*collideFunc)();
    // offset: 0110
    void (*additionalCollideFunc)();
    // offset: 0114
    void *additionalDrawFunc;
    // offset: 0118
    unsigned long (*queryFunc)();
    // offset: 011C
    void (*messageFunc)();
    // offset: 0120 (6 bytes)
    struct _Position shadowPosition;
    // offset: 0126
    short currentModel;
    // offset: 0128 (12 bytes)
    struct _TFace *waterFace;
    // offset: 012C (12 bytes)
    struct _TFace *oldWaterFace;
    // offset: 0130
    struct _Terrain *waterFaceTerrain;
    // offset: 0134 (12 bytes)
    struct _PlaneConstants halvePlane;
    // offset: 0140 (8 bytes)
    struct _SVector splitPoint;
    // offset: 0148 (668 bytes)
    struct _Instance *LinkParent;
    // offset: 014C (668 bytes)
    struct _Instance *LinkChild;
    // offset: 0150 (668 bytes)
    struct _Instance *LinkSibling;
    // offset: 0154
    long ParentLinkNode;
    // offset: 0158
    void *InstanceState;
    // offset: 015C (16 bytes)
    char introName[16];
    // offset: 016C
    void *extraData;
    // offset: 0170
    short constrictAngle;
    // offset: 0172
    short petrifyValue;
    // offset: 0174
    long xVel;
    // offset: 0178
    long yVel;
    // offset: 017C
    long zVel;
    // offset: 0180
    long xAccl;
    // offset: 0184
    long yAccl;
    // offset: 0188
    long zAccl;
    // offset: 018C
    long maxXVel;
    // offset: 0190
    long maxYVel;
    // offset: 0194
    long maxZVel;
    // offset: 0198
    long currentMainState;
    // offset: 019C
    long currentSubState;
    // offset: 01A0
    long work0;
    // offset: 01A4
    long work1;
    // offset: 01A8
    long work2;
    // offset: 01AC
    long work3;
    // offset: 01B0
    long work4;
    // offset: 01B4
    long work5;
    // offset: 01B8
    long work6;
    // offset: 01BC
    long work7;
    // offset: 01C0
    long work8;
    // offset: 01C4
    long work9;
    // offset: 01C8 (180 bytes)
    struct _G2Anim_Type anim;
    // offset: 027C (4 bytes)
    enum _G2Bool_Enum(*rebuildCallback)();
    // offset: 0280
    short splineFlags;
    // offset: 0282
    short targetFrame;
    // offset: 0284
    short clipBeg;
    // offset: 0286
    short clipEnd;
    // offset: 0288 (12 bytes)
    struct EventAliasCommandStruct aliasCommand;
    // offset: 0294
    long light_color;
    // offset: 0298 (4 bytes)
    struct CVECTOR *perVertexColor;
};

// size: 0x4
struct INICommand {
    // offset: 0000
    short command;
    // offset: 0002
    short numParameters;
    // offset: 0004
    long parameter[0];
};

typedef struct _Instance Instance;

typedef struct INICommand INICommand;

#endif
