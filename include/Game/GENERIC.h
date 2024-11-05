#ifndef _GENERIC_H_
#define _GENERIC_H_

#include "common.h"

unsigned long GenericQuery(Instance *instance, unsigned long query);
void GenericInit(Instance *instance, GameTracker *gameTracker);
void GenericCollide();
void GenericProcess(Instance *instance, GameTracker *gameTracker);
void GenericMessage(Instance *instance, unsigned long message, unsigned long data);
void GenericRelocateTune(Object *object, long offset);

#endif
