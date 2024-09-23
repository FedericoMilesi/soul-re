#ifndef CONTROL_H_
#define CONTROL_H_

#include "common.h"
#include "Game/PLAYER.h"

// size: 0x14
typedef struct __Force {
    // offset: 0000
    int Type;
    // offset: 0004 (12 bytes)
    struct _Vector LinearForce;
    // offset: 0010
    short Friction;
} Force;

void SetExternalForce(Force *In, short x, short y, short z, short Space, int Friction);
void ApplyExternalLocalForces(Player *player, Instance *instance, Force *Forces, int MaxForces, Vector *Out);
void SetPhysics(Instance *instance, short gravity, long x, long y, long z);

#endif
