#ifndef _FX_H_
#define _FX_H_

#include "common.h"
#include "Game/OBTABLE.h"
#include "Game/DRAW.h"

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
} FX_MATRIX;

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
} FX_PRIM;

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
} FXTracker;

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
} FXForceFieldEffect;

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
} PlaneConstants;

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
} FXParticle;

// size: 0x6
typedef struct _Face {
    // offset: 0000
    unsigned short v0;
    // offset: 0002
    unsigned short v1;
    // offset: 0004
    unsigned short v2;
} Face;

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
} MFace;

// size: 0x18
typedef struct _Segment {
    // offset: 0000
    long flags;
    // offset: 0004
    short firstTri;
    // offset: 0006
    short lastTri;
    // offset: 0008
    short firstVertex;
    // offset: 000A
    short lastVertex;
    // offset: 000C
    short px;
    // offset: 000E
    short py;
    // offset: 0010
    short pz;
    // offset: 0012
    short parent;
    // offset: 0014 (24 bytes)
    struct _HInfo *hInfo;
} Segment;

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
} Model;

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
} FXGeneralEffect;

// size: 0x78
typedef struct _FXBlastringEffect {
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
    struct _SVector position;
    // offset: 0018 (32 bytes)
    struct MATRIX matrix;
    // offset: 0038
    short segment;
    // offset: 003A
    short pad;
    // offset: 003C
    int radius;
    // offset: 0040
    int size1;
    // offset: 0044
    int size2;
    // offset: 0048
    int startRadius;
    // offset: 004C
    int endRadius;
    // offset: 0050
    int colorchange_radius;
    // offset: 0054
    int vel;
    // offset: 0058
    int accl;
    // offset: 005C
    int height1;
    // offset: 0060
    int height2;
    // offset: 0064
    int height3;
    // offset: 0068
    char predator_offset;
    // offset: 0069
    char predator_offset_orig;
    // offset: 006A
    char stay_in_place;
    // offset: 006B
    char sortInWorld;
    // offset: 006C
    long color;
    // offset: 0070
    long startColor;
    // offset: 0074
    long endColor;
}FXBlastringEffect;

// size: 0x2C
typedef struct _FXRibbon {
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
    // offset: 0010
    short numberVerts;
    // offset: 0012
    short endIndex;
    // offset: 0014 (8 bytes)
    struct SVECTOR *vertexPool;
    // offset: 0018
    short startSegment;
    // offset: 001A
    short endSegment;
    // offset: 001C
    long startColor;
    // offset: 0020
    long endColor;
    // offset: 0024
    short colorStepValue;
    // offset: 0026
    short faceLifeTime;
    // offset: 0028
    short startFadeValue;
    // offset: 002A
    short fadeStep;
} FXRibbon;

// size: 0x18
typedef struct _FXLightBeam {
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
    // offset: 0010
    short startSeg;
    // offset: 0012
    short endSeg;
    // offset: 0014
    long color;
} FXLightBeam;

// size: 0x1C
typedef struct GenericFXObject {
    // offset: 0000 (48 bytes)
    struct _GenericParticleParams *ParticleList;
    // offset: 0004 (20 bytes)
    struct _GenericRibbonParams *RibbonList;
    // offset: 0008 (24 bytes)
    struct _GenericGlowParams *GlowList;
    // offset: 000C (40 bytes)
    struct _GenericLightningParams *LightningList;
    // offset: 0010 (48 bytes)
    struct _GenericBlastringParams *BlastList;
    // offset: 0014 (12 bytes)
    struct _GenericFlashParams *FlashList;
    // offset: 0018
    long *ColorList;
} GenericFXObject;

// size: 0x2C
typedef struct _FXGlowEffect {
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
    // offset: 0010
    unsigned long diffTime;
    // offset: 0014
    long *colorArray;
    // offset: 0018
    long currentColor;
    // offset: 001C
    short numColors;
    // offset: 001E
    short colorBlendCycle;
    // offset: 0020
    short width;
    // offset: 0022
    short height;
    // offset: 0024
    unsigned char numSegments;
    // offset: 0025
    unsigned char SegmentInc;
    // offset: 0026
    short segment;
    // offset: 0028
    short fadein_time;
    // offset: 002A
    short fadeout_time;
} FXGlowEffect;

// size: 0x2C
typedef struct _FXHalvePlane {
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
    // offset: 0010
    long diffTime;
    // offset: 0014 (12 bytes)
    struct _PlaneConstants ringPlane;
    // offset: 0020
    long currentColor;
    // offset: 0024
    long *colorArray;
    // offset: 0028
    short numColors;
    // offset: 002A
    short colorBlendLife;
} FXHalvePlane;

void FX_ContinueParticle(FXParticle *currentParticle, FXTracker *fxTracker);
void FX_SetReaverInstance(Instance *instance);
void FX_EndInstanceEffects(Instance *instance);
FXBlastringEffect *FX_DoBlastRing(Instance *instance, SVector *position, MATRIX *mat, int segment, int radius, int endRadius, int colorChangeRadius, int size1, int size2, int vel, int accl, int height1, int height2, int height3, long startColor, long endColor, int pred_offset, int lifeTime, int sortInWorld);
void FX_ReaverBladeInit();
void FX_DoInstancePowerRing(Instance *instance, long atuTime, long *color, long numColors, int follow_halveplane);
FX_PRIM *FX_Dot(SVector *location, SVector *vel, SVector *accel, int scale_speed, long color, long size, int lifetime, int texture_num);
void FX_StartInstanceEffect(Instance *instance, ObjectEffect *effect, int InitFlag);
void FX_SoulReaverWinding(Instance *instance, PrimPool *primPool, unsigned long **ot, MATRIX *wcTransform);
void FX_SoulReaverBlade(Instance *instance, unsigned long **drawot);
TextureMT3 *FX_GetTextureObject(Object *object, int modelnum, int texnum);
void FX_InsertGeneralEffect(void *ptr);
FXParticle *FX_GetParticle(Instance *instance, short startSegment);
void FX_RelocateFXPointers(Object *oldObject, Object *newObject, long sizeOfObject);
void FX_Relocate(SVector *offset);
void FX_UpdateInstanceWaterSplit(Instance *instance);
void FX_Lightning(MATRIX *wcTransform, unsigned long **ot, MATRIX *mat, short deg, SVector *start, SVector *end, int width, int small_width, int segs, int sine_size, int variation, long color, long glow_color);
FXGlowEffect *FX_DoInstanceTwoSegmentGlow(Instance *instance, long segment, long segmentEnd, long *color, long numColors, long atuColorCycleRate, long height);
void FX_MakeHitFX(SVector *position);
void FX_MakeGlyphIcon(Position *position, Object *glyphObject, int size, int glyphnum, int enabled);
void FX_DrawScreenPoly(int transtype, unsigned long color, int zdepth);
void FX_CalcSpiral(int degchange);
void FX_GetSpiralPoint(int radius, int deg, int *x, int *y);
void FX_DeleteGeneralEffect(FXGeneralEffect *effect);
void FX_StandardFXPrimProcess(FX_PRIM *fxPrim, FXTracker *fxTracker);
long FX_GetHealthColor(int currentHealth);

#endif
