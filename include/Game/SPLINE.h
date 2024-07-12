#ifndef _SPLINE_H_
#define _SPLINE_H_

#include "Game/G2/QUATG2.h"

// size: 0x6
typedef struct vecS {
    // offset: 0000
    short x;
    // offset: 0002
    short y;
    // offset: 0004
    short z;
} vecS;

// size: 0xC
typedef struct vecL {
    // offset: 0000
    long x;
    // offset: 0004
    long y;
    // offset: 0008
    long z;
} vecL;

// size: 0xA
typedef struct SplineRotKey {
    // offset: 0000
    short count;
    // offset: 0002 (8 bytes)
    struct _G2Quat_Type q;
} SplineRotKey;

// size: 0x8
typedef struct RSpline {
    // offset: 0000 (10 bytes)
    struct SplineRotKey *key;
    // offset: 0004
    short numkeys;
    // offset: 0006
    unsigned char type;
    // offset: 0007
    unsigned char flags;
} RSpline;

// size: 0x20
typedef struct SplineKey {
    // offset: 0000
    short count;
    // offset: 0002 (6 bytes)
    struct vecS point;
    // offset: 0008 (12 bytes)
    struct vecL dd;
    // offset: 0014 (12 bytes)
    struct vecL ds;
} SplineKey;

// size: 0x8
typedef struct Spline {
    // offset: 0000 (32 bytes)
    struct SplineKey *key;
    // offset: 0004
    short numkeys;
    // offset: 0006
    unsigned char type;
    // offset: 0007
    unsigned char flags;
} Spline;

// size: 0x8
typedef struct SplineDef {
    // offset: 0000
    short currkey;
    // offset: 0002
    unsigned short denomFlag;
    // offset: 0004
    long fracCurr;
} SplineDef;

// size: 0x50
typedef struct MultiSpline {
    // offset: 0000 (8 bytes)
    struct Spline *positional;
    // offset: 0004 (8 bytes)
    struct RSpline *rotational;
    // offset: 0008 (8 bytes)
    struct Spline *scaling;
    // offset: 000C (8 bytes)
    struct Spline *color;
    // offset: 0010 (8 bytes)
    struct SplineDef curPositional;
    // offset: 0018 (8 bytes)
    struct SplineDef curRotational;
    // offset: 0020 (8 bytes)
    struct SplineDef curScaling;
    // offset: 0028 (8 bytes)
    struct SplineDef curColor;
    // offset: 0030 (32 bytes)
    struct MATRIX curRotMatrix;
} MultiSpline;

unsigned long SplineGetOffsetNext(Spline *spline, SplineDef *def, long fracOffset);
unsigned long SplineGetData(Spline *spline, SplineDef *def, void *p);
unsigned short SplineGetFrameNumber(Spline *spline, SplineDef *def);
G2Quat *SplineGetFirstRot(RSpline *rspline, SplineDef *def);
SVector *SplineGetFirstPoint(Spline *spline, SplineDef *def);
SVector *SplineGetNearestPoint(Spline *spline, SVector *point, SplineDef *def);

#endif
