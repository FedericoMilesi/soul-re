#ifndef _MONTABLE_H_
#define _MONTABLE_H_

#include "common.h"

void *MONTABLE_GetInitFunc(Instance *instance);
void *MONTABLE_GetDamageEffectFunc(Instance *instance);
MonsterState *MONTABLE_GetStateFuncs(Instance *instance, int state);
void *MONTABLE_GetCleanUpFunc(Instance *instance);
void MONTABLE_SetQueryFunc(Instance *instance);
void MONTABLE_SetMessageFunc(Instance *instance);
void MONTABLE_SetupTablePointer(Object *object);

#endif
