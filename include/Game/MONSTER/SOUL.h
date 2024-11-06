#ifndef _SOUL_H_
#define _SOUL_H_

#include "common.h"

void SOUL_SoulSuckEntry(Instance *instance);
void SOUL_SoulSuck(Instance *instance);
void SOUL_BirthEntry(Instance *instance);
void SOUL_Birth(Instance *instance);
void SOUL_FleeEntry(Instance *instance);
void SOUL_Flee(Instance *instance);
void SOUL_IdleEntry(Instance *instance);
void SOUL_Idle(Instance *instance);
void SOUL_WanderEntry(Instance *instance);
void SOUL_Wander(Instance *instance);
void SOUL_ReanimateEntry(Instance *instance);
void SOUL_Reanimate(Instance *instance);

extern MonsterFunctionTable SOUL_FunctionTable;

#endif