#ifndef _PHYSICS_H_
#define _PHYSICS_H_

#include "Game/TYPES.h"

// size: 0x18
typedef struct evPhysicsLinkedMoveData {
    // offset: 0000 (668 bytes)
    struct _Instance *instance;
    // offset: 0004
    int segment;
    // offset: 0008 (8 bytes)
    struct _SVector posDelta;
    // offset: 0010 (8 bytes)
    struct _SVector rotDelta;
} evPhysicsLinkedMoveData;

// size: 0xC
typedef struct evPhysicsGravityData {
	// offset: 0000
	short UpperOffset;
	// offset: 0002
	short LowerOffset;
	// offset: 0004
	short x;
	// offset: 0006
	short y;
	// offset: 0008
	short z;
	// offset: 000A
	short slipSlope;
} evPhysicsGravityData;

#endif
