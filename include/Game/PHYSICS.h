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

#endif
