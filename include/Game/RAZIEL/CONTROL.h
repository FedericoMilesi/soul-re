#ifndef CONTROL_H_
#define CONTROL_H_

#include "common.h"

void SetExternalForce(Force *In, short x, short y, short z, short Space, int Friction);
void ApplyExternalLocalForces(Player *player, Instance *instance, Force *Forces, int MaxForces, Vector *Out);
void SetPhysics(Instance *instance, short gravity, long x, long y, long z);
void SetDropPhysics(Instance *instance, Player *player);
void ResetPhysics(Instance *instance, short gravity);

#endif
