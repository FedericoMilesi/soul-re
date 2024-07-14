#ifndef _PHYSICS_H_
#define _PHYSICS_H_

#include "common.h"
#include "Game/STATE.h"

void PHYSICS_CheckLineInWorldMask(Instance *instance, PCollideInfo *pcollideInfo);
void PhysicsMove(Instance *instance, Position *position, long time);
void PhysicsSetVelFromRot(Instance *instance, Rotation *rot, long magnitude);
int PhysicsCheckGravity(Instance *instance, int Data, short Mode);
int PhysicsCheckSwim(Instance *instance, int Data, short Mode);
int PhysicsCheckDropHeight(Instance *instance, int Data, int Mode);
void PhysicsSetVelFromZRot(Instance *instance, short angle, long magnitude);
void PhysicsDefaultLinkedMoveResponse(Instance *instance, evPhysicsLinkedMoveData *Data, int updateTransforms);
void PhysicsDefaultGravityResponse(Instance *instance, evPhysicsGravityData *Data);

#endif
