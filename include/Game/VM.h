#ifndef _VM_H_
#define _VM_H_

#include "common.h"

// size: 0x6
typedef struct _VMOffset {
    // offset: 0000
    short dx;
    // offset: 0002
    short dy;
    // offset: 0004
    short dz;
} VMOffset;

// size: 0x3
typedef struct _VMColorOffset {
    // offset: 0000
    char dr;
    // offset: 0001
    char dg;
    // offset: 0002
    char db;
} VMColorOffset;

// size: 0xC
typedef struct _VMOffsetTable {
    // offset: 0000
    long numVMOffsets;
    // offset: 0004 (6 bytes)
    // size: 0x6
    union {
        // offset: 0000 (6 bytes)
        struct _VMOffset moveOffsets;
        // offset: 0000 (3 bytes)
        struct _VMColorOffset colorOffsets;
    } offsets;
} VMOffsetTable;

// size: 0x3C
typedef struct _VMObject {
    // offset: 0000
    unsigned short flags;
    // offset: 0002
    short bspIdx;
    // offset: 0004
    short materialIdx;
    // offset: 0006
    short spectralIdx;
    // offset: 0008
    short currentIdx;
    // offset: 000A
    short timeScale;
    // offset: 000C
    long timer;
    // offset: 0010 (6 bytes)
    struct _Position position;
    // offset: 0016
    short radius;
    // offset: 0018
    long radiusSquared;
    // offset: 001C
    long numVMOffsetTables;
    // offset: 0020 (12 bytes)
    struct _VMOffsetTable **vmoffsetTableList;
    // offset: 0024 (12 bytes)
    struct _VMOffsetTable *curVMOffsetTable;
    // offset: 0028
    long numVMVertices;
    // offset: 002C
    void *vmvertexList;
    // offset: 0030
    long numVMInterpolated;
    // offset: 0034 (8 bytes)
    struct _VMInterpolated *vminterpolatedList;
    // offset: 0038
    char *name;
} VMObject;

#endif
