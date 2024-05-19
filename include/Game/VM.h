#ifndef _VM_H_
#define _VM_H_

#include "TYPES.h"

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
} _VMObject;

typedef struct _VMOffsetTable VMOffsetTable;

typedef struct _VMObject VMObject;

#endif
