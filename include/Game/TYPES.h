#ifndef _TYPES_H_
#define _TYPES_H_

// size: 0x6
typedef struct _Position {
    // offset: 0000
    short x;
    // offset: 0002
    short y;
    // offset: 0004
    short z;
} Position;

// size: 0x20
typedef struct MATRIX {
    // offset: 0000 (18 bytes)
    short m[3][3];
    // offset: 0014 (12 bytes)
    long t[3];
} MATRIX;

// size: 0x10
typedef struct VECTOR {
    // offset: 0000
    long vx;
    // offset: 0004
    long vy;
    // offset: 0008
    long vz;
    // offset: 000C
    long pad;
} VECTOR;

// size: 0x8
typedef struct SVECTOR {
    // offset: 0000
    short vx;
    // offset: 0002
    short vy;
    // offset: 0004
    short vz;
    // offset: 0006
    short pad;
} SVECTOR;

// size: 0x8
typedef struct _SVector {
    // offset: 0000
    short x;
    // offset: 0002
    short y;
    // offset: 0004
    short z;
    // offset: 0006
    short pad;
} SVector;

// size: 0x4
typedef struct DVECTOR {
    // offset: 0000
    short vx;
    // offset: 0002
    short vy;
} DVECTOR;

// size: 0x8
typedef struct _Rotation {
    // offset: 0000
    short x;
    // offset: 0002
    short y;
    // offset: 0004
    short z;
    // offset: 0006
    short pad;
} Rotation;

// size: 0x4
typedef struct CVECTOR {
    // offset: 0000
    unsigned char r;
    // offset: 0001
    unsigned char g;
    // offset: 0002
    unsigned char b;
    // offset: 0003
    unsigned char cd;
} CVECTOR;

#endif
