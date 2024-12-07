#ifndef _OBTABLE_H_
#define _OBTABLE_H_

#include "common.h"

extern ObjectAccess objectAccess[];

void OBTABLE_GetInstanceAdditionalCollideFunc(Instance *instance);
void OBTABLE_GetInstanceMessageFunc(Instance *instance);
void OBTABLE_GetInstanceQueryFunc(Instance *instance);
void OBTABLE_GetInstanceProcessFunc(Instance *instance);
void OBTABLE_GetInstanceCollideFunc(Instance *instance);
void OBTABLE_InstanceInit(Instance *instance);
void OBTABLE_InitAnimPointers(ObjectTracker *objectTracker);
void OBTABLE_RemoveObjectEntry(Object *object);
void OBTABLE_RelocateObjectTune(Object *object, long offset);
void OBTABLE_RelocateInstanceObject(Instance *instance, long offset);
void OBTABLE_ChangeObjectAccessPointers(Object *oldObject, Object *newObject);
void OBTABLE_InitObjectWithID(Object *object);
Object *OBTABLE_FindObject(char *objectName);
void OBTABLE_ClearObjectReferences();

#endif
