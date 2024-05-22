#ifndef _COLLIDE_H_
#define _COLLIDE_H_

#include "Game/FX.h"
#include "Game/STREAM.h"

// size: 0xC
typedef struct _TFace {
    // offset: 0000 (6 bytes)
    struct _Face face;
    // offset: 0006
    unsigned char attr;
    // offset: 0007
    char sortPush;
    // offset: 0008
    unsigned short normal;
    // offset: 000A
    unsigned short textoff;
} TFace;

// size: 0x8
typedef struct _Normal {
    // offset: 0000
    short x;
    // offset: 0002
    short y;
    // offset: 0004
    short z;
    // offset: 0006
    short pad;
} Normal;

// size: 0x30
typedef struct _CollideInfo {
    // offset: 0000
    void *level;
    // offset: 0004
    char flags;
    // offset: 0005
    char segment;
    // offset: 0006
    char type0;
    // offset: 0007
    char type1;
    // offset: 0008
    void *prim0;
    // offset: 000C
    void *prim1;
    // offset: 0010
    void *inst0;
    // offset: 0014
    void *inst1;
    // offset: 0018 (8 bytes)
    struct SVECTOR point0;
    // offset: 0020 (8 bytes)
    struct SVECTOR point1;
    // offset: 0028 (6 bytes)
    struct _Position offset;
    // offset: 002E
    short bspID;
} CollideInfo;

// size: 0xC
typedef struct _Triangle2D {
    // offset: 0000
    short x0;
    // offset: 0002
    short y0;
    // offset: 0004
    short x1;
    // offset: 0006
    short y1;
    // offset: 0008
    short x2;
    // offset: 000A
    short y2;
} Triangle2D;

// size: 0x1C
typedef struct _HBox {
    // offset: 0000
    short flags;
    // offset: 0002
    unsigned char id;
    // offset: 0003
    unsigned char rank;
    // offset: 0004
    short minX;
    // offset: 0006
    short minY;
    // offset: 0008
    short minZ;
    // offset: 000A
    short maxX;
    // offset: 000C
    short maxY;
    // offset: 000E
    short maxZ;
    // offset: 0010
    short refMinX;
    // offset: 0012
    short refMinY;
    // offset: 0014
    short refMinZ;
    // offset: 0016
    short refMaxX;
    // offset: 0018
    short refMaxY;
    // offset: 001A
    short refMaxZ;
} HBox;

// size: 0x2C
typedef struct _PCollideInfo {
    // offset: 0000
    short type;
    // offset: 0002
    short segment;
    // offset: 0004
    void *prim;
    // offset: 0008
    struct _Instance *inst;
    // offset: 000C (8 bytes)
    struct SVECTOR wNormal;
    // offset: 0014 (8 bytes)
    struct SVECTOR *newPoint;
    // offset: 0018 (8 bytes)
    struct SVECTOR *oldPoint;
    // offset: 001C (8 bytes)
    struct SVECTOR cldPoint;
    // offset: 0024
    long collideType;
    // offset: 0028
    struct _Instance *instance;
} PCollideInfo;

// size: 0x14
typedef struct _HSphere {
    // offset: 0000
    long attr;
    // offset: 0004
    unsigned char id;
    // offset: 0005
    unsigned char rank;
    // offset: 0006
    short pad;
    // offset: 0008 (6 bytes)
    struct _Position position;
    // offset: 000E
    unsigned short radius;
    // offset: 0010
    unsigned long radiusSquared;
} HSphere;

// size: 0x24
typedef struct BSPTree {
    // offset: 0000 (44 bytes)
    struct _BSPNode *bspRoot;
    // offset: 0004 (48 bytes)
    struct _BSPLeaf *startLeaves;
    // offset: 0008 (48 bytes)
    struct _BSPLeaf *endLeaves;
    // offset: 000C (6 bytes)
    struct _Position globalOffset;
    // offset: 0012
    short flags;
    // offset: 0014 (6 bytes)
    struct _Position localOffset;
    // offset: 001A
    short ID;
    // offset: 001C
    long splineID;
    // offset: 0020 (668 bytes)
    struct _Instance *instanceSpline;
} BSPTree;

// size: 0x8
typedef struct _HPrim {
    // offset: 0000
    unsigned char hpFlags;
    // offset: 0001
    unsigned char withFlags;
    // offset: 0002
    unsigned char type;
    // offset: 0003
    unsigned char segment;
    // offset: 0004 (4 bytes)
    // size: 0x4
    union {
        // offset: 0000 (20 bytes)
        struct _HSphere *hsphere;
        // offset: 0000 (28 bytes)
        struct _HBox *hbox;
        // offset: 0000 (12 bytes)
        struct _HFace *hface;
    } data;
} HPrim;

// size: 0x8
typedef struct _HModel {
    // offset: 0000 (8 bytes)
    struct _HPrim *hPrimList;
    // offset: 0004
    long numHPrims;
} HModel;

// size: 0xC
typedef struct _LCollideInfo {
    // offset: 0000 (12 bytes)
    struct _TFace *tface;
    // offset: 0004 (84 bytes)
    struct _Terrain *terrain;
    // offset: 0008
    int curTree;
} LCollideInfo;

// size: 0xC
typedef struct _Sphere {
    // offset: 0000 (6 bytes)
    struct _Position position;
    // offset: 0006
    unsigned short radius;
    // offset: 0008
    unsigned long radiusSquared;
} Sphere;

TFace *COLLIDE_PointAndTerrainFunc(Terrain *terrain, PCollideInfo *pCollideInfo, int Flags, short *Backface_Flag, long ignoreAttr, long acceptAttr, LCollideInfo *lcolinfo);
int COLLIDE_PointInTriangle(SVector *v0, SVector *v1, SVector *v2, SVector *point, SVector *normal);
int COLLIDE_PointInTriangle2DPub(short *v0, short *v1, short *v2, short *point);
void COLLIDE_SetBSPTreeFlag(CollideInfo *collideInfo, short flag);

#endif
