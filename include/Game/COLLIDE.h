#ifndef _COLIDE_H_
#define _COLIDE_H_

#include "Game/TYPES.h"

// size: 0x8
struct _Normal {
    // offset: 0000
    short x;
    // offset: 0002
    short y;
    // offset: 0004
    short z;
    // offset: 0006
    short pad;
};

// size: 0x30
struct _CollideInfo {
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
};

// size: 0xC
struct _Triangle2D {
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
};

typedef struct _CollideInfo CollideInfo;

typedef struct _Triangle2D Triangle2D;

int COLLIDE_PointInTriangle(struct _SVector *v0, struct _SVector *v1, struct _SVector *v2, struct _SVector *point, struct _SVector *normal);
int COLLIDE_PointInTriangle2DPub(short *v0, short *v1, short *v2, short *point);
void COLLIDE_SetBSPTreeFlag(struct _CollideInfo *collideInfo, short flag);

#endif
