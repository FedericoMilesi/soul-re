#ifndef _PHYSICS_H_
#define _PHYSICS_H_

#include "common.h"

void PHYSICS_CheckLineInWorldMask(Instance *instance, PCollideInfo *pcollideInfo);
void PhysicsMove(Instance *instance, Position *position, long time);
void PhysicsSetVelFromRot(Instance *instance, Rotation *rot, long magnitude);
int PhysicsCheckGravity(Instance *instance, intptr_t Data, short Mode);
int PhysicsCheckSwim(Instance *instance, intptr_t Data, short Mode);
int PhysicsCheckDropHeight(Instance *instance, int Data, int Mode);
void PhysicsSetVelFromZRot(Instance *instance, short angle, long magnitude);
void PhysicsDefaultLinkedMoveResponse(Instance *instance, evPhysicsLinkedMoveData *Data, int updateTransforms);
void PhysicsDefaultGravityResponse(Instance *instance, evPhysicsGravityData *Data);
void PhysicsMoveLocalZClamp(Instance *instance, long segment, long time, long clamp);
void PHYSICS_StopIfCloseToTarget(Instance *instance, int x, int y, int z);
long PHYSICS_FindAFromDAndT(long d, long t);
long PHYSICS_FindVFromAAndD(long a, long d);
void PHYSICS_SetVAndAFromRot(Instance *instance, Rotation *rot, long v, long a);
void PHYSICS_CheckLineInWorld(Instance *instance, PCollideInfo *pcollideInfo);
int PHYSICS_CheckFaceStick(PCollideInfo *CInfo);
void PHYSICS_GenericLineCheck(Instance *instance, MATRIX *transMat, MATRIX *rotMat, PCollideInfo *cInfo);
void PHYSICS_GenericLineCheckMask(Instance *instance, MATRIX *transMat, MATRIX *rotMat, PCollideInfo *cInfo);
int PhysicsCheckSliding(Instance *instance, int Data, short Mode);
int PhysicsDefaultCheckSwimResponse(Instance *instance, evPhysicsSwimData *Data);

#endif
