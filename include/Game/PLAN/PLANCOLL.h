#ifndef _PLANCOLL_H_
#define _PLANCOLL_H_

#include "common.h"

// size: 0x10
typedef struct _PlanCollideInfo
{
    // offset: 0000
    long StreamUnitID;
    // offset: 0004 (12 bytes)
    struct _TFace *tFace;
    // offset: 0008 (6 bytes)
    struct _Position collidePos;
} PlanCollideInfo;

// size: 0x4
typedef struct _fth
{
    // offset: 0000
    char x;
    // offset: 0001
    char y;
    // offset: 0002
    char z;
    // offset: 0003
    char nodeType;
} FindTerrainHit;

int PLANCOLL_DoesStraightLinePathExist(Position *startPos, Position *endPos, int collideType);
int PLANCOLL_DoesLOSExistFinal(Position *startPos, Position *endPos, int collideType, int passThroughHit, int zoffset);

#endif
