#ifndef _FX_H_
#define _FX_H_

#include "Game/TYPES.h"
#include "Game/LIST.h"
#include "Game/MATH3D.h"

// size: 0x10
typedef struct TextureMT3 {
    // offset: 0000
    unsigned char u0;
    // offset: 0001
    unsigned char v0;
    // offset: 0002
    unsigned short clut;
    // offset: 0004
    unsigned char u1;
    // offset: 0005
    unsigned char v1;
    // offset: 0006
    unsigned short tpage;
    // offset: 0008
    unsigned char u2;
    // offset: 0009
    unsigned char v2;
    // offset: 000A
    char pad1;
    // offset: 000B
    char sortPush;
    // offset: 000C
    long color;
} TextureMT3;

// size: 0x2C
typedef struct _FX_MATRIX {
    // offset: 0000 (8 bytes)
    struct NodeType node;
    // offset: 0008
    long flags;
    // offset: 000C (32 bytes)
    struct MATRIX lwTransform;
} _FX_MATRIX;

// size: 0x68
typedef struct _FX_PRIM {
    // offset: 0000 (8 bytes)
    struct NodeType node;
    // offset: 0008 (16 bytes)
    struct TextureMT3 *texture;
    // offset: 000C
    long flags;
    // offset: 0010
    short timeToLive;
    // offset: 0012
    short curFrame;
    // offset: 0014
    void *process;
    // offset: 0018 (44 bytes)
    struct _FX_MATRIX *matrix;
    // offset: 001C
    long color;
    // offset: 0020
    long startColor;
    // offset: 0024
    long endColor;
    // offset: 0028
    short colorFadeValue;
    // offset: 002A
    short colorFadeStep;
    // offset: 002C (6 bytes)
    struct _Position position;
    // offset: 0032
    short fadeStep;
    // offset: 0034 (8 bytes)
    short fadeValue[4];
    // offset: 003C (6 bytes)
    struct _Position v0;
    // offset: 0042
    short work0;
    // offset: 0044 (6 bytes)
    struct _Position v1;
    // offset: 004A
    short work1;
    // offset: 004C (6 bytes)
    struct _Position v2;
    // offset: 0052
    short work2;
    // offset: 0054 (6 bytes)
    struct _Position v3;
    // offset: 005A
    short work3;
    // offset: 005C (12 bytes)
    // size: 0xC
    union {
        // offset: 0000 (8 bytes)
        // size: 0x8
        struct {
            // offset: 0000 (668 bytes)
            struct _Instance *parent;
            // offset: 0004
            long segment;
        } flame;
        // offset: 0000 (12 bytes)
        // size: 0xC
        struct {
            // offset: 0000
            short xVel;
            // offset: 0002
            short yVel;
            // offset: 0004
            short zVel;
            // offset: 0006
            short xAccl;
            // offset: 0008
            short yAccl;
            // offset: 000A
            short zAccl;
        } phys;
    } duo;
} _FX_PRIM;

// size: 0x6DA8
typedef struct _FXTracker {
    // offset: 0000 (1408 bytes)
    struct _FX_MATRIX matrixPool[32];
    // offset: 0580 (8 bytes)
    struct NodeType usedMatrixList;
    // offset: 0588 (8 bytes)
    struct NodeType freeMatrixList;
    // offset: 0590 (26624 bytes)
    struct _FX_PRIM primPool[256];
    // offset: 6D90 (8 bytes)
    struct NodeType usedPrimList;
    // offset: 6D98 (8 bytes)
    struct NodeType usedPrimListSprite;
    // offset: 6DA0 (8 bytes)
    struct NodeType freePrimList;
} _FXTracker;

// size: 0x2C
typedef struct _FXForceFieldEffect {
    // offset: 0000
    void *next;
    // offset: 0004
    void *continue_process;
    // offset: 0008 (668 bytes)
    struct _Instance *instance;
    // offset: 000C
    unsigned char effectType;
    // offset: 000D
    unsigned char type;
    // offset: 000E
    short lifeTime;
    // offset: 0010 (8 bytes)
    struct _SVector offset;
    // offset: 0018
    short size;
    // offset: 001A
    short size_diff;
    // offset: 001C
    short size_change;
    // offset: 001E
    short deg;
    // offset: 0020
    short deg_change;
    // offset: 0022
    short start_fade;
    // offset: 0024
    short end_fade;
    // offset: 0028
    long color;
} _FXForceFieldEffect;

// size: 0xC
typedef struct _PlaneConstants {
    // offset: 0000
    short a;
    // offset: 0002
    short b;
    // offset: 0004
    short c;
    // offset: 0006
    short flags;
    // offset: 0008
    long d;
} _PlaneConstants;

// size: 0x4C
typedef struct _FXParticle {
    // offset: 0000
    void *next;
    // offset: 0004
    void *continue_process;
    // offset: 0008 (668 bytes)
    struct _Instance *instance;
    // offset: 000C
    unsigned char effectType;
    // offset: 000D
    unsigned char type;
    // offset: 000E
    short lifeTime;
    // offset: 0010 (16 bytes)
    struct TextureMT3 *texture;
    // offset: 0014
    void *fxprim_modify_process;
    // offset: 0018
    void *fxprim_process;
    // offset: 001C
    short size;
    // offset: 001E
    short primLifeTime;
    // offset: 0020
    short birthRadius;
    // offset: 0022
    short scaleSpeed;
    // offset: 0024 (6 bytes)
    struct _Position direction;
    // offset: 002A
    unsigned short flag_bits;
    // offset: 002C (6 bytes)
    struct _Position acceleration;
    // offset: 0032
    short startScale;
    // offset: 0034 (6 bytes)
    struct _Position offset;
    // offset: 003A
    char startSegment;
    // offset: 003B
    char z_undulate;
    // offset: 003C
    long startColor;
    // offset: 0040
    long endColor;
    // offset: 0044
    short colorStepValue;
    // offset: 0046
    char numberBirthParticles;
    // offset: 0047
    char endSegment;
    // offset: 0048
    short startFadeValue;
    // offset: 004A
    short fadeStep;
} _FXParticle;

// size: 0x6
typedef struct _Face {
    // offset: 0000
    unsigned short v0;
    // offset: 0002
    unsigned short v1;
    // offset: 0004
    unsigned short v2;
} _Face;

// size: 0xC
typedef struct _MFace {
    // offset: 0000 (6 bytes)
    struct _Face face;
    // offset: 0006
    unsigned char normal;
    // offset: 0007
    unsigned char flags;
    // offset: 0008
    long color;
} _MFace;

// size: 0x38
typedef struct _Model {
    // offset: 0000
    long numVertices;
    // offset: 0004 (8 bytes)
    struct _MVertex *vertexList;
    // offset: 0008
    long numNormals;
    // offset: 000C (6 bytes)
    struct _SVectorNoPad *normalList;
    // offset: 0010
    long numFaces;
    // offset: 0014 (12 bytes)
    struct _MFace *faceList;
    // offset: 0018
    long numSegments;
    // offset: 001C (24 bytes)
    struct _Segment *segmentList;
    // offset: 0020 (16 bytes)
    struct AniTex *aniTextures;
    // offset: 0024
    short maxRad;
    // offset: 0026
    short pad;
    // offset: 0028
    long maxRadSq;
    // offset: 002C
    struct MultiSpline *multiSpline;
    // offset: 0030 (16 bytes)
    struct TextureMT3 *startTextures;
    // offset: 0034 (16 bytes)
    struct TextureMT3 *endTextures;
} _Model;

// size: 0x10
typedef struct _FXGeneralEffect {
    // offset: 0000
    void *next;
    // offset: 0004
    void *continue_process;
    // offset: 0008 (668 bytes)
    struct _Instance *instance;
    // offset: 000C
    unsigned char effectType;
    // offset: 000D
    unsigned char type;
    // offset: 000E
    short lifeTime;
} _FXGeneralEffect;

typedef struct _PlaneConstants PlaneConstants;

typedef struct _MFace MFace;

typedef struct _Model Model;

typedef struct _FX_PRIM FX_PRIM;

typedef struct _FX_MATRIX FX_MATRIX;

typedef struct _FXTracker FXTracker;

typedef struct _FXGeneralEffect FXGeneralEffect;

typedef struct _FXForceFieldEffect FXForceFieldEffect;

#endif
