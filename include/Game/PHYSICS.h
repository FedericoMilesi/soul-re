#ifndef _PHYSICS_H_
#define _PHYSICS_H_

#include "common.h"
#include "Game/STATE.h"

void PHYSICS_CheckLineInWorldMask(Instance *instance, PCollideInfo *pcollideInfo);
void PhysicsMove(Instance *instance, Position *position, long time);

#endif
