#ifndef _MONSENSE_H_
#define _MONSENSE_H_

#include "common.h"
#include "Game/MONSTER/MONAPI.h"

MonsterIR *MONSENSE_SetEnemy(Instance *instance, Instance *newenemy);
void MONSENSE_DoSenses(Instance *instance);

#endif
