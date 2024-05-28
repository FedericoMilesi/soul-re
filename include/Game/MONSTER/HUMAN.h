#ifndef _HUMAN_H_
#define _HUMAN_H_

#include "common.h"
#include "Game/MONSTER/MONTABLE.h"

Instance *HUMAN_CreateWeapon(Instance *instance, int weaponid, int segment);
void HUMAN_Init(Instance *instance);
int HUMAN_TypeOfHuman(Instance *instance);

extern MonsterFunctionTable HUMAN_FunctionTable;

#endif
