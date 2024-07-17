#ifndef _COLLIDE_H_
#define _COLLIDE_H_

#include "common.h"
#include "Game/FX.h"
#include "Game/STREAM.h"
#include "Game/SIGNAL.h"

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

// size: 0xC
typedef struct _HFace {
    // offset: 0000
    short v0;
    // offset: 0002
    short v1;
    // offset: 0004
    short v2;
    // offset: 0006
    unsigned char attr;
    // offset: 0007
    char pad;
    // offset: 0008
    unsigned short normal;
    // offset: 000A
    unsigned short n0;
} HFace;

// size: 0x18
typedef struct _HInfo {
    // offset: 0000
    long numHFaces;
    // offset: 0004 (12 bytes)
    struct _HFace *hfaceList;
    // offset: 0008
    long numHSpheres;
    // offset: 000C (20 bytes)
    struct _HSphere *hsphereList;
    // offset: 0010
    long numHBoxes;
    // offset: 0014 (28 bytes)
    struct _HBox *hboxList;
} HInfo;

// size: 0x8
typedef struct _Sphere_noSq {
    // offset: 0000 (6 bytes)
    struct _Position position;
    // offset: 0006
    unsigned short radius;
} Sphere_noSq;

// size: 0x2C
typedef struct _BSPNode {
    // offset: 0000 (8 bytes)
    struct _Sphere_noSq sphere;
    // offset: 0008
    short a;
    // offset: 000A
    short b;
    // offset: 000C
    short c;
    // offset: 000E
    short flags;
    // offset: 0010
    long d;
    // offset: 0014
    void *front;
    // offset: 0018
    void *back;
    // offset: 001C (8 bytes)
    struct _Sphere_noSq spectralSphere;
    // offset: 0024
    short front_spectral_error;
    // offset: 0026
    short back_spectral_error;
    // offset: 0028
    short front_material_error;
    // offset: 002A
    short back_material_error;
} BSPNode;

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

// size: 0x18
typedef struct evCollideInstanceStatsData {
    // offset: 0000 (668 bytes)
    struct _Instance *instance;
    // offset: 0004
    unsigned long distance;
    // offset: 0008 (8 bytes)
    struct _SVector relativePosition;
    // offset: 0010
    long xyDistance;
    // offset: 0014
    long zDelta;
} evCollideInstanceStatsData;

// size: 0x10
typedef struct evMonsterHitTerrainData {
    // offset: 0000 (12 bytes)
    struct _TFace *tface;
    // offset: 0004 (8 bytes)
    struct _Normal normal;
    // offset: 000C
    short faceFlags;
    // offset: 000E
    short bspFlags;
} evMonsterHitTerrainData;

// size: 0x1C
typedef struct SCollideInfo {
    // offset: 0000 (12 bytes)
    struct _Sphere *sphere;
    // offset: 0004 (8 bytes)
    struct SVECTOR *oldPos;
    // offset: 0008
    void (*collideFunc)();
    // offset: 000C
    long id;
    // offset: 0010
    long segment;
    // offset: 0014 (668 bytes)
    struct _Instance *instance;
    // offset: 0018
    void *prim;
} SCollideInfo;

// size: 0x4C
typedef struct PandTFScratch {
    // offset: 0000 (32 bytes)
    struct MATRIX posMatrix;
    // offset: 0020 (8 bytes)
    struct _SVector planePoint;
    // offset: 0028 (8 bytes)
    struct _SVector newPos;
    // offset: 0030 (8 bytes)
    struct _SVector oldPos;
    // offset: 0038 (8 bytes)
    struct _SVector normal;
    // offset: 0040 (12 bytes)
    struct _Vector dpv;
} PandTFScratch;

// size: 0xC
typedef struct _HVertex {
    // offset: 0000
    short x;
    // offset: 0002
    short y;
    // offset: 0004
    short z;
    // offset: 0006
    short normal;
    // offset: 0008
    long pad;
} HVertex;

typedef struct _HFaceInfo {
    // offset: 0000
    long flags;
    // offset: 0004
    long attr;
    // offset: 0008 (12 bytes)
    struct _HFace *hface;
    // offset: 000C (8 bytes)
    struct _SVector normal;
    // offset: 0014 (12 bytes)
    struct _HVertex *vertex0;
    // offset: 0018 (12 bytes)
    struct _HVertex *vertex1;
    // offset: 001C (12 bytes)
    struct _HVertex *vertex2;
} HFaceInfo;

// size: 0x8
typedef struct _HNormal {
    // offset: 0000
    short x;
    // offset: 0002
    short y;
    // offset: 0004
    short z;
    // offset: 0006
    short pad;
} HNormal;

// size: 0xD4
typedef struct SandTScratch {
    // offset: 0000 (32 bytes)
    struct MATRIX posMatrix;
    // offset: 0020 (12 bytes)
    struct _Vector dpv;
    // offset: 002C (8 bytes)
    struct _HNormal *normalList;
    // offset: 0030 (48 bytes)
    struct _CollideInfo collideInfo;
    // offset: 0060 (32 bytes)
    struct _HFaceInfo hfaceInfo;
    // offset: 0080 (8 bytes)
    struct _SVector midPoint;
    // offset: 0088 (8 bytes)
    struct _SVector spherePos;
    // offset: 0090
    void (*collideFunc)();
    // offset: 0094 (668 bytes)
    struct _Instance *instance;
    // offset: 0098
    long edge;
    // offset: 009C
    long in_spectral;
    // offset: 00A0 (8 bytes)
    struct _SVector oldPos;
    // offset: 00A8
    void *prim;
    // offset: 00AC (8 bytes)
    struct _SVector normal;
    // offset: 00B4 (12 bytes)
    struct _Sphere sphere;
    // offset: 00C0
    short result;
    // offset: 00C2
    short i;
    // offset: 00C4
    long collide_ignoreAttr;
    // offset: 00C8
    long collide_acceptAttr;
    // offset: 00CC
    long midRadius;
    // offset: 00D0 (12 bytes)
    struct _TVertex *vertexList;
} SandTScratch;

// size: 0xC
typedef struct _BoundingBox {
    // offset: 0000
    short minX;
    // offset: 0002
    short minY;
    // offset: 0004
    short minZ;
    // offset: 0006
    short maxX;
    // offset: 0008
    short maxY;
    // offset: 000A
    short maxZ;
} BoundingBox;

TFace *COLLIDE_PointAndTerrainFunc(Terrain *terrain, PCollideInfo *pCollideInfo, int Flags, short *Backface_Flag, long ignoreAttr, long acceptAttr, LCollideInfo *lcolinfo);
int COLLIDE_PointInTriangle(SVector *v0, SVector *v1, SVector *v2, SVector *point, SVector *normal);
int COLLIDE_PointInTriangle2DPub(short *v0, short *v1, short *v2, short *point);
void COLLIDE_SetBSPTreeFlag(CollideInfo *collideInfo, short flag);
void COLLIDE_SegmentCollisionOff(Instance *instance, int segment);
void COLLIDE_SegmentCollisionOn(Instance *instance, int segment);
void COLLIDE_UpdateAllTransforms(Instance *instance, SVECTOR *offset);
void COLLIDE_PointAndWorld(PCollideInfo *pcollideInfo, Level *level);
long COLLIDE_GetNormal(short nNum, short *nrmlArray, SVector *nrml);
void COLLIDE_Instance1SpheresToInstance2(Instance *instance1, Instance *instance2, long sphereToSphere);
void COLLIDE_MoveAllTransforms(Instance *instance, Position *offset);
long COLLIDE_FindCollisionFaceNormal(CollideInfo *collideInfo, Normal *normal);
int COLLIDE_PointAndHFace(SVector *newPos, SVector *oldPos, HFace *hface, Model *model, SVector *hfNormal);
int COLLIDE_PointAndTfaceFunc(Terrain *terrain, BSPTree *bsp, SVector *orgNewPos, SVector *orgOldPos, TFace *tface, long ignoreAttr, long flags);
long COLLIDE_SAndT(SCollideInfo *scollideInfo, Level *level);
long COLLIDE_LineWithSignals(SVector *startPoint, SVector *endPoint, MultiSignal **signalList, long maxSignals, Level *level);
void COLLIDE_MakeNormal(Terrain *terrain, TFace *tface, SVector *normal);
long COLLIDE_SphereAndHFace(Sphere *sphere, Position *oldPos, HFaceInfo *hfaceInfo, SVector *intersect, long *edge);
void COLLIDE_PointAndInstanceTrivialReject(PCollideInfo *pcollideInfo, Instance *instance);

#endif
